unit UMainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, StdCtrls, ExtCtrls, UObj, Spin, jpeg, Math, Grids, UAddSattelite, UViborStation,UVisible,
  ComCtrls;

Const
  ConstStationX = 3;
  ConstStationy = 3;
  ConstSatteliteX = 2;
  ConstSattelitey = 2;
  ConstREkvator = 40000;
  ConstRPolus = 40000;
  RZ = 6371;
  YgolMesta = 5;

type
  TForm1 = class(TForm)
    PMapC: TPanel;
    PMapS: TPanel;
    Panel5: TPanel;
    MainMenu: TMainMenu;
    Y1: TMenuItem;
    ND: TMenuItem;
    NM: TMenuItem;
    NS: TMenuItem;
    PSetka: TGroupBox;
    CbPenColor: TColorBox;
    Label1: TLabel;
    SePenWight: TSpinEdit;
    Label2: TLabel;
    SeShagX: TSpinEdit;
    Label3: TLabel;
    Label4: TLabel;
    SeShagY: TSpinEdit;
    SD: TSaveDialog;
    OD: TOpenDialog;
    MapC: TPaintBox;
    MapS: TPaintBox;
    MeStation: TMemo;
    MeSattelite: TMemo;
    GbRast: TGroupBox;
    GbPoint1: TGroupBox;
    GbPoint2: TGroupBox;
    LeRastPoint: TLabeledEdit;
    GbVisibleStation: TGroupBox;
    MeAllStation: TMemo;
    LeShagArgShir: TLabeledEdit;
    SgSpytnik: TStringGrid;
    GbDvishSpytnik: TGroupBox;
    BtGo: TButton;
    CbVisibletraektoria: TCheckBox;
    BtCleartraektory: TButton;
    Timer: TTimer;
    BtStop: TButton;
    LeVremia: TLabeledEdit;
    LeZaderzka: TLabeledEdit;
    LaTime: TLabel;
    GbProtocol: TGroupBox;
    MeSviaz: TMemo;
    NStation: TMenuItem;
    NSattelite: TMenuItem;
    NMSozdStation: TMenuItem;
    NSaveStation: TMenuItem;
    NLoaStation: TMenuItem;
    NChooseStation: TMenuItem;
    NSozdSattelite: TMenuItem;
    NSaveSattelite: TMenuItem;
    NLoadSattelite: TMenuItem;
    NChooseSattelite: TMenuItem;
    NPanel: TMenuItem;
    NVisiblesattelite: TMenuItem;
    NVisibleSetka: TMenuItem;
    NVisibleRast: TMenuItem;
    PInformation: TPanel;
    LaSh: TLabel;
    LaDl: TLabel;
    LaKolSpytnik: TLabel;
    LaX1: TLabel;
    LaY1: TLabel;
    LaX2: TLabel;
    LaY2: TLabel;
    NVisibleAllStation: TMenuItem;
    GbVisibleAllSpytnik: TGroupBox;
    GbRadioVidimost: TGroupBox;
    LeHRadiovidimosti: TLabeledEdit;
    CbAllZoneSattelite: TCheckBox;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    NVisibleZoneRadiovidimosti: TMenuItem;
    Label8: TLabel;
    ClZoneSviaz: TColorBox;
    SeWidthZoneSviaz: TSpinEdit;
    Label9: TLabel;
    LaStation: TLabel;
    NVisibleModel: TMenuItem;
    GbSelectStation: TGroupBox;
    MeSelectStation: TMemo;
    NVisibleSelectStation: TMenuItem;
    NIzmenitStation: TMenuItem;
    Panel1: TPanel;
    CbAllStation: TCheckBox;
    NVisibleProtokol: TMenuItem;
    LaObTime: TLabel;
    GbChiklogramm: TGroupBox;
    GbStat: TGroupBox;
    NVisibleStatistik: TMenuItem;
    NVisibleCiklogramm: TMenuItem;
    Panel2: TPanel;
    Panel3: TPanel;
    PbCiklogramm: TPaintBox;
    SbCiklogramm: TScrollBar;
    LeVremiaC: TLabeledEdit;
    SgStat: TStringGrid;
    Date1: TDateTimePicker;
    procedure MapCMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure FormActivate(Sender: TObject);
    procedure NMClick(Sender: TObject);
    procedure NDClick(Sender: TObject);
    procedure NSClick(Sender: TObject);
    procedure BtSozdClick(Sender: TObject);
    procedure MapCMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure CbPenColorChange(Sender: TObject);
    procedure MapSMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure MapSMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure BtSaveStationClick(Sender: TObject);
    procedure BtLoadStationClick(Sender: TObject);
    procedure BtCleartraektoryClick(Sender: TObject);
    procedure BtGoClick(Sender: TObject);
    procedure TimerTimer(Sender: TObject);
    procedure BtStopClick(Sender: TObject);
    procedure LeVremiaChange(Sender: TObject);
    procedure LeShagArgShirChange(Sender: TObject);
    procedure LeVremiaKeyPress(Sender: TObject; var Key: Char);
    procedure NSozdSatteliteClick(Sender: TObject);
    procedure NLoadSatteliteClick(Sender: TObject);
    procedure NSaveSatteliteClick(Sender: TObject);
    procedure NVisibleSetkaClick(Sender: TObject);
    procedure NVisibleRastClick(Sender: TObject);
    procedure NVisibleAllStationClick(Sender: TObject);
    procedure NVisiblesatteliteClick(Sender: TObject);
    procedure NVisibleZoneRadiovidimostiClick(Sender: TObject);
    procedure LeHRadiovidimostiChange(Sender: TObject);
    procedure NVisibleModelClick(Sender: TObject);
    procedure NVisibleSelectStationClick(Sender: TObject);
    procedure NChooseStationClick(Sender: TObject);
    procedure NIzmenitStationClick(Sender: TObject);
    procedure NVisibleProtokolClick(Sender: TObject);
    procedure NVisibleStatistikClick(Sender: TObject);
    procedure NVisibleCiklogrammClick(Sender: TObject);
    procedure SbCiklogrammChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

Procedure Rast(Sh1,Dl1,Sh2,Dl2:real; var R:real);
Procedure VitRadVid(YgolMesta,H:Real);
Procedure NextKoordSputnik(var ArgShir:real;  //�������� ������ (���������� � �����) (U0)
                               UgolNaklona,   //���� ������� ���������� (i)
                               DolgotaVoshodUzla, //������� ����������� ���� (Lamd0)
                               H:real;        //������ �������� (H)
                           var Sh,            //������ ��������
                               Dl:real);      //������� ��������

Procedure XYtoSD(tip:word; X,MaxX:word; MaxGr:word; var Gr,Mn,Sk:real);
Procedure SDtoXY(tip:word; MaxGr:word; Gr,Mn,Sk:real; MaxX:word; var X:word);
Procedure XYtoSDC(X,Y:word; var Sh,Dl:real);
Procedure SDtoXYC(dl,sh:real; Height:Word; var X,Y:word);

Procedure GiveKoordFormat(Gr,Mn,Sk:real; var st:string);
Procedure GrToFormat(Tip:byte; var Gr,Mn,Sk:real);
Procedure FormatKoordSt(Sh,Dl:real; var St1,St2:String);

procedure Clear(Map:TPaintBox);
Procedure UPaint;

