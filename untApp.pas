unit untApp;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics,
  {$IFDEF ANDROID}
  Androidapi.Jni.Os,
  Androidapi.Jni.Widget,
  Androidapi.Helpers,
  Androidapi.Jni.JavaTypes,
  Androidapi.JniBridge,
  Androidapi.Jni.GraphicsContentViewText,
  FMX.DialogService.Async,
  FMX.Helpers.Android,
  Androidapi.JNI.App,
  {$ENDIF}
  FMX.Dialogs, FMX.Controls.Presentation, FMX.StdCtrls, FMX.Layouts;

type
  TfrmApp = class(TForm)
    Layout1: TLayout;
    Button1: TButton;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmApp: TfrmApp;

implementation

{$R *.fmx}



procedure TfrmApp.Button1Click(Sender: TObject);
var activity : JActivity;
    window : JWindow;
  begin
    {$IFDEF ANDROID}
      activity := TAndroidHelper.Activity;
	    window := activity.getWindow;

	    window.setFlags(TJWindowManager_LayoutParams.JavaClass.FLAG_TRANSLUCENT_STATUS,
	    TJWindowManager_LayoutParams.JavaClass.FLAG_TRANSLUCENT_STATUS);

      window.setFlags(TJWindowManager_LayoutParams.JavaClass.FLAG_LAYOUT_NO_LIMITS,
	    TJWindowManager_LayoutParams.JavaClass.FLAG_LAYOUT_NO_LIMITS);
    {$ENDIF}
  end;

procedure TfrmApp.Button2Click(Sender: TObject);
var activity : JActivity;
    window : JWindow;
  begin
    {$IFDEF ANDROID}
      activity := TAndroidHelper.Activity;
	    window := activity.getWindow;

	    window.clearFlags(TJWindowManager_LayoutParams.JavaClass.FLAG_TRANSLUCENT_STATUS);
      window.clearFlags(TJWindowManager_LayoutParams.JavaClass.FLAG_LAYOUT_NO_LIMITS);
    {$ENDIF}
  end;

end.
