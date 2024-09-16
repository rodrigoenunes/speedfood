unit uProcessos;

interface
  uses Windows, TLHelp32, SysUtils, QDialogs;
  Function exProcessoAtivo(pExeName:String; pExibMsg:Boolean; pAlter:Boolean): Integer;
  Function exKillProcess(pExeName:String; pExibMsg:Boolean): Boolean;
  Function exVerificaFinalizaProcesso(pExeName:String; pExibMsg:Boolean; pAlter:Boolean): Boolean;
  Function ProcessosConflitantes(pAplicacao:String; pConflitos:array of String):Boolean;
  Function VerificaPreRequisitos(pPreReq: array of String; pPath, pExec: String): Boolean;


implementation

const
   xTitle: String = 'Verifica��o';

Function exProcessoAtivo(pExeName:String; pExibMsg:Boolean; pAlter:Boolean): Integer;
// Parametros  pExeName: Nome do processo (executavel)
//             pExibMsg: True-Exibe mensagem, False-N�o exibe mensagem
//             pAlter:   True-Permite outro processo,  False-N�O permite outro processo
//
// Retorno     0-Processo n�o existe
//             3-Anteriormente ATIVO, finalizar TODAS as instancias do processo                  (mbYes)
//             4-Anteriormente ATIVO, n�o finalizar nenhuma instancia do processo e inicia novo  (mbNo)
//             5-Anteriormente ATIVO, abortar processo atual (n�o inicia)                        (mbAbort)
// Valores de retorno de MessageDlg
// Obs: Se processo anteriormente ativo e N�O exibe mensagem o retorno ser� 5 (mbAbort)
var wAplic: String;
begin
  Result := 0;
  CreateMutex(nil,False,PChar(pExeName));
  if GetLastError = ERROR_ALREADY_EXISTS
  then begin
    wAplic := UpperCase(pExeName);
    if Pos('.EXE',wAplic) = 0
       then wAplic := wAplic + '.EXE';
    if pExibMsg
    then begin
      if pAlter
      then Result := MessageDlg(xTitle
                                ,wAplic + ' em execu��o, finalizar todas as instancias anteriores do processo ?'
                                ,mtCustom
                                ,[mbYes,mbNo,mbAbort]
                                ,0
                                ,mbYes)
      else Result := MessageDlg(xTitle
                                ,wAplic + ' em execu��o, finalizar instancias anteriores ?'
                                ,mtCustom
                                ,[mbYes,mbAbort]
                                ,0
                                ,mbAbort);
    end
    else begin
      Result := 5;       // Permite instancias anteriores
      if not pAlter
      then begin         // Encerra TODAS as instancias anteriores
        //MessageDlg(xTitle
        //           ,wAplic + ' em execu��o, processo N�O iniciado'
        //           ,mtError,[mbOk],0);
        Result := 3;
      end;
    end;
  end;

end;


Function exKillProcess(pExeName:String; pExibMsg:Boolean): Boolean;
var
  ContinueLoop: Boolean;
  FSnapshotHandle: THandle;
  FProcessEntry32: TProcessEntry32;
  ctaProc,i,nKills,nErros: Integer;
  nProcessos: array[0..299] of Integer;
  procExeFileName,procExeFile: String;

begin
  Result := True;
  pExeName := UpperCase(pExeName);
  for i := 0 to 299
    do nProcessos[i] := -1;
  //
  ctaProc := 0;
  FSnapshotHandle := CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0);
  FProcessEntry32.dwSize := SizeOf(FProcessEntry32);
  ContinueLoop := Process32First(FSnapshotHandle, FProcessEntry32);
  while ContinueLoop
  do begin
    procExeFileName := UpperCase(ExtractFileName(FProcessEntry32.szExeFile));
    procExeFile := UpperCase(FProcessEntry32.szExeFile);
    if (procExeFileName = pExeName)
      or (procExeFile = pExeName)
    then begin
      nProcessos[ctaProc] := FProcessEntry32.th32ProcessID;
      ctaProc := ctaProc + 1;
    end;
    ContinueLoop := Process32Next(FSnapshotHandle, FProcessEntry32);
    if ctaProc > 99
    then begin
      ctaProc := 99;
      ContinueLoop := False;
    end;
  end;
  //
  nKills := 0;
  nErros := 0;
  ContinueLoop := Process32First(FSnapshotHandle, FProcessEntry32);
  while ContinueLoop
  do begin
    for i := 0 to ctaProc-2
    do if FProcessEntry32.th32ProcessID = nProcessos[i]
       then begin
         Try
           TerminateProcess(OpenProcess(PROCESS_TERMINATE,
                            BOOL(0),
                            FProcessEntry32.th32ProcessID),
                            0);
           nKills := nKills + 1;
         Except
           nErros := nErros + 1;
         End;
         Break;
       end;
    ContinueLoop := Process32Next(FSnapshotHandle, FProcessEntry32);
  end;
  CloseHandle(FSnapshotHandle);
  if nErros > 0
  then begin
    Result := False;
    MessageDlg('Verifica��o de processos',
               IntToStr(nErros) + ' processo(s) N�O finalizado(s) [' + pExeName + ']',
               mtError,[mbOk],0);
  end
  else if pExibMsg         // nKills > 0
       then MessageDlg('Verifica��o de processos',
                       IntToStr(nKills) + ' processo(s) finalizado(s) [' + pExeName + ']',
                       mtInformation,[mbOk],0);

