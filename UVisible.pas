unit UVisible;

interface

Uses Controls, StdCtrls, Windows, SysUtils, Graphics;

Const
  ShagTime = 600;

Procedure VivodSpytnik;
Procedure VisiblePanel(Visible:Boolean; Panel:TGroupBox; Align:TAlign);
Procedure VivodAllStation(Me:TMemo);
Procedure VivodStation;
Procedure VivodChiklogramm;

implementation

Uses UMainForm,UObj;

Procedure VivodSpytnik;
var
  CSattelite:PSattelite;
  i:word;
  st:string;
  Gr,Mn,Sk:real;
  Rect:TRect;
begin
  i:=0;
  CSattelite:=Sattelite;
  While CSattelite<>nil do
    begin
    Inc(i);
    Form1.SgSpytnik.RowCount:=i+1;
    Form1.SgSpytnik.Cells[0,i]:='№'+IntToStr(i);
    Form1.SgSpytnik.Cells[1,i]:=CSattelite.Sat.Text;
    Gr:=CSattelite.Sat.Sh;
    GrToFormat(FormatKoord,Gr,Mn,Sk);
    GiveKoordFormat(Gr,Mn,Sk,st);
    If st[1]='-' then
      begin
      Delete(st,1,1);
      St:=St+' СШ';
      end
    else
      St:=St+' ЮШ';
    Form1.SgSpytnik.Cells[2,i]:=st;
    Gr:=CSattelite.Sat.Dl;
    GrToFormat(FormatKoord,Gr,Mn,Sk);
    GiveKoordFormat(Gr,Mn,Sk,st);
    If st[1]='-' then
      begin
      Delete(st,1,1);
      St:=St+' ЗД';
      end
    else
      St:=St+' ВД';
    Form1.SgSpytnik.Cells[3,i]:=St;
    Form1.SgSpytnik.Cells[4,i]:=FloatTostr(CSattelite.Sat.H)+'км';
    Form1.SgSpytnik.Cells[5,i]:=FloatTostr(CSattelite.Sat.YgolNaklona)+'°';
    Gr:=CSattelite.Sat.DolgotaVoshYzla;
    GrToFormat(FormatKoord,Gr,Mn,Sk);
    GiveKoordFormat(Gr,Mn,Sk,st);
    If st[1]='-' then
      begin
      Delete(st,1,1);
      St:=St+' ЗД';
      end
    else
      St:=St+' ВД';
    Form1.SgSpytnik.Cells[6,i]:=St;
    Rect:=Form1.SgSpytnik.CellRect(7,i);
    Form1.SgSpytnik.Canvas.Brush.Color:=CSattelite.Sat.ColorTraektory;
    Form1.SgSpytnik.Canvas.Pen.Color:=CSattelite.Sat.ColorTraektory;
    Form1.SgSpytnik.Canvas.Rectangle(rect);
    If CSattelite.Choose then
      Form1.SgSpytnik.Cells[8,i]:='ДА'
    else
      Form1.SgSpytnik.Cells[8,i]:='Нет';
    CSattelite:=CSattelite.Next;
    end;
end;

Procedure VisiblePanel(Visible:Boolean; Panel:TGroupBox; Align:TAlign);
begin
If Visible then
  begin
  Panel.Visible:=true;
  Panel.Align:=Align;
  end
else
  begin
  Panel.Visible:=False;
  Panel.Align:=AlCustom;
  end;
end;

Procedure VivodAllStation(Me:TMemo);
var
  CSta:PStation;
  st,st1,st2:string;
  i:word;
begin
Me.Clear;
CSta:=Station;
While CSta<>nil do
  begin
  FormatKoordSt(CSta.St.Sh,CSta.St.Dl,St1,St2);
  ME.Lines.Add(St2+', '+St1+' - '+CSta.St.Name);
  CSta:=CSta.Next;
  end;
end;

Procedure VivodStation;
var
  st1,st2:string;
  Sh,Dl,Mn,Sk:real;
begin
Form1.LaStation.Caption:='Станция '+SelectSta.St.Name;
Form1.MeSelectStation.Clear;
Form1.MeSelectStation.Lines.Add('Название: '+SelectSta.St.Name);
FormatKoordSt(SelectSta.St.Sh,SelectSta.St.Dl,St1,St2);
Form1.MeSelectStation.Lines.Add('Широта: '+St1);
Form1.MeSelectStation.Lines.Add('Долгота: '+St2);
Form1.MeSelectStation.Lines.Add('Страна: '+SelectSta.St.Contry);
If SelectSta.St.Sezonnost then
  Form1.MeSelectStation.Lines.Add('Сезонная')
else
  Form1.MeSelectStation.Lines.Add('Постоянная');
Form1.MeSelectStation.Lines.Add('Население: '+SelectSta.St.Chisl);
Form1.MeSelectStation.Lines.Add('Описание: '+SelectSta.St.Text);
end;

Procedure VivodChiklogramm;
var
  ShXTime,NatTime:real;
  Sob:PSobitie;
  XPred,X:word;
  TimeH,TimeM,TimeS:word;
begin
With Form1.PbCiklogramm.Canvas do
  begin
  Brush.Color:=ClBtnFace;
  Pen.Width:=0;
  Rectangle(0,0,Form1.PbCiklogramm.Width,Form1.PbCiklogramm.Height);
  pen.Color:=ClBlack;
  Pen.Width:=1;
  NatTime:=Form1.SbCiklogramm.Position*ShagTime;
  XPred:=0;
  Brush.Color:=ClBtnFace;
  Pen.Width:=1;
  Pen.Color:=ClBlack;
  MoveTo(0,Form1.PbCiklogramm.Height-5);
  LineTo(Form1.PbCiklogramm.Width,Form1.PbCiklogramm.Height-5);
  ShXTime:=Form1.PbCiklogramm.Width/StrToInt(Form1.LeVremiaC.Text);
  Pen.Width:=8;
  Pen.Color:=ClRed;
  MoveTo(0,Form1.PbCiklogramm.Height-5);
  LineTo(trunc((TimeModel-NatTime)*ShXTime),Form1.PbCiklogramm.Height-5);
  Sob:=Sobitie;
  While Sob<>nil do
    begin
    If (Sob.Time-GlobalTimeModel>NatTime) and
       (Sob.Time-GlobalTimeModel<NatTime+StrToInt(Form1.LeVremiaC.Text)) then
      begin
      X:=Trunc((Sob.Time-GlobalTimeModel-NatTime)*ShXTime);
      Pen.Color:=ClYellow;
      MoveTo(x,5);
      LineTo(x,Form1.PbCiklogramm.Height-5);
      Pen.Color:=Brush.Color;
      Rectangle(XPred+1,35,X-1,Form1.PbCiklogramm.Height-5);
      Brush.Color:=ClBtnFace;
      TextOut(x,0,Sob.Sattelite.Sat.Text);
      TimeH:=trunc((Sob.Time)/(60*60));
      TimeM:=Trunc((Sob.Time-TimeH*60*60)/60);
      TimeS:=trunc(Sob.Time-TimeH*60*60-TimeM*60);
      TextOut(x,15,IntToStr(TimeH)+'ч'+IntToStr(TimeM)+'м'+IntToStr(TimeS)+'сек');
      XPred:=X;
      Case Sob.Sobitie of
        1,3:Brush.Color:=ClGreen;
        2:Brush.Color:=Clred;
        4:Brush.Color:=ClBtnFace;
        end;
      end;
    Sob:=Sob.Next;
    end;
  end;
end;

end.
