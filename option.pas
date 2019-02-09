unit option;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Spin,Tlhelp32, Menus, Shellapi;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    RadioGroup1: TRadioGroup;
    Button1: TButton;
    Label1: TLabel;
    RadioGroup2: TRadioGroup;
    GroupBox1: TGroupBox;
    CheckBox1: TCheckBox;
    SpinEdit1: TSpinEdit;
    Label2: TLabel;
    Label3: TLabel;
    SpinEdit2: TSpinEdit;
    SpinEdit3: TSpinEdit;
    Label4: TLabel;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    SpinEdit4: TSpinEdit;
    Label5: TLabel;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioGroup3: TRadioGroup;
    CheckBox4: TCheckBox;
    SpinEdit5: TSpinEdit;
    Label6: TLabel;
    Button2: TButton;
    Button3: TButton;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    WebSite1: TMenuItem;
    About1: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure SpinEdit1Change(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure SpinEdit2Change(Sender: TObject);
    procedure SpinEdit3Change(Sender: TObject);
    procedure RadioGroup2Click(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SpinEdit5Change(Sender: TObject);
    procedure CheckBox4Click(Sender: TObject);
    procedure RadioGroup3Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure CheckBox3Click(Sender: TObject);
    procedure SpinEdit4Change(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure WebSite1Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N10Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    fulltext:string;
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

 function KillTask(ExeFileName:string):integer;
const
PROCESS_TERMINATE=$0001;
var
Co:BOOL;
FS:THandle;
FP:TProcessEntry32;
begin
result:=0;
FS:=CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS,0);
FP.dwSize:=Sizeof(FP);
Co:=Process32First(FS,FP);
while integer(Co) <> 0 do
begin
if ((UpperCase(ExtractFileName(FP.szExeFile))=UpperCase(ExeFileName)) or
(UpperCase(FP.szExeFile)=UpperCase(ExeFileName))) then
Result:=Integer(TerminateProcess(OpenProcess(PROCESS_TERMINATE, BOOL(0),
FP.th32ProcessID),0));
Co:=Process32Next(FS,FP);
end;
CloseHandle(FS);
end;

procedure TForm1.FormCreate(Sender: TObject);
var
i1, i2, i3,i4, I5,i6,i7, i8, i9, i10,i11,i12,i,K:Integer;
Strn:String;
begin
Memo1.Lines.LoadFromFile('Config.json');
fulltext:=memo1.Text;

for i:=0 to Memo1.Lines.Count-1 do
begin
strn:=form1.Memo1.Lines[i];
i5:=Pos('pause',Strn);
if i5<>0 then
begin
    SpinEdit1.Tag:=StrToInt(Copy (Strn,i5+1+Length('pause: '),Length(Strn)-pos('0, ',strn)-3));
    SpinEdit1.Value:=  SpinEdit1.Tag;
end;
i1:=Pos('state_timeout":',Strn);
if i1<>0 then
begin
//Showmessage('@'+Copy (Strn,i1+Length('state_timeout": '),Length(Strn)-pos('0, ',strn)-i1-5)+'@');
    SpinEdit2.Tag:=StrToInt(Copy (Strn,i1+Length('state_timeout": '),Length(Strn)-pos('0, ',strn)-i1-5));
    SpinEdit2.Value:=  SpinEdit2.Tag;

end;

i2:=Pos('opponent_timeout":',Strn);
if i2<>0 then
begin
//Showmessage('@'+Copy (Strn,i2+Length('opponent_timeout": '),Length(Strn)-pos(',',strn)-i2-3)+'@');
   SpinEdit3.Tag:=StrToInt(Copy (Strn,i2+Length('opponent_timeout": '),Length(Strn)-pos(',',strn)-i2-3));
   SpinEdit3.Value:=  SpinEdit3.Tag;
end;

i3:=Pos('program":',Strn);
if i3<>0 then
begin
//Showmessage('@'+Copy (Strn,i3+Length('program": '),Length(Strn)-pos(',',strn)-i3)+'@');
 if Copy (Strn,i3+Length('program": '),Length(Strn)-pos(',',strn)-i3)='0' then
 RadioGroup2.ItemIndex:=0;
 if Copy (Strn,i3+Length('program": '),Length(Strn)-pos(',',strn)-i3)='1' then
 RadioGroup2.ItemIndex:=1;
 if Copy (Strn,i3+Length('program": '),Length(Strn)-pos(',',strn)-i3)='2' then
 RadioGroup2.ItemIndex:=2;
 RadioGroup2.Tag:=  StrToInt(Copy (Strn,i3+Length('program": '),Length(Strn)-pos(',',strn)-i3));
end;

i4:=Pos('algorithm":',Strn);
if i4<>0 then
begin
 if Copy (Strn,i4+Length('algorithm": '),Length(Strn)-pos(',',strn)-i4-1)='0' then
 RadioButton1.Checked:=true;
 if Copy (Strn,i4+Length('algorithm": '),Length(Strn)-pos(',',strn)-i4-1)='1' then
 RadioButton2.Checked:=true;

 GroupBox2.Tag:=  StrToInt(Copy (Strn,i4+Length('algorithm": '),Length(Strn)-pos(',',strn)-i4-1));


end;

i6:=Pos('arena_ticket":',Strn);
if i6<>0 then
begin
 if Copy (Strn,i6+Length('arena_ticket": '),1)='0' then
 RadioGroup3.ItemIndex:=0;
 if Copy (Strn,i6+Length('arena_ticket": '),1)='1' then
 RadioGroup3.ItemIndex:=1;
 if Copy (Strn,i6+Length('arena_ticket": '),1)='2' then
 RadioGroup3.ItemIndex:=2;
 if Copy (Strn,i6+Length('arena_ticket": '),1)='3' then
 RadioGroup3.ItemIndex:=3;

  RadioGroup3.Tag:=  StrToInt(Copy (Strn,i6+Length('arena_ticket": '),Length(Strn)-pos(',',strn)-i6-1));


end;


i12:=Pos('capute_mode": ',Strn);
if i12<>0 then
begin
 if Copy (Strn,i12+Length('capute_mode": '),1)='0' then
 CheckBox1.Checked:=false else
 if Copy (Strn,i12+Length('capute_mode": '),1)='1' then
 CheckBox1.Checked:=true;
end;


i7:=Pos('check_mail":',Strn);
if i7<>0 then
begin
 if Copy (Strn,i7+Length('check_mail": '),1)='0' then
 CheckBox4.Checked:=false else
 if Copy (Strn,i7+Length('check_mail": '),1)='1' then
 CheckBox4.Checked:=true;
end;

i8:=Pos('my_power_scale":',Strn);
if i8<>0 then
begin
SpinEdit5.Tag:=StrToint(Copy (Strn,i8+Length('my_power_scale": 0.'),2));
SpinEdit5.Value:=  SpinEdit5.Tag;
end;

i9:=Pos('portal_level" : ',Strn);
if i9<>0 then
begin
SpinEdit4.Tag:=StrToint(trim(Copy (Strn,i9+Length('portal_level" : '),3)));
SpinEdit4.Value:=  SpinEdit4.Tag;
end;

i10:=Pos('stir_buy": ',Strn);
if i10<>0 then
begin
//SpinEdit5.Tag:=StrToint(Copy (Strn,i10+Length('stir_buy": '),1));
if Copy (Strn,i10+Length('stir_buy": '),1)='0' then
 CheckBox2.Checked:=false else
 if Copy (Strn,i10+Length('stir_buy": '),1)='1' then
 CheckBox2.Checked:=true;
end;

i11:=Pos('update_soon": ',Strn);
if i11<>0 then
begin

if Copy (Strn,i11+Length('update_soon": '),1)='0' then
 CheckBox3.Checked:=false else
 if Copy (Strn,i11+Length('update_soon": '),1)='1' then
 CheckBox3.Checked:=true;
end;

end;

end;

procedure TForm1.RadioGroup1Click(Sender: TObject);
begin
 if RadioGroup1.ItemIndex = 0 then
Memo1.Lines.Text:=StringReplace(Memo1.Lines.Text,'emulator": 1,','emulator": 0,',[rfreplaceall]) else
Memo1.Lines.Text:=StringReplace(Memo1.Lines.Text,'emulator": 0,','emulator": 1,',[rfreplaceall]);
end;

procedure TForm1.CheckBox1Click(Sender: TObject);
begin
if CheckBox1.Checked then
 Memo1.Lines.Text:=StringReplace(Memo1.Lines.Text,'capute_mode": 0,','capute_mode": 1,',[rfreplaceall]) else
Memo1.Lines.Text:=StringReplace(Memo1.Lines.Text,'capute_mode": 1,','capute_mode": 0,',[rfreplaceall]);
end;

procedure TForm1.SpinEdit1Change(Sender: TObject);
begin
//ShowMessage(IntToStr (SpinEdit1.Tag));
 Memo1.Lines.Text:=StringReplace(Memo1.Lines.Text,'pause": '+IntToStr(spinedit1.tag)+',','pause": '+IntToStr(spinedit1.Value)+',',[rfreplaceall]);
 SpinEdit1.Tag:=SpinEdit1.Value;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
Memo1.Lines.SaveToFile('Config.json');
fulltext:=memo1.Text;
end;

procedure TForm1.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
var
l:integer;
begin
if fulltext<>memo1.Text then
begin
l:=MessageDlg('Save "Config.json" file ?',mtConfirmation,mbYesNoCancel,0);
 if l=MrYes then Memo1.Lines.SaveToFile('Config.json');

 end;
 KillTask('hc_bot.exe');
end;

procedure TForm1.SpinEdit2Change(Sender: TObject);
begin
Memo1.Lines.Text:=StringReplace(Memo1.Lines.Text,'state_timeout": '+IntToStr(spinedit2.tag)+',','state_timeout": '+IntToStr(spinedit2.Value)+',',[rfreplaceall]);
 SpinEdit2.Tag:=SpinEdit2.Value;
end;

procedure TForm1.SpinEdit3Change(Sender: TObject);
begin
Memo1.Lines.Text:=StringReplace(Memo1.Lines.Text,'opponent_timeout": '+IntToStr(spinedit3.tag)+',','opponent_timeout": '+IntToStr(spinedit3.Value)+',',[rfreplaceall]);
 SpinEdit3.Tag:=SpinEdit3.Value;
end;

procedure TForm1.RadioGroup2Click(Sender: TObject);
begin
  if RadioGroup2.ItemIndex = 0 then
  begin
Memo1.Lines.Text:=StringReplace(Memo1.Lines.Text,'program": '+IntToStr(RadioGroup2.tag)+',','program": 0,',[rfreplaceall]);
  GroupBox2.Visible:=true;
  GroupBox1.Visible:=false;
  GroupBox3.Visible:=false;
end;

  if RadioGroup2.ItemIndex = 1 then
  begin
Memo1.Lines.Text:=StringReplace(Memo1.Lines.Text,'program": '+IntToStr(RadioGroup2.tag)+',','program": 1,',[rfreplaceall]);
  GroupBox2.Visible:=false;
  GroupBox1.Visible:=true;
  GroupBox3.Visible:=false;
end;

  if RadioGroup2.ItemIndex = 2 then
  begin
Memo1.Lines.Text:=StringReplace(Memo1.Lines.Text,'program": '+IntToStr(RadioGroup2.tag)+',','program": 2,',[rfreplaceall]);
   GroupBox2.Visible:=false;
  GroupBox1.Visible:=false;
  GroupBox3.Visible:=true;
  end;

RadioGroup2.tag:= RadioGroup2.ItemIndex;

end;

procedure TForm1.RadioButton1Click(Sender: TObject);
begin
 Memo1.Lines.Text:=StringReplace(Memo1.Lines.Text,'algorithm": '+IntToStr(RadioButton1.tag),'algorithm": 0',[rfreplaceall]);
 RadioButton1.tag:= 0;
end;

procedure TForm1.RadioButton2Click(Sender: TObject);
begin
 Memo1.Lines.Text:=StringReplace(Memo1.Lines.Text,'algorithm": '+IntToStr(RadioButton1.tag),'algorithm": 1',[rfreplaceall]);
 RadioButton1.tag:= 1;
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  RadioGroup2Click(self);
end;

procedure TForm1.SpinEdit5Change(Sender: TObject);
begin
 Memo1.Lines.Text:=StringReplace(Memo1.Lines.Text,'power_scale": 0.'+IntToStr(spinedit5.tag),'power_scale": 0.'+IntToStr(spinedit5.Value),[rfreplaceall]);
 SpinEdit5.Tag:=SpinEdit5.Value;
end;

procedure TForm1.CheckBox4Click(Sender: TObject);
begin
if CheckBox4.Checked then
 Memo1.Lines.Text:=StringReplace(Memo1.Lines.Text,'check_mail": 0','check_mail": 1',[rfreplaceall])
else
  Memo1.Lines.Text:=StringReplace(Memo1.Lines.Text,'check_mail": 1','check_mail": 0',[rfreplaceall]);
end;

procedure TForm1.RadioGroup3Click(Sender: TObject);
begin
  if RadioGroup3.ItemIndex = 0 then
  begin
Memo1.Lines.Text:=StringReplace(Memo1.Lines.Text,'arena_ticket": '+IntToStr(RadioGroup3.tag),'arena_ticket": 0',[rfreplaceall]);
  end;
  if RadioGroup3.ItemIndex = 1 then
  begin
Memo1.Lines.Text:=StringReplace(Memo1.Lines.Text,'arena_ticket": '+IntToStr(RadioGroup3.tag),'arena_ticket": 1',[rfreplaceall]);
  end;
  if RadioGroup3.ItemIndex = 2 then
  begin
Memo1.Lines.Text:=StringReplace(Memo1.Lines.Text,'arena_ticket": '+IntToStr(RadioGroup3.tag),'arena_ticket": 2',[rfreplaceall]);
  end;
  if RadioGroup3.ItemIndex = 3 then
  begin
Memo1.Lines.Text:=StringReplace(Memo1.Lines.Text,'arena_ticket": '+IntToStr(RadioGroup3.tag),'arena_ticket": 3',[rfreplaceall]);
  end;

RadioGroup3.tag:= RadioGroup3.ItemIndex;
end;

procedure TForm1.CheckBox2Click(Sender: TObject);
begin
if CheckBox2.Checked then
 Memo1.Lines.Text:=StringReplace(Memo1.Lines.Text,'stir_buy": 0','stir_buy": 1',[rfreplaceall])
else
  Memo1.Lines.Text:=StringReplace(Memo1.Lines.Text,'stir_buy": 1','stir_buy": 0',[rfreplaceall]);
end;

procedure TForm1.CheckBox3Click(Sender: TObject);
begin
if CheckBox3.Checked then
 Memo1.Lines.Text:=StringReplace(Memo1.Lines.Text,'update_soon": 0','update_soon": 1',[rfreplaceall])
else
  Memo1.Lines.Text:=StringReplace(Memo1.Lines.Text,'update_soon": 1','update_soon": 0',[rfreplaceall]);
end;

procedure TForm1.SpinEdit4Change(Sender: TObject);
begin
 Memo1.Lines.Text:=StringReplace(Memo1.Lines.Text,'portal_level" : '+IntToStr(spinedit4.tag),'portal_level" : '+IntToStr(spinedit4.Value),[rfreplaceall]);
 SpinEdit4.Tag:=SpinEdit4.Value;
end;

procedure TForm1.Button2Click(Sender: TObject);
var
l:integer;
begin
if Button2.Caption='Запуск бота' then
begin
if fulltext<>memo1.Text then
begin
l:=MessageDlg('Save "Config.json" file ?',mtConfirmation,mbYesNoCancel,0);
 if l=MrYes then
  begin
  Memo1.Lines.SaveToFile('Config.json');
  fulltext:=memo1.Text;
  end;
 end;
 if  n2.Checked =true then
  if WinExec('hc_bot.exe', SW_HIDE) < 32 then
        begin
                ShowMessage('А где файл  hc_bot.exe?!')
       end else Button2.Caption:='Остановить?';

 if n3.Checked=true then
  if WinExec('hc_bot.exe', SW_MINIMIZE) < 32 then
        begin
                ShowMessage('А где файл  hc_bot.exe?!')
       end else Button2.Caption:='Остановить?';

  n10.Enabled:=false;
  n4.Enabled:=true;
end else
begin
  KillTask('hc_bot.exe');
  Button2.Caption:='Запуск бота';
  n10.Enabled:=true;
  n4.Enabled:=false;
end;

end;

procedure TForm1.N4Click(Sender: TObject);
begin
  KillTask('hc_bot.exe');
  Button2.Caption:='Запуск бота';
  n10.Enabled:=true;
  n4.Enabled:=false;
end;

procedure TForm1.N7Click(Sender: TObject);
begin
  if WinExec('notepad Config.json', SW_NORMAL) < 32 then
        begin
                ShowMessage('Помести прогу  в папку с ботом')
        end;
end;

procedure TForm1.WebSite1Click(Sender: TObject);
begin
ShellExecute( Handle, 'open', 'https://vk.com/club175043291', nil, nil, SW_NORMAL );
end;

procedure TForm1.N6Click(Sender: TObject);
begin
Memo1.Lines.SaveToFile('Config.json');
fulltext:=memo1.Text;
end;

procedure TForm1.N2Click(Sender: TObject);
begin
N2.Checked:=true;
N3.Checked:=false;
end;

procedure TForm1.N3Click(Sender: TObject);
begin
N3.Checked:=true;
N2.Checked:=false;
end;

procedure TForm1.N10Click(Sender: TObject);
var
l:integer;
begin
if Button2.Caption='Запуск бота' then
begin
if fulltext<>memo1.Text then
begin
l:=MessageDlg('Save "Config.json" file ?',mtConfirmation,mbYesNoCancel,0);
 if l=MrYes then Memo1.Lines.SaveToFile('Config.json');
end;

 if  n2.Checked =true then
  if WinExec('hc_bot.exe', SW_HIDE) < 32 then
        begin
                ShowMessage('А где файл  hc_bot.exe?!')
       end else Button2.Caption:='Остановить?';

 if n3.Checked=true then
  if WinExec('hc_bot.exe', SW_MINIMIZE) < 32 then
        begin
                ShowMessage('А где файл  hc_bot.exe?!')
       end else Button2.Caption:='Остановить?';

  fulltext:=memo1.Text;
  n10.Enabled:=false;
  n4.Enabled:=true;
end else
begin
  KillTask('hc_bot.exe');
  Button2.Caption:='Запуск бота' ;
    n10.Enabled:=true;
  n4.Enabled:=false;
end;

end;

procedure TForm1.About1Click(Sender: TObject);
begin
ShellAbout(0, 'Setting HustleCastle''''s Bot ', PChar('Программа настройки бесплатного бота для приложения HustleCastle от Дениса Смирнова'), Application.Icon.Handle);
end;

end.
