unit uConexaoRemota;

interface

uses  SysUtils, Windows, Dialogs;

Function VerificaConexao(pDrive,pPath,pPsw:String):Integer;

implementation

Function VerificaConexao(pDrive,pPath,pPsw:String):Integer;
// pDrive: Drive remoto a ser conectado
// pPath: Caminho de conexão
// pPsw: Senha para conexão
// Retorno:  = 0 --> OK
//           <> 0 --> Erro do sistema (Exceto 85 - conexão já existe)
//
var LinDd: String;
    PServer,PLetra,PSenha: PChar;
    Err: Word;
begin
  pDrive := AnsiUpperCase(pDrive);
  if (pDrive = 'LOCAL') or (pDrive = 'LOCAL:') or (pDrive = 'C') or (pDrive = 'C:')
  then begin
    Result := 0;
    Exit;
  end;
  PLetra  := PChar(pDrive);
  PServer := PChar(pPath);
  PSenha  := PChar(pPsw);
  Err     := WNetAddConnection(PServer,PSenha,PLetra);
  if (Err = ERROR_ALREADY_ASSIGNED) or        // Já existe a conexão para a letra
     (Err = ERROR_DEVICE_ALREADY_REMEMBERED)
  then begin
    WNetCancelConnection(PLetra,True);
    Err := WNetAddConnection(PServer,PSenha,PLetra);
  end;
  if (Err = 0) or                      // Conexão OK
     (Err = ERROR_ALREADY_ASSIGNED)    // 'A letra do drive especificada já está conectada.'
  then begin
    Result := 0;
    Exit;
  end;

  Result := Err;
  case Err of
    ERROR_ACCESS_DENIED:             LinDd := 'Acesso negado.';
    ERROR_BAD_DEV_TYPE:              LinDd := 'O tipo de dispositivo e o tipo de recurso nao sao compatíveis.';
    ERROR_BAD_DEVICE:                LinDd := 'Letra inválida.';
    ERROR_BAD_NET_NAME:              LinDd := 'Nome do servidor nao é válido ou nao pode ser localizado.';
    ERROR_BAD_PROFILE:               LinDd := 'Formato incorreto de parâmetros.';
    ERROR_CANNOT_OPEN_PROFILE:       LinDd := 'Conexao permanente nao disponível.';
    ERROR_DEVICE_ALREADY_REMEMBERED: LinDd := 'Uma entrada para o dispositivo especificado já está no  perfil do usuário.';
    ERROR_EXTENDED_ERROR:            LinDd := 'Erro de rede.';
    ERROR_INVALID_PASSWORD:          LinDd := 'Senha especificada inválida.';
    ERROR_NO_NET_OR_BAD_PATH:        LinDd := 'A operaçao nao foi concluída porque a rede nao foi inicializada  ou caminho é inválido.';
    ERROR_NO_NETWORK:                LinDd := 'A rede nao está presente.';
    else LinDd := 'Erro indefinido';
  end;
  MessageDlg('Erro de conexão' + #13 +
             LinDd + '   Erro: [' + IntToSTr(Err) + ']' + #13 +
             'Servidor: ' + pPath + #13 +
             'Drive: ' + pDrive + #13 +
             'Senha: ' + pPsw + #13 +
             'Comunicação impossibilitada',mtError,[mbOk],0);

end;