Procedure PaintSetka;
Procedure PaintStation(Station:PStation);
Procedure PaintSattelite(Sattelite:PSattelite);
Procedure PaintTraektory(Sattelite:PSattelite);
Procedure PaintPoint(tip:word; canv:TCanvas; Sh,Dl:real; St:String);
Procedure PaintLineEllipseC(X1,x2,Y:word; var X1n,X2n,Yn:word);
Procedure PaintLineEllipseS(X1,x2,Y1,Y2:word; var X1nc,X2nc,Y1nc,Y2nc:word);
Procedure PaintEllipsSviazC(tip:byte; cX,cY:word; R:Real; Color:tColor; Width:Word);
Procedure PaintEllipsSviazShDl(cSh,cDl:Real; R:Real; Color:tColor; Width:Word);

Procedure SelectStation(tip,CX,CY,Dx,Dy:word);
Procedure SelectSattelite(tip,CX,CY,Dx,Dy:word);
Procedure SelectPoint(tip:byte; X,Y:word);

Procedure MoveSMap(X,Y:word; LeX,LeY:TLabel);
procedure MoveCMap(X,Y:word; LeX,LeY:TLabel);

var
  Form1: TForm1;
  Sh,Dl,MaxShS:real;
  FormatKoord:byte;
  X1,Y1,X2,Y2:word;
  sh1,dl1,sh2,dl2:real;
  ProcR:byte;
  RadVid:real;
  TimeModel:Real;
  KolSattelite:Word;
  GlobalTimeModel:real;
  KolSeans,KolKollis:word;
  TimeSeans,TimeKolis,NatTimeGo:real;
  FirstProgon:boolean;

implementation

uses UAddStation;

{$R *.dfm}

