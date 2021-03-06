unit UAddSattelite;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Math, UObj;

type
  TFAddSattelite = class(TForm)
    YgolNaklonaTraektorii: TLabeledEdit;
    LeNameSattelite: TLabeledEdit;
    LEH: TLabeledEdit;
    LeDolgVoshYzla: TLabeledEdit;
    Label5: TLabel;
    CbTraektory: TColorBox;
    ArgShir: TLabeledEdit;
    LaKolSat: TLabel;
    Pbutton: TPanel;
    BtOk: TButton;
    btCansel: TButton;
    procedure BtGoSpytnikClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btCanselClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FAddSattelite: TFAddSattelite;

implementation

{$R *.dfm}

Uses UMainform,UVisible;

procedure TFAddSattelite.BtGoSpytnikClick(Sender: TObject);
var
  NewSattelite:PSattelite;
  DugaEkvatora,Tg:Real;
begin
  New(NewSattelite);
  NewSattelite.Next:=nil;
  NewSattelite.Sat.Text:=LeNameSattelite.Text;
  NewSattelite.Sat.H:=StrToFloat(LEH.Text);
  NewSattelite.Sat.YgolNaklona:=StrToFloat(YgolNaklonaTraektorii.Text);
  NewSattelite.Sat.DolgotaVoshYzla:=StrToFloat(LeDolgVoshYzla.Text);
  NewSattelite.Sat.ArgSh:=StrToFloat(ArgShir.Text);
  NewSattelite.Sat.Sh:=ArcSin(Sin(NewSattelite.Sat.YgolNaklona/180*pi)*Sin(NewSattelite.Sat.ArgSh/180*pi))/pi*180;
  Tg:=Abs(Tan(NewSattelite.Sat.Sh/180*pi)/Tan(NewSattelite.Sat.YgolNaklona/180*pi));
  if (NewSattelite.Sat.YgolNaklona<>0) and (NewSattelite.Sat.YgolNaklona<>180) and (Tg<=1) then  //�������� �� ����������� ����������� ���������
    DugaEkvatora:=ArcSin(Tg)  //���������� �������� �� ���� ��������
  else
    DugaEkvatora:=0;
  If (NewSattelite.Sat.ArgSh>90) and (NewSattelite.Sat.ArgSh<270) then DugaEkvatora:=180-DugaEkvatora;
  If (NewSattelite.Sat.ArgSh>270) and (NewSattelite.Sat.ArgSh<360) then DugaEkvatora:=DugaEkvatora+360;
  NewSattelite.Sat.Dl:=NewSattelite.Sat.DolgotaVoshYzla+DugaEkvatora;
  NewSattelite.Sat.ColorTraektory:=CbTraektory.Selected;
  NewSattelite.Traektory:=nil;
  NewSattelite.LastTraektory:=nil;
  NewSattelite.Choose:=true;
  Inc(KolSattelite);
  AddSattelite(NewSattelite);
  vivodSpytnik;
  FAddSattelite.Close;  
end;

procedure TFAddSattelite.FormActivate(Sender: TObject);
begin
LaKolSat.Caption:='���-�� ���������� ��������� - '+IntToStr(KolSattelite);
end;

procedure TFAddSattelite.btCanselClick(Sender: TObject);
begin
  FAddSattelite.Close;
end;

end.