end;


Function exVerificaFinalizaProcesso(pExeName:String; pExibMsg:Boolean; pAlter:Boolean): Boolean;
// Parametros  pExeName: Nome do processo (executavel)
//             pExibMsg: True-Exibe mensagem, False-N�o exibe mensagem
//             pAlter:   True-Permite outro processo,  False-N�O permite outro processo
// Retorno     True   processo pode ser iniciado
//             False  processo N�O pode ser iniciado
var nAcao: Integer;
begin
  nAcao := exProcessoAtivo(pExeName, pExibMsg, pAlter);
  case nAcao of
    3:Result := exKillProcess(pExeName, pExibMsg);
    0,4:Result := True;
    else Result := False;       // 5:
  end;

end;


{ -- Original
function killtask(ExeFileName: string): Integer;
const
  PROCESS_TERMINATE = $0001;
var
  ContinueLoop: BOOL;
  FSnapshotHandle: THandle;
  FProcessEntry32: TProcessEntry32;
begin
  Result := 0;
  FSnapshotHandle := CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0);
  FProcessEntry32.dwSize := SizeOf(FProcessEntry32);
  ContinueLoop := Process32First(FSnapshotHandle, FProcessEntry32);
  while Integer(ContinueLoop) <> 0 do
  begin
    if ((UpperCase(ExtractFileName(FProcessEntry32.szExeFile)) =
      UpperCase(ExeFileName)) or (UpperCase(FProcessEntry32.szExeFile) =
      UpperCase(ExeFileName))) then
      Result := Integer(TerminateProcess(
                        OpenProcess(PROCESS_TERMINATE,
                                    BOOL(0),
                                    FProcessEntry32.th32ProcessID),
                                    0));
     ContinueLoop := Process32Next(FSnapshotHandle, FProcessEntry32);
  end;
  CloseHandle(FSnapshotHandle);
end;
// Uso: killtask('notepad.exe');
--------------- }

Function ProcessosConflitantes(pAplicacao:String; pConflitos:array of String):Boolean;
var i,nConf: Integer;
    wMsg,wAtivo: String;
    nHand: THandle;
begin
  Result := False;
  nConf  := 0;
  wMsg   := '';
  for i  := 0 to Length(pConflitos)-1
  do begin
    wAtivo := pConflitos[i];
    nHand  := FindWindow(nil,PChar(wAtivo));
    if nHand <> 0
    then begin
      nConf := nConf + 1;
      wMsg  := wMsg + '[ ' + wAtivo + ' ]' + #13;
    end;
  end;
  if nConf = 0
  then Result := True
  else begin
    wMsg := 'Aplica��o [ ' + pAplicacao + ' ]' + #13
            + 'N�o pode ser executada, h� ' + IntToStr(nConf) + ' processo(s) conflitante(s) ativo(s)' + #13
            + wMsg + #13
            + 'Feche o(s) processo(s) indicado(s) e reinicie a aplica��o atual';
    MessageBox(0,PChar(wMsg),'ERRO',MB_ICONSTOP);
  end;
{
   MessageDlg('Aplica��o [ ' + pAplicacao + ' ]' + #13
                  + 'N�o pode ser executada, h� ' + IntToStr(nConf) + ' processo(s) conflitante(s) ativo(s)' + #13
                  + wMsg + #13
                  + 'Feche o(s) processo(s) indicado(s) e reinicie a aplica��o atual'
                  ,mtError,[mbOk],0);
}
end;


Function  VerificaPreRequisitos(pPreReq: array of String; pPath, pExec: String): Boolean;
// pPreReq: array com os pr�-requisitos necess�rios (DLLs, Ini, etc)  ex: ['libeay32.dll','ssleay32.dll','cfgemail.ini','xyz.dll']
// pExec:   nome do execut�vel
// pPath:   path de onde o execut�vel � ativado
var i,nErros: Integer;
    wArqPReq: String;
    wMsg: String;
begin
  Result := True;
  nErros := 0;
  wMsg   := '';
  for i := 0 to Length(pPreReq)-1
  do begin
    wArqPReq := pPath + pPreReq[i];
    if not FileExists(wArqPReq)
    then begin
      wMsg   := wMsg + '[ ' + wArqPReq + ' ]' + #13;
      nErros := nErros + 1;
    end;
  end;
  if nErros > 0
  then begin
    wMsg := 'Pr�-requisitos n�o encontrados [' + IntToStr(nErros) + ']' + #13
         + wMsg + #13
         + 'DLL / Ini obrigat�rias no diret�rio do executavel' + #13
         + 'Execut�vel: ' + pPath + pExec + #13 
         + 'Sistema n�o iniciado, avise o suporte';
    MessageBox(0,PChar(wMsg),'ERRO',MB_OK);
    Result := False;
  end;

end;





end.