procedure TForm1.LeVremiaKeyPress(Sender: TObject; var Key: Char);
begin
if not (Key in ['0'..'9',',','-',#08]) then Key := #0
end;

Procedure Rast(Sh1,Dl1,Sh2,Dl2:real; var R:real);
begin
R:=Arccos( sin(sh1/180*pi)*sin(sh2/180*pi)+ cos(sh1/180*pi)*cos(sh2/180*pi)*cos((dl2-dl1)/180*pi) )/Pi*180*60*1.85532;
end;

Procedure VitRadVid(YgolMesta,H:Real);
begin
RadVid:=Rz*(Pi/2-(YgolMesta/180*pi+ArcSin((Rz*Cos(YgolMesta/180*pi))/(Rz+H))));
end;

Procedure NextKoordSputnik(var ArgShir:real;  //�������� ������ (���������� � �����) (U0)
                               UgolNaklona,   //���� ������� ���������� (i)
                               DolgotaVoshodUzla, //������� ����������� ���� (Lamd0)
                               H:real;        //������ �������� (H)
                           var Sh,            //������ ��������
                               Dl:real);      //������� ��������
const
  Tzv = 86140;   //�������� ������ �������� �����
  Ep=2.634e10;
  Mu=398620;
var
DugaEkvatora,    //���� ��������
OrbitSdvig,      //�������� ������������ ������
T:real;          //������ ��������� ��������
ArSh:real;
begin
T:=2*pi*Sqrt(Sqr(Rz+H)*(Rz+H)/Mu)+2*Pi*Ep*(1-4*Sqr(UgolNaklona/180*pi))/(Mu*Sqrt(Mu*(Rz+H)));
If Form1.LeShagArgShir.Text<>'' then
  begin
  ArgShir:=ArgShir+StrToFloat(Form1.LeShagArgShir.Text);    //��������� ��������� ������ �� ���
  TimeModel:=T/(2*pi)*ArgShir/180*pi;
  end;
If Form1.LeVremia.Text<>'' then
  begin
  If firstProgon then
    begin
    TimeModel:=T/(2*pi)*ArgShir/180*pi;
    FirstProgon:=false;
    end;
  TimeModel:=TimeModel+StrToFloat(Form1.LeVremia.Text);
  ArgShir:=2*pi/T*TimeModel/pi*180;
  end;
If (ArgShir=90) or (ArgShir=270) then ArgShir:=ArgShir-0.1;   //�������� ��������� �������
Sh:=ArcSin(Sin(UgolNaklona/180*pi)*Sin(ArgShir/180*pi))/pi*180;    //���������� ������ ��������
If (UgolNaklona<>0) and (UgolNaklona<>180) and (Abs(Tan(Sh/180*pi)/Tan(UgolNaklona/180*pi))<=1) then  //�������� �� ����������� ����������� ���������
  DugaEkvatora:=ArcSin(Tan(Sh/180*pi)/Tan(UgolNaklona/180*pi))  //���������� �������� �� ���� ��������
else
  DugaEkvatora:=0;
ArSh:=ArgShir;
While ArSh>360 do
  ArSh:=ArSh-360;
If (ArSh>90) and (ArSh<270) then DugaEkvatora:=180-DugaEkvatora;
If (ArSh>270) and (ArSh<360) then DugaEkvatora:=DugaEkvatora+360;
OrbitSdvig:=-T/Tzv*ArgShir;  //���������� ������������ ������
Dl:=DolgotaVoshodUzla+DugaEkvatora+OrbitSdvig; //���������� ������� ��������
If Dl<-180 then dl:=Dl+360;
If Dl>180 then dl:=Dl-360;
end;


Procedure XYtoSD(tip:word; X,MaxX:word; MaxGr:word; var Gr,Mn,Sk:real);
  begin
  Gr:=0;
  Mn:=0;
  Sk:=0;
  Gr:=X*MaxGr/MaxX;
  GrToFormat(Tip,Gr,Mn,Sk);
  Gr:=Gr-MaxGr/2;
  end;

Procedure SDtoXY(tip:word; MaxGr:word; Gr,Mn,Sk:real; MaxX:word; var X:word);
  begin
  X:=0;
  Gr:=Gr+MaxGr/2;
  Case tip of
    1: Gr:=Gr+Mn/60;
    2: Gr:=Gr+Mn/60+Sk/3600;
    end;
  X:=trunc(Gr*MaxX/MaxGr);
  end;

Procedure SdtoXYC(dl,sh:real; Height:Word; var X,Y:word);
var
  r,Alf:real;
begin
R:=(90-Sh)*(Height/2)/(90-MaxShS);
If (Height/2*Sin((Dl+90)/180*pi))=0 then
  if Station.St.Dl>0 then
    Alf:=pi/2
  else
    Alf:=-pi/2
 else
Alf:=ArcTan((Height/2*Cos((Dl+90)/180*pi))/(Height/2*Sin((Dl+90)/180*pi)));
If Abs(Dl)>=90 then
  Alf:=-Alf;
X:=Trunc(R*Sin(-Alf)+Height/2);
If Abs(Dl)>=90 then
  Y:=trunc(Height/2+R*Cos(Alf))
else
  Y:=trunc(Height/2-R*Cos(Alf));
end;

Procedure XYtoSDC(X,Y:word; var Sh,Dl:real);
var
  Mn,Sk:real;
begin
Sh:=90-(90-MaxShS)*Sqrt(Sqr(Form1.MapS.Height/2-X)+Sqr(Form1.MapS.Width/2-Y))/(Form1.MapS.Height/2);
GrToFormat(0,Sh,Mn,Sk);
If Form1.MapS.Width/2-Y=0 then Y:=Y+1;
Dl:=(ArcTan((Form1.MapS.Height/2-X)/(Form1.MapS.Width/2-Y)))*180/pi;
If Y<Form1.MapS.Width/2 then
  Dl:=Abs(Dl)
else
  Dl:=90+(90-Abs(Dl));
GrToFormat(0,Dl,Mn,Sk);
If X<Form1.MapS.Height/2 then
Dl:=-Dl;
end;

Procedure GiveKoordFormat(Gr,Mn,Sk:real; var st:string);
  begin
  Gr:=(Trunc(Gr*100))/100;
  Mn:=(Trunc(Mn*100))/100;
  Sk:=(Trunc(Sk*100))/100;
  Case FormatKoord of
    0:st:=FloatToStr(Gr);
    1:st:=FloatToStr(Gr)+'� '+FloatToStr(Mn)+Chr(39);
    2:st:=FloatToStr(Gr)+'� '+FloatToStr(Mn)+Chr(39)+' '+FloatToStr(Sk)+'"';
    end;
  If trunc(gr) div 100 = 0 then
    if St[1]<>'-' then
      St:='0'+St
    else
      Insert('0',St,2);
  end;

Procedure GrToFormat(Tip:byte; var Gr,Mn,Sk:real);
begin
Case tip of
    0: begin
       Mn:=0;
       Sk:=0;
       end;
    1: begin
       Mn:=(Gr-trunc(Gr))*60;
       Gr:=Trunc(Gr);
       Sk:=0;
       end;
    2: begin
       Mn:=(Gr-trunc(Gr))*60;
       Sk:=(Mn-trunc(Mn))*60;
       Mn:=Trunc(Mn);
       Gr:=Trunc(Gr);
       end;
    end
end;

Procedure FormatKoordSt(Sh,Dl:real; var St1,St2:String);
var
  Mn,Sk:real;
begin
  GrToFormat(FormatKoord,Dl,Mn,Sk);
  GiveKoordFormat(Dl,Mn,Sk,st1);
  GrToFormat(FormatKoord,Sh,Mn,Sk);
  GiveKoordFormat(Sh,Mn,Sk,st2);
  If st2[1]='-' then
    begin
    Delete(st2,1,1);
    St2:=St2+' ��';
    end
  else
    St2:=St2+' ��';
  If st1[1]='-' then
    begin
    Delete(st1,1,1);
    St1:=St1+' ��';
    end
  else
    St1:=St1+' ��';
  Case FormatKoord of
    0:begin
      While Length(St1)<7 do
        St1:=St1+' ';
      While Length(st2)<7 do
        St2:=St2+' ';
      end;
    1:begin
      While Length(st1)<10 Do
        St1:=St1+' ';
      While Length(St2)<10 do
        St2:=St2+' ';
      end;
    2:begin
      While Length(St1)<13 do
        St1:=St1+' ';
      While Length(St2)<13 do
        St2:=St2+' ';
      end;
    end;
end;

//��������� ������� ����������� ������
procedure Clear(Map:TPaintBox);
  begin
  With Map.Canvas do
    begin
    Brush.Color:=ClBtnFace;
    //������������ ������ ����� ��������� �������������� �� ��� ������� ������
    Pen.Width:=0;
    Rectangle(0,0,Map.Width,Map.Height);
    pen.Color:=ClBlack;
    Pen.Width:=1;
    end;
  end;

Procedure UPaint;
  Var
    CSta:PStation;
    CSet:PSattelite;
    b:tbitmap;
    R:Real;
  begin
  Clear(Form1.MapC);
  Clear(Form1.MapS);
  b:=tbitmap.Create;
  b.LoadFromFile('600px-Antarctica_6400px_from_Blue_Marble1.bmp');
  Form1.MapS.Canvas.Draw(0,0,b);
  b.LoadFromFile('EarthMapAtmos_2500x12501.bmp');
  Form1.MapC.Canvas.Draw(0,0,b);
  PaintSetka;
  If Form1.CbAllStation.Checked then
    begin
    CSta:=Station;
    While CSta<>nil do
      begin
      PaintStation(CSta);
      CSta:=CSta.Next;
      end;
    end;
  If SelectSta<>nil then
    PaintStation(SelectSta);
  CSet:=Sattelite;
  While CSet<>nil do
    begin
    If CSet.Choose then
      begin
      PaintSattelite(CSet);
      If Form1.CbAllZoneSattelite.Checked then
        begin
        VitRadVid(SelectSta.St.YgolMesta,CSet.Sat.H);
        PaintEllipsSviazShDl(SelectSta.St.Sh,SelectSta.St.Dl,RadVid,CSet.Sat.ColorTraektory,1);
        end;
      end;
    CSet:=CSet.Next;
    end;
  If (Sh1<>180) and (Dl1<>360) then
    begin
    PaintPoint(0,Form1.MapC.Canvas,Sh1,Dl1,'�1');
    PaintPoint(1,Form1.MapS.Canvas,Sh1,Dl1,'�1');
    end;
  If (Sh2<>180) and (Dl2<>360) then
    begin
    PaintPoint(0,Form1.MapC.Canvas,Sh2,Dl2,'�2');
    PaintPoint(1,Form1.MapS.Canvas,Sh2,Dl2,'�2');
    end;
  end;

Procedure PaintSetka;
  var
  dx,dy,x,y:real;
  i,KolX,KolY,KolYR,Shx,ShY,Zn:word;
  begin
  With Form1 do
    begin
    If SeShagX.Value<10 then
      SeShagX.Value:=10;
    If SeShagY.Value<5 then
      SeShagY.Value:=5;
    Shx:=SeShagX.Value;
    shy:=SeShagY.Value;
    Kolx:=360 div Shx;
    Koly:=180 div shy;

    With MapC.Canvas do
      begin
      Pen.Width:=SePenWight.Value;
      Pen.Color:=CbPenColor.Selected;
      MoveTo(MapC.Width div 2,0);
      LineTo(MapC.Width div 2,MapC.Height);
      MoveTo(0,MapC.Height div 2);
      LineTo(MapC.Width ,MapC.Height div 2);
      TextOut(MapC.Width div 2+2,MapC.Height div 2+4,'0');
      Dx:=MapC.Width/KolX;
      Dy:=MapC.Height/KolY;
      X:=Dx;
      For i:=1 to KolX do
        begin
        MoveTo(trunc(X),0);
        LineTo(trunc(X),MapC.Height);
        TextOut(trunc(X)+2,MapC.Height div 2+4,IntToStr(Abs(180-i*Shx)));
        X:=X+Dx;
        end;
      Y:=DY;
      For i:=1 to KolY do
        begin
        MoveTo(0,trunc(Y));
        LineTo(MapC.Width,trunc(Y));
        TextOut(MapC.Width div 2+2,trunc(Y)+4,IntToStr(Abs(90-i*shy)));
        Y:=Y+Dy;
        end;
      end;
    With MapS.Canvas do
      begin
      Pen.Width:=SePenWight.Value;
      Pen.Color:=CbPenColor.Selected;
      MoveTo(MapS.Width div 2,0);
      LineTo(MapS.Width div 2,MapS.Height);
      MoveTo(0,MapS.Height div 2);
      LineTo(MapS.Width ,MapS.Height div 2);
      TextOut(MapS.Width div 2+2,MapS.Height div 2+4,'90');
      KolY:=trunc((90-MaxShS)/SeShagY.Value);
      Dy:=(MapS.Height/2)/(90-MaxShS);
      Y:=ShY*Dy;
      For i:=1 to KolYR do
        begin
        brush.Style:=BsClear;
        Ellipse(Trunc(MapS.Width/2-Y),Trunc(MapS.Height/2-Y),Trunc(MapS.Width/2+Y),Trunc(MapS.Height/2+Y));
        MapS.Canvas.Font.Color:=ClRed;
        TextOut(MapS.Width div 2+2,Trunc(MapS.Height/2-Y)+4,IntToStr(Abs(90-i*shy)));
        Y:=Y+ShY*Dy;
        end;
      For i:=1 to KolX do
        begin
        MoveTo(MapS.Width div 2,MapS.Height div 2);
        LineTo(trunc(MapS.Width/2-MapS.Width/2*Cos((Shx*i+90)/180*pi)),trunc(MapS.Height/2-MapS.Height/2*Sin((Shx*i+90)/180*pi)));
        Zn:=Shx*i;
        If Zn>180 then
          Zn:=zn-2*(zn-180);
        MapS.Canvas.Font.Color:=ClRed;
        TextOut(trunc(MapS.Width/2-MapS.Width/2*Cos((Shx*i+90)/180*pi))+2,trunc(MapS.Height/2-MapS.Height/2*Sin((Shx*i+90)/180*pi))+4,IntToStr(Abs(zn)));
        end;
      end;
    end;
  end;

Procedure PaintStation(Station:PStation);
  var
    X,Y:word;
  begin
  SDtoXY(0,360,Station.St.Dl,0,0,Form1.MapC.Width,X);
  SDtoXY(0,180,Station.St.Sh,0,0,Form1.MapC.Height,Y);
  With Form1.MapC.Canvas do
    begin
    Pen.Width:=2;
    Form1.MapC.Canvas.Pen.Color:=ClFuchsia;
    Rectangle(X+ConstStationX,Y+ConstStationY,X-ConstStationX,Y-ConstStationY);
      Form1.MapS.Canvas.Pen.Color:=ClBtnFace;

    end;
  If Station.St.Sh>MaxShS then
    With Form1.MapS do
      begin
      SdtoXYC(Station.St.Dl,Station.St.Sh,Height,X,Y);
      Canvas.Pen.Width:=2;
      Form1.MapS.Canvas.Pen.Color:=ClFuchsia;
      Canvas.Rectangle(X+ConstStationX,Y+ConstStationY,X-ConstStationX,Y-ConstStationY);
      Form1.MapC.Canvas.Pen.Color:=ClBtnFace;
      end;
  end;

Procedure PaintSattelite(Sattelite:PSattelite);
  var
    X,Y:word;
  begin
  SDtoXY(0,360,Sattelite.Sat.Dl,0,0,Form1.MapC.Width,X);
  SDtoXY(0,180,Sattelite.Sat.Sh,0,0,Form1.MapC.Height,Y);
  With Form1.MapC.Canvas do
    begin
    Pen.Color:=ClYellow;
    Pen.Width:=2;
    Ellipse(X+ConstSatteliteX,Y+ConstSatteliteY,X-ConstSatteliteX,Y-ConstSatteliteY);
    Pen.Color:=ClBtnFace;
    end;
  If Sattelite.Sat.Sh>MaxShS then
    With Form1.MapS do
      begin
      SdtoXYC(Sattelite.Sat.Dl,Sattelite.Sat.Sh,Height,X,Y);
      Canvas.Pen.Width:=2;
      Canvas.Pen.Color:=ClYellow;
      Canvas.Ellipse(X+ConstSatteliteX,Y+ConstSatteliteY,X-ConstSatteliteX,Y-ConstSatteliteY);
      Canvas.Pen.Color:=ClBtnFace;
      end;

  end;

Procedure PaintTraektory(Sattelite:PSattelite);
  var
    CTr:PTraektory;
    X,Y,X1,Y1:word;
    a:real;
    NapX,NapY:byte;
    bPaint:Boolean;
  begin
  CTr:=Sattelite.Traektory;
  BPaint:=false;
  While CTr<>nil do
    begin
    SDtoXY(0,360,CTr.Dl,0,0,Form1.MapC.Width,X);
    SDtoXY(0,180,CTr.Sh,0,0,Form1.MapC.Height,Y);
    If not BPaint then
      begin
      X1:=X;
      Y1:=Y;
      end;
    With Form1.MapC.Canvas do
      begin
      Pen.Color:=Sattelite.Sat.ColorTraektory;
    If (NapX=0) then
      if (X1<X) then
      begin
      LineTo(0,Y);
      MoveTo(Form1.MapC.Width,Y);
      end
    else
      if (X1>X) then
      begin
      LineTo(Form1.MapC.Width,Y);
      MoveTo(0,Y);
      end;
    If X>X1 then
      napX:=1
    else
      napX:=0;

    a:=Y1-Y;
    If Y>Y1 then
      napY:=1
    else
      napY:=0;

    If Abs(a)>Form1.MapC.Height*0.80 then
      If NapY=0 then
        begin
        LineTo(Y,0);
        MoveTo(Y,Form1.MapC.Height);
        end
      else
        begin
        LineTo(Y,Form1.MapC.Height);
        MoveTo(Y,0);
        end;

      If bPaint then
        LineTo(X,Y)
      else
        begin
        MoveTo(X,Y);
        BPaint:=True;
        end;
      Pen.Color:=ClBtnFace;
      end;
    X1:=X;
    Y1:=Y;
    CTr:=CTr.Next;
    end;
  CTr:=Sattelite.Traektory;
  BPaint:=false;
  While CTr<>nil do
    begin
  If CTr.Sh>MaxShS then

      With Form1.MapS do
        begin
        SdtoXYC(CTr.Dl,CTr.Sh,Height,X,Y);
        Canvas.Pen.Color:=Sattelite.Sat.ColorTraektory;
        If bPaint then
          Canvas.LineTo(X,Y)
        else
          begin
          Canvas.MoveTo(X,Y);
          BPaint:=True;
          end;
        Canvas.Pen.Color:=ClBtnFace;
        end;
        CTr:=CTr.Next;
    end;
  end;

Procedure PaintPoint(tip:word; canv:TCanvas; Sh,Dl:real; St:String);
var
  x,y:word;
begin
If tip=0 then
  begin
  SDtoXY(0,360,Dl,0,0,Form1.MapC.Width,X);
  SDtoXY(0,180,Sh,0,0,Form1.MapC.Height,Y);
  end
else
  SdtoXYC(Dl,Sh,Form1.MapS.Height,X,Y);
Canv.Brush.Color:=ClLime;
Canv.Ellipse(X+6,Y+6,X-6,Y-6);
Canv.TextOut(x,y,st);
Canv.Brush.Color:=ClBtnFace;
end;

Procedure PaintLineEllipseC(X1,x2,Y:word; var X1n,X2n,Yn:word);
  begin
  With Form1.MapC.Canvas do
    begin
    MoveTo(X1n,Yn);
    If Abs(X1n-X1)<Form1.MapC.Width/2 then
      LineTo(X1,Y)
    else
      begin
      LineTo(Form1.MapC.Width,Y);
      MoveTo(0,Y);
      LineTo(X1,Y)
      end;
    MoveTo(X2n,Yn);
    If Abs(X2n-X2)<Form1.MapC.Width/2 then
      LineTo(X2,Y)
    else
      begin
      LineTo(0,Y);
      MoveTo(Form1.MapC.Width,Y);
      LineTo(X2,Y)
      end;
    end;
    Yn:=Y;
    X1n:=X1;
    X2n:=X2;
  end;

Procedure PaintLineEllipseS(X1,x2,Y1,Y2:word; var X1nc,X2nc,Y1nc,Y2nc:word);
  begin
  With Form1.MapS.Canvas do
    begin
    If (Y1<Form1.MapS.Height) and (Y2<Form1.MapS.Height) then
      begin
      MoveTo(X1nc,Y1nc);
      LineTo(X1,Y1);
      MoveTo(X2nc,Y2nc);
      LineTo(X2,Y2);
      end;
    Y1nc:=Y1;
    Y2nc:=Y2;
    X1nc:=X1;
    X2nc:=X2;
    end;
  end;

Procedure PaintEllipsSviazC(tip:byte; cX,cY:word; R:Real; Color:tColor; Width:Word);
Var
 cSh,cDl:Real;
 Mn,Sk:real;
begin
If Tip=0 then
  begin
  XYtoSD(0,cX,Form1.MapC.Width,360,cDl,Mn,Sk);
  XYtoSD(0,cY,Form1.MapC.Height,180,cSh,Mn,Sk);
  end
else
  XYtoSDC(cX,cY,cSh,cDl);
PaintEllipsSviazShDl(cSh,cDl,R,Color,Width);
end;


Procedure PaintEllipsSviazShDl(cSh,cDl:Real; R:Real; Color:tColor; Width:Word);
var
Dl1,Dl2,Sh,RDl,RSh,DSh:real;
X1,Y,X2,X1n,X2n,Yn,X1nc,X2nc,Ync,Y1,Y1nc:word;
Mn,Sk:real;
cX,cY:word;
First,FSh:Boolean;
begin
SDtoXY(0,360,cDl,0,0,Form1.MapC.Width,cX);
SDtoXY(0,180,cSh,0,0,Form1.MapC.Height,cY);
RSh:=(180*R)/(Pi*Rz);
Form1.MapC.Canvas.Pen.Color:=Color;
Form1.MapC.Canvas.Pen.Width:=Width;
Form1.MapS.Canvas.Pen.Color:=Color;
Form1.MapS.Canvas.Pen.Width:=Width;
If CSh>0 then
  DSh:=cSh-RSh
else
  DSh:=cSh+RSh;
SDtoXY(0,360,cDl,0,0,Form1.MapC.Width,X1n);
X2n:=X1n;
SDtoXY(0,180,DSh,0,0,Form1.MapC.Height,Yn);
SdtoXYC(cDl,DSh,Form1.MapS.Height,X1nc,Ync);
X2nc:=X1nc;
While Abs(DSh)<Abs(cSh)+RSh do
  begin
  RDl:=(cos(R*Pi/(180*60*1.852))-sin(DSh/180*pi)*sin(cSh/180*pi))/( cos(DSh/180*pi)*cos(cSh/180*pi));
  If (RDl>1) or (RDl<-1) then
    Break;
  RDl:=Arccos(RDl)/pi*180;
  Dl1:=CDl+RDl;
  Dl2:=CDl-RDl;
  If Dl1>180 then Dl1:=Dl1-360;
  If Dl2<-180 then Dl2:=Dl2+360;
  SDtoXY(0,360,Dl1,0,0,Form1.MapC.Width,X1);
  SDtoXY(0,360,Dl2,0,0,Form1.MapC.Width,X2);
  SDtoXY(0,180,DSh,0,0,Form1.MapC.Height,Y);
  PaintLineEllipseC(X1,x2,Y,X1n,X2n,Yn);
  SdtoXYC(Dl1,DSh,Form1.MapS.Height,X1,Y);
  SdtoXYC(Dl2,DSh,Form1.MapS.Height,X2,Y1);
  PaintLineEllipseS(X1,x2,Y,Y1,X1nc,X2nc,Ync,Y1nc);
  If cSh>0 then
    DSh:=DSh+Form1.MapC.Height/360
  else
    DSh:=DSh-Form1.MapC.Height/360;
  end;
If cSh>0 then
  DSh:=DSh-Form1.MapC.Height/360
else
  DSh:=DSh+Form1.MapC.Height/360;
SDtoXY(0,360,cDl,0,0,Form1.MapC.Width,X1);
SDtoXY(0,180,DSh,0,0,Form1.MapC.Height,Y);
PaintLineEllipseC(X1,x1,Y,X1n,X2n,Yn);
//SdtoXYC(cDl,DSh,Form1.MapS.Height,X1,Y);
PaintLineEllipseS(X1nc,X1nc,Ync,Ync,X1nc,X2nc,Ync,Y1nc);
end;

Procedure SelectStation(tip,CX,CY,Dx,Dy:word);
  var
    X,Y:word;
    CSta:PStation;
  begin
  CSta:=Station;
  While CSta<>nil do
    begin
    If tip=0 then
      begin
      SDtoXY(0,360,CSta.St.Dl,0,0,Form1.MapC.Width,X);
      SDtoXY(0,180,CSta.St.Sh,0,0,Form1.MapC.Height,Y);
      end
    else
      SdtoXYC(CSta.St.Dl,CSta.St.Sh,Form1.MapS.Height,X,Y);
    If (CX<=X+ConstStationX) and (CX>=X-ConstStationX) and
       (CY<=Y+ConstStationY) and (CY>=Y-ConstStationY) then
       begin
       Form1.MapC.Canvas.Pen.Color:=ClRed;
       Form1.MapS.Canvas.Pen.Color:=ClRed;
       PaintStation(CSta);
       Form1.MapC.Canvas.Pen.Color:=ClBtnFace;
       Form1.MapS.Canvas.Pen.Color:=ClBtnFace;
       Form1.MeStation.Left:=CX+ConstStationX+1+Dx;
       Form1.MeStation.Top:=CY+ConstStationY+1+Dy;
       Form1.MeStation.Clear;
       Form1.MeStation.Lines.Add('��������: '+CSta.St.Name);
       Form1.MeStation.Lines.Add('�����: '+CSta.St.Contry);
       Form1.MeStation.Lines.Add('��������: '+CSta.St.Text);
       Form1.MeStation.Visible:=true;
       end;
    CSta:=CSta.Next;
    end;
  end;

Procedure SelectSattelite(tip,CX,CY,Dx,Dy:word);
  var
    X,Y:word;
    i:word;
    CSta:PSattelite;
  begin
  CSta:=Sattelite;
  While CSta<>nil do
    begin
    If tip=0 then
      begin
      SDtoXY(0,360,CSta.Sat.Dl,0,0,Form1.MapC.Width,X);
      SDtoXY(0,180,CSta.Sat.Sh,0,0,Form1.MapC.Height,Y);
      end
    else
      SdtoXYC(CSta.Sat.Dl,CSta.Sat.Sh,Form1.MapS.Height,X,Y);
    If (CX<=X+ConstSatteliteX) and (CX>=X-ConstSatteliteX) and
       (CY<=Y+ConstSatteliteY) and (CY>=Y-ConstSatteliteY) then
       begin
       Form1.MapC.Canvas.Pen.Color:=ClRed;
       Form1.MapS.Canvas.Pen.Color:=ClRed;
       PaintSattelite(CSta);
       Form1.MapC.Canvas.Pen.Color:=ClBtnFace;
       Form1.MapS.Canvas.Pen.Color:=ClBtnFace;
       Form1.MeSattelite.Left:=CX-ConstStationX-1-Dx-Form1.MeSattelite.Width;
       Form1.MeSattelite.Top:=CY-ConstStationY-1;
       i:=1;
       While Form1.SgSpytnik.Cells[1,i]<>CSta.Sat.Text do
         inc(i);
       Form1.MeSattelite.Clear;
       Form1.MeSattelite.Lines.Add('������� - '+CSta.Sat.Text);
       Form1.MeSattelite.Lines.Add('������ - '+Form1.SgSpytnik.Cells[2,i]);
       Form1.MeSattelite.Lines.Add('������� - '+Form1.SgSpytnik.Cells[3,i]);
       Form1.MeSattelite.Lines.Add('������ - '+Form1.SgSpytnik.Cells[4,i]);
       Form1.MeSattelite.Lines.Add('���� ������� ���������� - '+Form1.SgSpytnik.Cells[5,i]);
       Form1.MeSattelite.Lines.Add('������� ����������� ���� - '+Form1.SgSpytnik.Cells[6,i]);
       Form1.MeSattelite.Visible:=true;
       {���������� ������� ���������}
       RadVid:=Rz*(Pi/2-(YgolMesta/180*pi+ArcSin((Rz*Cos(YgolMesta/180*pi))/(Rz+CSta.Sat.H))));
       end;
    CSta:=CSta.Next;
    end;
  end;

Procedure SelectPoint(tip:byte; X,Y:word);
  var
    mn,sk,R1,R2,R3,r4,R:real;
    st:string;
    X1,X2,Y1,Y2:word;
  begin
  Case ProcR of
  0:begin
    X1:=X;
    Y1:=Y;
    Case tip of
      0: begin
         XYtoSD(0,X,Form1.MapC.Width,360,Dl1,Mn,Sk);
         XYtoSD(0,Y,Form1.MapC.Height,180,Sh1,Mn,Sk);
         MoveCMap(X,Y,Form1.LaX1,Form1.LaY1);
         end;
      1: begin
         XYtoSDC(X,Y,Sh1,Dl1);
         MoveSMap(X,Y,Form1.LaX1,Form1.LaY1);
         end;
      end;
    ProcR:=1;
    end;
  1:begin
    X2:=X;
    Y2:=Y;
    Case tip of
      0: begin
         XYtoSD(0,X,Form1.MapC.Width,360,Dl2,Mn,Sk);
         XYtoSD(0,Y,Form1.MapC.Height,180,Sh2,Mn,Sk);
         MoveCMap(X,Y,Form1.LaX2,Form1.LaY2);
         end;
      1: begin
         XYtoSDC(X,Y,Sh2,Dl2);
         MoveSMap(X,Y,Form1.LaX2,Form1.LaY2);
         end;
      end;
    Rast(Sh1,Dl1,Sh2,Dl2,R);
    Str(R:5:2,st);
    Form1.LeRastPoint.Text:=st+'��';
    ProcR:=2;
    end;
  2:begin
    Sh1:=180;
    Dl1:=360;
    Sh2:=180;
    Dl2:=360;
    Form1.LeRastPoint.Text:='';
    ProcR:=0;
    end;
  end;
  end;

Procedure MoveSMap(X,Y:word; LeX,LeY:TLabel);
var
  sh,dl:real;
  mn,Sk,R:real;
  st:String;
begin
  Sh:=90-(90-MaxShS)*Sqrt(Sqr(Form1.MapS.Height/2-X)+Sqr(Form1.MapS.Width/2-Y))/(Form1.MapS.Height/2);
  GrToFormat(FormatKoord,Sh,Mn,Sk);
  GiveKoordFormat(Sh,Mn,Sk,st);
  If st[1]='-' then
    begin
    Delete(st,1,1);
    St:=St+' ��';
    end
  else
    St:=St+' ��';
  LeX.caption:='������ - '+st;
  If Form1.MapS.Width/2-Y=0 then Y:=Y+1;
  Dl:=(ArcTan((Form1.MapS.Height/2-X)/(Form1.MapS.Width/2-Y)))*180/pi;
  If Y<Form1.MapS.Width/2 then
    Dl:=Abs(Dl)
  else
    Dl:=90+(90-Abs(Dl));
  GrToFormat(FormatKoord,Dl,Mn,Sk);
  GiveKoordFormat(Dl,Mn,Sk,st);
  If X<Form1.MapS.Height/2 then
    St:=St+' ��'
  else
    St:=St+' ��';
  LeY.caption:='������� - '+st;
end;

procedure TForm1.MapSMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
MoveSMap(X,Y,LaSh,LaDl);
end;

procedure MoveCMap(X,Y:word; LeX,LeY:TLabel);
var
  st:string;
  Gr,Mn,Sk:real;
begin
  XYtoSD(FormatKoord,X,Form1.MapC.Width,360,Gr,Mn,Sk);
  GiveKoordFormat(Gr,Mn,Sk,st);
  If st[1]='-' then
    begin
    Delete(st,1,1);
    St:=St+' ��';
    end
  else
    St:=St+' ��';
  LeY.caption:='������� - '+st;
  XYtoSD(FormatKoord,Y,Form1.MapC.Height,180,Gr,Mn,Sk);
  GiveKoordFormat(Gr,Mn,Sk,st);
  If st[1]='-' then
    begin
    Delete(st,1,1);
    St:=St+' ��';
    end
  else
    St:=St+' ��';
  LeX.caption:='������ - '+st;
end;


procedure TForm1.MapCMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
  begin
  MoveCMap(X,Y,LaSh,LaDl);
  end;

procedure TForm1.FormActivate(Sender: TObject);
begin
 MapC.Canvas.Font.Color:=ClRed;
 MapS.Canvas.Font.Color:=ClRed;
 Sh1:=180;
 Dl1:=360;
 Sh2:=180;
 Dl2:=360;
 FormatKoord:=0;
 MaxShS:=62;
 Station:=nil;
 SelectSta:=nil;
 Sattelite:=nil;
 ProcR:=2;
 RadVid:=400;
 KolSattelite:=0;
 LaKolSpytnik.Caption:='���������� ��������� - '+InttoStr(KOlSattelite);
 LaStation.Caption:='������� �� �������';
 SgSpytnik.ColWidths[0]:=26;
 SgSpytnik.Cells[0,0]:='�';
 SgSpytnik.ColWidths[1]:=300;
 SgSpytnik.Cells[1,0]:='�������� ��������';
 SgSpytnik.ColWidths[2]:=150;
 SgSpytnik.Cells[2,0]:='������';
 SgSpytnik.ColWidths[3]:=150;
 SgSpytnik.Cells[3,0]:='�������';
 SgSpytnik.ColWidths[4]:=120;
 SgSpytnik.Cells[4,0]:='������';
 SgSpytnik.ColWidths[5]:=150;
 SgSpytnik.Cells[5,0]:='���� ����. �����.';
 SgSpytnik.ColWidths[6]:=150;
 SgSpytnik.Cells[6,0]:='���. ������. ����';
 SgSpytnik.ColWidths[7]:=50;
 SgSpytnik.Cells[7,0]:='����';
 SgSpytnik.ColWidths[8]:=50;
 SgSpytnik.Cells[8,0]:='������';
 SgStat.Cells[0,0]:='��������';
 SgStat.Cells[1,0]:='��������';
 SgStat.Cells[0,1]:='���-�� ������� �����';
 SgStat.Cells[0,2]:='���-�� ��������';
 SgStat.Cells[0,3]:='�� ������� �����';
 SgStat.Cells[0,4]:='�� ������� ��������';
 KolSeans:=0;
 KolKollis:=0;
 TimeSeans:=0;
 TimeKolis:=0;
end;

procedure TForm1.NDClick(Sender: TObject);
begin
Nd.Checked:=true;
FormatKoord:=0;
vivodSpytnik;
end;

procedure TForm1.NMClick(Sender: TObject);
begin
Nm.Checked:=true;
FormatKoord:=1;
vivodSpytnik;
end;

procedure TForm1.NSClick(Sender: TObject);
begin
Ns.Checked:=true;
FormatKoord:=2;
vivodSpytnik;
end;

procedure TForm1.BtSozdClick(Sender: TObject);
begin
  NSozdStation.Caption:='�������� ����� �������';
  NSozdStation.ShowModal;
  UPaint;
end;

procedure TForm1.NSozdSatteliteClick(Sender: TObject);
begin
FAddSattelite.ShowModal;
LaKolSpytnik.Caption:='���������� ��������� - '+InttoStr(KOlSattelite);
UPaint;
end;

procedure TForm1.MapCMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
If (Button=mbLeft) and (NVisibleRast.Checked) then
  SelectPoint(0,X,Y);
UPaint;
MeSattelite.Visible:=false;
MeStation.Visible:=false;
If (Button=mbLeft) then
  begin
  SelectStation(0,X,Y,PMapC.Left,PMapC.Top);
  SelectSattelite(0,X,Y,PMapC.Left,PMapC.Top);
  If NVisibleZoneRadiovidimosti.Checked then
    PaintEllipsSviazC(0,X,Y,RadVid,ClZoneSviaz.Selected,SeWidthZoneSviaz.Value);
  VivodAllStation(Form1.MeAllStation);
  end;
end;

procedure TForm1.CbPenColorChange(Sender: TObject);
begin
UPaint;
end;

procedure TForm1.MapSMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
If (Button=mbLeft) and (NVisibleRast.Checked) then
  SelectPoint(1,X,Y);
UPaint;
MeSattelite.Visible:=false;
MeStation.Visible:=false;
If (Button=mbLeft) then
  begin
  SelectStation(1,X,Y,PMapS.Left,PMapS.Top);
  SelectSattelite(1,X,Y,PMapS.Left,PMapS.Top);
  If NVisibleZoneRadiovidimosti.Checked then
    PaintEllipsSviazC(1,X,Y,RadVid,ClZoneSviaz.Selected,SeWidthZoneSviaz.Value);
  VivodAllStation(Form1.MeAllStation);
  end;
end;


procedure TForm1.BtCleartraektoryClick(Sender: TObject);
var
CSet:PSattelite;
begin
CSet:=Sattelite;
While CSet<>nil do
  begin
  DeletTraektory(CSet);
  CSet:=CSet.Next;
  end;
end;

procedure TForm1.BtGoClick(Sender: TObject);
var
  CSta:PStation;
  i:word;
begin
FirstProgon:=true;
CSta:=Station;
While CSta<>nil do
  begin
  SetLength(CSta.SatteliteVisible,KolSattelite);
  For i:=0 to KolSattelite do
    CSta.SatteliteVisible[i]:=false;
  CSta:=CSta.Next;
  end;
Timer.Interval:=StrToInt(LeZaderzka.Text);
Timer.Enabled:=true;
BtStop.Visible:=true;
BtGo.Visible:=false;
end;

Procedure vivodStatistiki(Tip:word);
begin
Form1.SgStat.Cells[1,1]:=IntToStr(KolSeans);
Form1.SgStat.Cells[1,2]:=IntToStr(KolKollis);
If (tip<>1) and (tip<>3) then
  Form1.SgStat.Cells[1,3]:=FloatToStr(TimeSeans/KolSeans)
else
  If KolSeans<>1 then
    Form1.SgStat.Cells[1,3]:=FloatToStr(TimeSeans/(KolSeans-1));
If KolKollis<>0 then
  Form1.SgStat.Cells[1,4]:=FloatToStr(TimeKolis/KolKollis)
else
  Form1.SgStat.Cells[1,4]:='0';
end;

Procedure NewSobitie(Tip:Byte; Time:real; SatteliteSobitie:PSattelite);
var
  NewSobitie:PSobitie;
begin
  New(NewSobitie);
  NewSobitie.Time:=time;
  NewSobitie.Sobitie:=Tip;
  NewSobitie.Sattelite:=satteliteSobitie;
  NewSobitie.Next:=nil;
  case Tip of
    1:begin
      Inc(KolSeans);
      NatTimeGo:=Time;
      end;
    2:begin
      Inc(KolKollis);
      TimeSeans:=TimeSeans+(Time-NatTimeGo);
      NatTimeGo:=Time;
      end;
    4:begin
      TimeSeans:=TimeSeans+(Time-NatTimeGo);
      NatTimeGo:=Time;
      end;
    3:begin
      Inc(KolSeans);
      TimeKolis:=TimeKolis+(Time-NatTimeGo);
      NatTimeGo:=Time;
      end;
    end;
  VivodStatistiki(Tip);
  AddSobitie(NewSobitie);
end;

procedure TForm1.TimerTimer(Sender: TObject);
var
  CSet:PSattelite;
  CSta:PStation;
  NewTraektory:PTraektory;
  TimeH,TimeM,TimeS,i,j,Ch:word;
  R:Real;
begin
  CSet:=Sattelite;
  i:=0;
  While CSet<>nil do
    begin
    New(NewTraektory);
    NewTraektory.Next:=nil;
    NewTraektory.Sh:=CSet.Sat.Sh;
    NewTraektory.Dl:=CSet.Sat.Dl;
    Addtraektory(CSet,NewTraektory);
    NextKoordSputnik(CSet.Sat.ArgSh,CSet.Sat.YgolNaklona,CSet.Sat.DolgotaVoshYzla,CSet.Sat.H,CSet.Sat.Sh,CSet.Sat.Dl);
    TimeH:=trunc(TimeModel/(60*60));
    TimeM:=Trunc((TimeModel-TimeH*60*60)/60);
    TimeS:=trunc(TimeModel-TimeH*60*60-TimeM*60);
    CSta:=SelectSta;
{    CSta:=Station;
    While CSta<>nil do}
    If CSta<>nil then
      begin
      VitRadVid(CSta.St.YgolMesta,CSet.Sat.H);      
      Rast(CSet.Sat.Sh,CSet.Sat.Dl,CSta.St.Sh,CSta.St.Dl,R);
      If (not (CSta.SatteliteVisible[i])) and (RadVid>=R) then
        begin
        CSta.SatteliteVisible[i]:=true;
        Ch:=0;
        For j:=0 to KOlSattelite-1 do
          If CSta.SatteliteVisible[j] then
            Inc(Ch);
        If Ch>1 then
          NewSobitie(2,GlobalTimeModel+TimeModel,CSet)
        else
          NewSobitie(1,GlobalTimeModel+TimeModel,CSet);
        MeSviaz.Lines.Add('� ���� ��������� ������� '+CSta.St.Name+' ����� ������� '+CSet.Sat.Text);
        MeSviaz.Lines.Add('����� ������ �������� - '+IntToStr(TimeH)+'�'+IntToStr(TimeM)+'�'+IntToStr(TimeS)+'���');
        end;
      If ((CSta.SatteliteVisible[i])) and (RadVid<R) then
        begin
        CSta.SatteliteVisible[i]:=false;
        Ch:=0;
        For j:=0 to KOlSattelite-1 do
          If CSta.SatteliteVisible[j] then
            Inc(Ch);
        If Ch>0 then
          NewSobitie(3,GlobalTimeModel+TimeModel,CSet)
        else
          NewSobitie(4,GlobalTimeModel+TimeModel,CSet);
        MeSviaz.Lines.Add('�� ���� ��������� ������� '+CSta.St.Name+' ����� ������� '+CSet.Sat.Text);
        MeSviaz.Lines.Add('����� ��������� �������� - '+IntToStr(TimeH)+'�'+IntToStr(TimeM)+'�'+IntToStr(TimeS)+'���');
        end;
{      CSta:=CSta.Next;}
      end;
    Inc(i);
    CSet:=CSet.Next;
    end;
  LaTime.Caption:='����� ������������� - '+IntToStr(TimeH)+'�'+IntToStr(TimeM)+'�'+IntToStr(TimeS)+'���';
  TimeH:=trunc((GlobalTimeModel+TimeModel)/(60*60));
    If TimeH>=24 then
      begin
      TimeH:=TimeH-24;
      date1.Date:=date1.Date+1;
      end;
  TimeM:=Trunc((TimeModel-TimeH*60*60)/60);
  TimeS:=trunc(TimeModel-TimeH*60*60-TimeM*60);
  LaObTime.Caption:='����� - '+IntToStr(TimeH)+'�'+IntToStr(TimeM)+'�'+IntToStr(TimeS)+'���';
  If Form1.CbVisibletraektoria.Checked then
    begin
    CSet:=Sattelite;
    While CSet<>nil do
      begin
      PaintTraektory(CSet);
      CSet:=CSet.Next;
      end;
    end
  else
    UPaint;
  VivodSpytnik;
  If NVisibleCiklogramm.Checked then
    begin
    SbCiklogramm.Max:=Trunc((TimeModel+StrToInt(LeVremiaC.Text))/ShagTime);
    If SbCiklogramm.Position*ShagTime+StrToInt(LeVremiaC.Text)>=TimeModel then
      VivodChiklogramm;
    end;
end;

procedure TForm1.BtStopClick(Sender: TObject);
begin
Timer.Enabled:=false;
BtStop.Visible:=false;
BtGo.Visible:=True;
end;

procedure TForm1.LeVremiaChange(Sender: TObject);
begin
If LeVremia.Text<>'' then
  begin
  LeShagArgShir.Text:='';
  LeShagArgShir.Enabled:=false;
  end
else
  LeShagArgShir.Enabled:=true;
end;

procedure TForm1.LeShagArgShirChange(Sender: TObject);
begin
If LeShagArgShir.Text<>'' then
  begin
  LeVremia.Text:='';
  LeVremia.Enabled:=false;
  end
else
  LeVremia.Enabled:=true;
end;



procedure TForm1.BtSaveStationClick(Sender: TObject);
var
  f:File of TStation;
  CStation:PStation;
begin
if (SD.Execute) then          //���� ����� �����
  begin
  AssignFile(f,SD.FileName);
  Rewrite(f);
  CStation:=Station;
  While CStation<>nil do
    begin
    Write(f,CStation.St);
    CStation:=CStation.Next;
    end;
  CloseFile(f);
  ShowMessage('���������� ������� ���������');
  end;
end;

procedure TForm1.BtLoadStationClick(Sender: TObject);
var
  f:File of TStation;
  CStation:PStation;
  st:TStation;
begin
if (OD.Execute) then          //���� ����� �����
  begin
  AssignFile(f,OD.FileName);
  {$I-}
  Reset(f);
  {$I+}
  If IOResult<>0 then
    begin
    ShowMessage('���� �� ������');
    Exit;
    end
  else
  While not eof(f) do
    begin
    read(f,St);
    New(CStation);
    CStation.St:=St;
    CStation.SatteliteVisible:=nil;
    CStation.Next:=nil;
    AddStation(CStation);
    end;
  CloseFile(f);
  ShowMessage('�������� ������� ���������');
  end;
  UPaint;
end;

procedure TForm1.NSaveSatteliteClick(Sender: TObject);
var
  f:File of TSattelite;
  CSattelite:PSattelite;
begin
if (SD.Execute) then          //���� ����� �����
  begin
  AssignFile(f,SD.FileName);
  Rewrite(f);
  CSattelite:=Sattelite;
  While CSattelite<>nil do
    begin
    Write(f,CSattelite.Sat);
    CSattelite:=CSattelite.Next;
    end;
  CloseFile(f);
  ShowMessage('���������� ������� ���������');
  end;
end;

procedure TForm1.NLoadSatteliteClick(Sender: TObject);
var
  f:File of TSattelite;
  CSattelite:PSattelite;
  st:TSattelite;
begin
if (OD.Execute) then          //���� ����� �����
  begin
  AssignFile(f,OD.FileName);
  {$I-}
  Reset(f);
  {$I+}
  If IOResult<>0 then
    begin
    ShowMessage('���� �� ������');
    Exit;
    end
  else
  While not eof(f) do
    begin
    read(f,St);
    New(CSattelite);
    CSattelite.Choose:=true;
    CSattelite.Sat:=St;
    CSattelite.Traektory:=nil;
    CSattelite.LastTraektory:=nil;
    CSattelite.Next:=nil;
    Inc(KolSattelite);
    AddSattelite(CSattelite);
    end;
  CloseFile(f);
  ShowMessage('�������� ������� ���������');
  end;
  UPaint;
  VivodSpytnik;
end;

procedure TForm1.NVisibleSetkaClick(Sender: TObject);
begin
VisiblePanel(NVisibleSetka.Checked,PSetka,AlLeft);
end;

procedure TForm1.NVisibleRastClick(Sender: TObject);
begin
VisiblePanel(NVisibleRast.Checked,GbRast,AlLeft);
end;

procedure TForm1.NVisibleAllStationClick(Sender: TObject);
begin
VisiblePanel(NVisibleAllStation.Checked,GbVisibleStation,AlLeft);
end;

procedure TForm1.NVisiblesatteliteClick(Sender: TObject);
begin
VisiblePanel(NVisiblesattelite.Checked,GbVisibleAllSpytnik,AlTop);
end;

procedure TForm1.NVisibleZoneRadiovidimostiClick(Sender: TObject);
begin
VisiblePanel(NVisibleZoneRadiovidimosti.Checked,GbRadioVidimost,AlLeft);
end;

procedure TForm1.NVisibleModelClick(Sender: TObject);
begin
VisiblePanel(NVisibleModel.Checked,GbDvishSpytnik,AlLeft);
end;

procedure TForm1.NVisibleSelectStationClick(Sender: TObject);
begin
VisiblePanel(NVisibleSelectStation.Checked,GbSelectStation,AlLeft);
end;

procedure TForm1.NVisibleProtokolClick(Sender: TObject);
begin
VisiblePanel(NVisibleProtokol.Checked,GbProtocol,AlLeft);
end;

procedure TForm1.NVisibleStatistikClick(Sender: TObject);
begin
VisiblePanel(NVisibleStatistik.Checked,GbStat,AlLeft);
end;

procedure TForm1.NVisibleCiklogrammClick(Sender: TObject);
begin
VisiblePanel(NVisibleCiklogramm.Checked,GbChiklogramm,AlTop);
end;

procedure TForm1.LeHRadiovidimostiChange(Sender: TObject);
begin
RadVid:=StrToFloat(LeHRadiovidimosti.Text);
end;

procedure TForm1.NChooseStationClick(Sender: TObject);
begin
FViborStation.ShowModal;
If SelectSta<>nil then
  begin
  VivodStation;
  NIzmenitStation.Enabled:=true;
  end;
end;

procedure TForm1.NIzmenitStationClick(Sender: TObject);
begin
NSozdStation.Caption:='�������� ��������� �������';
NSozdStation.ShowModal;
VivodStation;
UPaint;
end;

procedure TForm1.SbCiklogrammChange(Sender: TObject);
begin
VivodChiklogramm;
end;

end.