{
Function DesconectaUnidade(PathConex:ShortString;Msg:Boolean):Boolean; Stdcall; Export;
// PathConex: Arquivo de texto com os dados da conexão
// Retorno: True-> OK, desconectado
//          False-> Não desconectado
// PathConex.inf = arquivo com os dados da conexao, na máquina local !!!!!  (Nome completo)
//         Drive=letra que deve ser associada;   (Ex.: G;)
//         Path=caminho da conexão; (Ex.: \\Superestagiario\C;)
//         Senha=senha de acesso ao recurso; (Ex.: password;)
var Drive,Desconex,LinDd: String;
    PLetra: PChar;
    Err: Word;
begin
  Result := True;
  LinDd := '';
  Drive := Le_Param(PathConex,'DRIVE');
  Desconex := Le_Param(PathConex,'DESCO');
  if (AnsiUpperCase(Drive) = 'LOCAL:') or (AnsiUpperCase(Drive) = 'C:') or
     (Length(Trim(Drive)) = 0) then Desconex := 'N';
  if Desconex = 'S'
  then begin
    PLetra := PChar(Drive);
    WNetCancelConnection2(PLetra,0,True);
    Err := GetLastError();
    if (Err > 0) and (Err <> 997)
    then begin
      LinDd := 'Erro desconhecido.';
      case Err of
        1205:LinDd := 'Não foi possível abrir o perfil';
        1206:LinDd := 'Perfil do usuário não encontrado ou inválido';
        1208:LinDd := 'Ocorreu um Erro específico na rede.';
        2138:LinDd := 'Rede não encontrada ou fora do ar.';
        2250:LinDd := 'Mapeamento inválido ou não encontrado.';
        2401:LinDd := 'Existem muitos arquivos abertos.';
      end;
    end;
  end;

  if Length(LinDd) > 0       // Erro detectado
  then begin
    Result := False;
    if Msg then MessageDlg('Erro na desconexão' + #13 +
                           LinDd + '   Erro: [' + IntToSTr(Err) + ']' + #13 +
                           'Drive: ' + Drive,mtError,[mbOk],0);
  end;

end;


Procedure DesconexaoDialog(PathConex:ShortString); Stdcall; Export;
// PathConex: Arquivo de texto com os dados da conexão
// PathConex.inf = arquivo com os dados da conexao, na máquina local !!!!!
//         Drive=letra que deve ser associada;   (Ex.: G;)
//         Path=caminho da conexão; (Ex.: \\Superestagiario\C;)
//         Senha=senha de acesso ao recurso; (Ex.: password;)
var Drive,Desconex,Msg: String;
    PLetra: PChar;
    Err: Word;
begin
  Drive := Le_Param(PathConex,'DRIVE');
  Desconex := Le_Param(PathConex,'DESCO');
  if (AnsiUpperCase(Drive) = 'LOCAL:') or (AnsiUpperCase(Drive) = 'C:') or
     (Length(Trim(Drive)) = 0) then Desconex := 'N';
  if Desconex = 'S'
  then begin
    Msg := '';
    Err := WNetDisconnectDialog(0,RESOURCETYPE_DISK);   // RESOURCETYPE_PRINT
    case Err of
      ERROR_EXTENDED_ERROR: Msg := 'Ocorreu um erro na rede';  // To get a description of the error, use the WNetGetLastError function.
      ERROR_NO_NETWORK: Msg := 'Não há rede presente';
      ERROR_NOT_ENOUGH_MEMORY: Msg := 'Memória insuficiente para iniciar o dialog box.';
    end;
    if Length(Msg) > 0 then MessageDlg(Msg,mtWarning,[mbOk],0);
  end;

end;


Function DB_Identif(PathConex:ShortString):ShortString; Stdcall; Export;
// PathConex: Arquivo de texto (.inf) com os dados da conexão
// Retorno:  Nome do banco de dados
// PathConex.inf = arquivo com os dados da conexao, na máquina local !!!!!
//         Banco=nome do banco de dados;  (Ex.: SysInteg;)
begin
  Result := Le_Param(PathConex,'BANCO');

end;


Function ConectaBanco(BD,Tabela:ShortString):Boolean; Stdcall; Export;
// Faz o conexão com banco de dados (Tenta abrir uma tabela);
// Retorno: True->Ok, Banco existe    False->NOK, Banco NÃO existe
var Mens: String;
begin
  FRDB0 := TFRDB0.Create(nil);
  FRDB0.Table1.DatabaseName := BD;
  FRDB0.Table1.TableName := Tabela;
  Try
    FRDB0.Table1.Active := True;
    FRDB0.Table1.Active := False;
    Result := True;
  Except
    Result := False;
    Mens := 'CONEXÃO - BD inexistente  [ ' + BD + ' ]' + #13 +
            'ou não contém ' + Tabela + #13 + 'Rotina cancelada';
    MessageBox(0,Pchar(Mens),'ERRO',MB_ICONSTOP);
  End;
  FRDB0.Release;

end;


Function DB_Paths(PathConex:ShortString;Info:Word):ShortString; Stdcall; Export;
// PathConex: Arquivo de texto (.inf) com os dados da conexão
// Retorno:  Patch do banco de dados
// PathConex.inf = arquivo com os dados da conexao, na máquina local !!!!!
// Info: 0 (Zero-Banco de dados) ou  1 (Um-BackUp)
const WInf: array[0..1] of String = ('BDPATH=','BACKUP=');
begin
  if Info > 1 then Info := 1;
  Result := Le_Param(PathConex,WInf[Info]);

end;

}
end.
