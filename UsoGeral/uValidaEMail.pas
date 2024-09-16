unit uValidaEMail;

interface
  uses SysUtils;
  Function ValidaEMail(pEMailIn:String):Boolean;

implementation

Function ValidaEMail(pEMailIn:String):Boolean;
var wEMail: String;
    npArrob,npPto,npHif,npUnd,npBran: Integer;
    ctArrob,ctInval,i: integer;
const xValid: string = ('0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz.-_@');
      xStInv: array[1..11] of String = ('..','.@','@.','.-','-.','._','_.','_@','@_','-@','@-');
begin
  Result := False;
  wEMail := Trim(pEMailIn);
  npArrob := Pos('@',wEMail);
  npPto := Pos('.',wEMail);
  npUnd := Pos('_',wEMail);
  npHif := Pos('-',wEMail);
  npBran := Pos(' ',wEMail);
  ctArrob := 0;
  ctInval := 0;
  if (Length(wEMail) = 0)                      // EMail N�O informado
     or (npArrob <= 1)                         // @ inexistente ou na 1a.posi��o
     or (npArrob =  Length(wEMail))            // @ na ultima posi��o
     or (npPto <= 1)                           // . inexistente ou na 1a. posi��o
     or (npPto = Length(wEMail))               // . na ultima posi��o
     or (npUnd = 1)                            // _ na 1a. posi��o
     or (npUnd = Length(wEMail))               // _ na ultima posi��o
     or (npHif = 1)                            // - na 1a. posi��o
     or (npHif = Length(wEMail))               // - na ultima posi��o
     or (npBran > 0)                           // h� branco no email
  then Exit;
  //
  for i := 1 to Length(wEMail)
  do if wEMail[i] = '@'
        then ctArrob := ctArrob + 1
        else if Pos(wEMail[i],xValid) = 0
             then ctInval := ctInval + 1;
  for i := 1 to Length(xStInv)
  do if Pos(xStInv[i],wEMail) > 0
        then ctInval := ctInval + 1;
  //
  if (ctArrob <> 1)
     or (ctInval > 0)
  then Exit;
  //
  Result := True;

end;

end.
