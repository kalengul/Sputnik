unit UObj;

interface

Uses Classes, Graphics;

Type
  TStation = record
             Sh,Dl,YgolMesta:Real;
             Text,Name,Contry,Chisl:String[200];
             Sezonnost:boolean;
             end;
  PStation = ^TPStation;
  TPStation = record
             St:TStation;
             SatteliteVisible: array of boolean;
             Next:PStation;
             end;

  PTraektory =^TTraektory;
  TTraektory = record
               Sh,Dl:real;
               Next:PTraektory;
               end;

  TSattelite = record
               Sh,Dl,H,YgolNaklona,DolgotaVoshYzla,ArgSh:Real;
               Text:string[200];
               ColorTraektory:TColor;
               end;
  PSattelite = ^TPSattelite;
  TPSattelite = record
               Sat:TSattelite;
               Choose:Boolean;
               Traektory,LastTraektory:PTraektory;
               Next:PSattelite;
               end;
  PSobitie = ^TSobitie;
  TSobitie = record
             Time:Real;
             Sobitie:Byte;
             Sattelite:Psattelite;
             Next:PSobitie;
             end;


var
  Station,SelectSta,LastStation:PStation;
  Sattelite,LastSattelite:PSattelite;
  Sobitie,LastSobitie:PSobitie;

Procedure AddStation(NewStation:PStation);
Procedure AddSattelite(NewSattelite:PSattelite);
Procedure AddSobitie(NewSobitie:PSobitie);
Procedure Addtraektory(Sattelite:pSattelite; NewTraektory:PTraektory);
Procedure DeletTraektory(Sattelite:PSattelite);

implementation


Procedure AddStation(NewStation:PStation);
  begin
  If Station=nil then
    begin
    Station:=NewStation;    //��������� ������� - ������
    LastStation:=NewStation;
    end
  else
    begin
    LastStation.Next:=NewStation;  //���������� ��������� ������� � ����� ������ ������
    LastStation:=NewStation;
    end;
  end;

Procedure AddSattelite(NewSattelite:PSattelite);
  begin
  If Sattelite=nil then
    begin
    Sattelite:=NewSattelite;    //��������� ������� - ������
    LastSattelite:=NewSattelite;
    end
  else
    begin
    LastSattelite.Next:=NewSattelite;  //���������� ��������� ������� � ����� ������ ������
    LastSattelite:=NewSattelite;
    end;
  end;

Procedure AddTraektory(Sattelite:Psattelite; NewTraektory:PTraektory);
  begin
  If Sattelite.Traektory=nil then
    begin
    Sattelite.Traektory:=NewTraektory;    //��������� ������� - ������
    Sattelite.LastTraektory:=NewTraektory;
    end
  else
    begin
    Sattelite.LastTraektory.Next:=NewTraektory;  //���������� ��������� ������� � ����� ������ ������
    Sattelite.LastTraektory:=NewTraektory;
    end;
  end;

Procedure AddSobitie(NewSobitie:PSobitie);
  begin
  If Sobitie=nil then
    begin
    Sobitie:=NewSobitie;    //��������� ������� - ������
    LastSobitie:=NewSobitie;
    end
  else
    begin
    LastSobitie.Next:=NewSobitie;  //���������� ��������� ������� � ����� ������ ������
    LastSobitie:=NewSobitie;
    end;
  end;

Procedure DeletTraektory(Sattelite:PSattelite);
  var
    CTr,DTr:Ptraektory;
  begin
    CTr:=Sattelite.Traektory;
    While CTr<>nil do
      begin
      DTr:=CTr;
      CTr:=CTr.Next;
      DTr.Next:=nil;
      Dispose(DTr);
      end;
    Sattelite.Traektory:=nil;
    Sattelite.LastTraektory:=nil;
  end;

end.
