unit UAddStation;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, UMainForm, UObj;

type
  TNSozdStation = class(TForm)
    Label1: TLabel;
    EdSh0: TEdit;
    Panel1: TPanel;
    EdSh1: TEdit;
    Sh: TPanel;
    ShTip0: TPanel;
    ShTip1: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    EdShMin1: TEdit;
    Label5: TLabel;
    ShTip2: TPanel;                                              
    Label6: TLabel;
    Label7: TLabel;
    EdSh2: TEdit;
    EdShMin2: TEdit;
    EdShSek2: TEdit;
    Label8: TLabel;
    Dl: TPanel;
    DlTip2: TPanel;
    Label2: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    EdDl2: TEdit;
    EdDlMin2: TEdit;
    EdDlSek2: TEdit;
    DlTip1: TPanel;
    Label11: TLabel;
    Label12: TLabel;
    EdDl1: TEdit;
    EdDlMin1: TEdit;
    DlTip0: TPanel;
    Label13: TLabel;
    EdDl0: TEdit;
    Label14: TLabel;
    POpisanie: TPanel;
    GroupBox1: TGroupBox;
    MeOpisanie: TMemo;
    Pbutton: TPanel;
    BtOk: TButton;
    btCansel: TButton;
    PName: TPanel;
    LeKolChel: TLabeledEdit;
    Panel2: TPanel;
    LeName: TLabeledEdit;
    LeContry: TLabeledEdit;
    Panel12: TPanel;
    CbSeason: TCheckBox;
    LeYgolMesta: TLabeledEdit;
    procedure FormActivate(Sender: TObject);
    procedure BtOkClick(Sender: TObject);
    procedure btCanselClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  NSozdStation: TNSozdStation;

implementation

{$R *.dfm}

procedure TNSozdStation.FormActivate(Sender: TObject);
Var
Sh,Dl,MnSh,SkSh,MnDl,SkDl:real;
begin
MeOpisanie.Clear;
Case FormatKoord of
  0: begin
     DlTip0.Visible:=true;
     DlTip1.Visible:=false;
     DlTip2.Visible:=false;
     ShTip0.Visible:=true;
     ShTip1.Visible:=false;
     ShTip2.Visible:=false;
     end;
  1: begin
     DlTip0.Visible:=false;
     DlTip1.Visible:=true;
     DlTip2.Visible:=false;
     ShTip0.Visible:=false;
     ShTip1.Visible:=true;
     ShTip2.Visible:=false;
     end;
  2: begin
     DlTip0.Visible:=false;
     DlTip1.Visible:=false;
     DlTip2.Visible:=true;
     ShTip0.Visible:=false;
     ShTip1.Visible:=false;
     ShTip2.Visible:=true;
     end;
  end;
  If NSozdStation.Caption='Изменеие выбранной станции' then
    begin
    LeName.Text:=SelectSta.St.Name;
    LeContry.Text:=SelectSta.St.Contry;
    LeKolChel.Text:=SelectSta.St.Chisl;
    MeOpisanie.Text:=SelectSta.St.Text;
    CbSeason.Checked:=SelectSta.St.Sezonnost;
    LeYgolMesta.Text:=FloatToStr(SelectSta.St.YgolMesta);    
    Sh:=SelectSta.St.Sh;
    Dl:=SelectSta.St.Dl;
    GrToFormat(FormatKoord,Sh,MnSh,SkSh);
    GrToFormat(FormatKoord,Dl,MnDl,SkDl);
Case FormatKoord of
  0: begin
     EdSh0.Text:=FloatToStr(Sh);
     EdDl0.Text:=FloatToStr(Dl);
     end;
  1: begin
     EdSh1.Text:=FloatToStr(Sh);
     EdShMin1.Text:=FloatToStr(MnSh);
     EdDl1.Text:=FloatToStr(Dl);
     EdDlMin1.Text:=FloatToStr(MnDl);
     end;
  2: begin
     EdSh2.Text:=FloatToStr(Sh);
     EdShMin2.Text:=FloatToStr(MnSh);
     EdShSek2.Text:=FloatToStr(SkSh);
     EdDl2.Text:=FloatToStr(Dl);
     EdDlMin2.Text:=FloatToStr(MnDl);
     EdDlSek2.Text:=FloatToStr(SkDl);
     end;
  end;
    end;
end;

procedure TNSozdStation.BtOkClick(Sender: TObject);
var
  gr:real;
  CSta:PStation;
begin
  If NSozdStation.Caption<>'Изменеие выбранной станции' then
    begin
    New(CSta);
    CSta.Next:=nil;
    end;
  Case FormatKoord of
    0: Gr:=StrToFloat(EdSh0.Text);
    1: Gr:=StrToFloat(EdSh1.Text)+StrToFloat(EdShMin1.Text)/60;
    2: Gr:=StrToFloat(EdSh2.Text)+StrToFloat(EdShMin2.Text)/60+StrToFloat(EdShSek2.Text)/3600;
    end;
  If NSozdStation.Caption='Изменеие выбранной станции' then
    SelectSta.St.Sh:=-Gr
  else
    CSta.St.Sh:=-gr;
  Case FormatKoord of
    0: Gr:=StrToFloat(EdDl0.Text);
    1: Gr:=StrToFloat(EdDl1.Text)+StrToFloat(EdDlMin1.Text)/60;
    2: Gr:=StrToFloat(EdDl2.Text)+StrToFloat(EdDlMin2.Text)/60+StrToFloat(EdDlSek2.Text)/3600;
    end;
  If NSozdStation.Caption='Изменеие выбранной станции' then
    begin
    SelectSta.St.Dl:=gr;
    SelectSta.St.Name:=LeName.Text;
    SelectSta.St.Sezonnost:=CbSeason.Checked;
    SelectSta.St.Contry:=LeContry.Text;
    SelectSta.St.Chisl:=LeKolChel.Text;
    SelectSta.St.YgolMesta:=StrToFloat(LeYgolMesta.Text);
    SelectSta.St.Text:=MeOpisanie.Lines.Text;
    end
  else
    begin
    CSta.St.Dl:=gr;
    CSta.St.Name:=LeName.Text;
    CSta.St.Sezonnost:=CbSeason.Checked;
    CSta.St.Contry:=LeContry.Text;
    CSta.St.Chisl:=LeKolChel.Text;
    CSta.St.YgolMesta:=StrToFloat(LeYgolMesta.Text);
    CSta.St.Text:=MeOpisanie.Lines.Text;
    AddStation(CSta);
    end;
  NSozdStation.Close;
end;

procedure TNSozdStation.btCanselClick(Sender: TObject);
begin
  NSozdStation.Close;
end;

end.
