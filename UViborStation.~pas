unit UViborStation;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Spin, Grids, ExtCtrls;

type
  TFViborStation = class(TForm)
    Panel3: TPanel;
    Sg: TStringGrid;
    Pbutton: TPanel;
    BtOk: TButton;
    btCansel: TButton;
    SeNomStation: TSpinEdit;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btCanselClick(Sender: TObject);
    procedure BtOkClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FViborStation: TFViborStation;

implementation

Uses UObj,UMainForm;

{$R *.dfm}

procedure TFViborStation.FormCreate(Sender: TObject);
begin
 Sg.ColWidths[0]:=26;
 Sg.Cells[0,0]:='№';
 Sg.ColWidths[1]:=450;
 Sg.Cells[1,0]:='Название';
 Sg.ColWidths[2]:=150;
 Sg.Cells[2,0]:='Широта';
 Sg.ColWidths[3]:=150;
 Sg.Cells[3,0]:='Долгота';
 Sg.ColWidths[4]:=200;
 Sg.Cells[4,0]:='Страна';
 Sg.ColWidths[5]:=450;
 Sg.Cells[5,0]:='Численность населения';
end;

procedure TFViborStation.FormActivate(Sender: TObject);
Var
  CSta:PStation;
  i:word;
  St1,St2:String;
begin
CSta:=Station;
i:=0;
While CSta<>nil do
  begin
  Inc(i);
  Sg.RowCount:=i+2;
  Sg.Cells[0,i]:=IntToStr(i);
  Sg.Cells[1,i]:=CSta.St.Name;
  FormatKoordSt(CSta.St.Sh,CSta.St.Dl,St1,St2);
  Sg.Cells[2,i]:=St1;
  Sg.Cells[3,i]:=St2;
  Sg.Cells[4,i]:=CSta.St.Contry;
  Sg.Cells[5,i]:=CSta.St.Chisl;
  CSta:=CSta.Next;
  end;
end;

procedure TFViborStation.btCanselClick(Sender: TObject);
begin
FViborStation.Close;
end;

procedure TFViborStation.BtOkClick(Sender: TObject);
var
  CSta:PStation;
  i:word;
begin
CSta:=Station;
i:=0;
While (CSta<>nil) and (i<>SeNomStation.Value-1) do
  begin
  Inc(i);
  CSta:=CSta.Next;
  end;
If CSta=nil then
  ShowMessage('Станции с таким номером не существует')
else
  begin
  FViborStation.Close;
  SelectSta:=CSta;
  end;
end;

end.
