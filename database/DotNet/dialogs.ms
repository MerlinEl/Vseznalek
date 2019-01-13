mcSystem.show UIAccessor

--Max v 2012
handles = (windows.getChildrenHWND 0 parent:#max)
print handles
UIAccessor.GetWindowText handles[1]
for i in handles do try print (UIAccessor.GetWindowText i) catch ()


--------------------------------------------------------------------------
--Accessing Transform Type-In Dialog
--------------------------------------------------------------------------
maxops.pivotmode=#pivotonly --enable pivot modiffy
max rotate --set tool to rotate
max tti -- open Transform Type-In Dialog

rtti=windows.getchildhwnd 0 "Rotate Transform Type-In" --get Rotate Transform Type-In Dialog (if is open else return undefined)
uia=uiaccessor
c_arr=uia.getchildwindows rtti[1] --get all components of this window
world_x=c_arr[3]
world_y=c_arr[6]
world_z=c_arr[9]
offset_x=c_arr[12]
offset_y=c_arr[15]
offset_z=c_arr[18]

 fn get_prev_c c=
  (
	  case c of
	  (
		  world_x:offset_z
		  world_y:world_x
		  world_z:world_y
		  offset_x:world_z
		  offset_y:offset_x
		  offset_z:offset_y
		  default:undefined
	  )
  )
  
  fn tab_on c=uia.sendmessage c 0x0100 0x09 0
  fn set_on c val=uia.setwindowtext c (val as string) 
  
  fn set_and_update_on c val=
  (
	  tab_on (get_prev_c c)
	  set_on c val
	  tab_on c
  )
  
  set_and_update_on offset_x 30
  set_and_update_on offset_z 5
  -- more staff here
  -- uia.closedialog rtti[1] 
  
--------------------------------------------------------------------------
--Accessing Maxscript Listener
--------------------------------------------------------------------------
listener_handles=(windows.getchildhwnd 0 "MaxScript Listener")  --get editor dialog   
1:HWND 
2:parent's HWND 
3:ancestor's HWND 
4:class name as a string 
5:window text as a string  
listener_handle = listener_handles[1]
  
listener_childerns = windows.getChildrenHWND listener_handle --get 2 Arrays from Maxscript Listener handle 
print listener_childerns
  
Array_1:  lower window
1:close window lower part from listener
2:"MAXScript Listener"
3:"MAXScript Listener"
4:"MXS_Scintilla"
5:All text from lower window -- listener_childerns[1][5]  
6:undefined
7:"MAXScript Listener"
8:"MAXScript Listener"

Array_2: upper window
1:close window upper part from listener
2:"MAXScript Listener"
3:"MAXScript Listener"
4:"MXS_Scintilla"
5:All text from upper window -- listener_childerns[2][5]  
6:undefined
7:"MAXScript Listener"
8:"MAXScript Listener"
  
UIAccessor.GetWindowText listener_childerns[2][8] 
uiaccessor.IsWindow  listener_childerns[2][8] 
uiaccessor.closedialog listener_childerns[1][8]
  
for i in  listener_childerns[1] where windows.getchildrenhwnd i == "MXS_SciTEWindow" do print "found"
lowerpart_listener = listener_childerns[1][1] 
uiaccessor.IsWindow lowerpart_listener


editor_handle =-- listener_childerns[1][5]
uiaccessor.closedialog editor_handle
UIAccessor.GetWindowText listener_childerns[1][1]
handles=windows.getchildhwnd 0 "MXS_Scintilla"  --get dialog  
uiaccessor.closedialog handles[1]  --close dialog

handles=windows.getchildhwnd 0 "MaxScript Listener"  --get dialog  
  


windows.getChildrenHWND handles[1] --get all childern dialogs + in last array text from upper Listener part
  
for i in handles do try print (UIAccessor.GetWindowText i) catch()
uiaccessor.closedialog handles[1]  --close dialog


--------------------------------------------------------------------------
--Accessing Maxscript Editor
--------------------------------------------------------------------------
(windows.getchildhwnd 0 "MXS_SciTEWindow")
(windows.getchildhwnd 0 "MXS_Scintilla")
--------------------------------------------------------------------------
--Accessing Script Manager:
--------------------------------------------------------------------------

handles=windows.getchildhwnd 0 "Script Manager:"  --get dialog
mcSystem.show uiaccessor
uiaccessor.closedialog handles[1]  --close dialog
--------------------------------------------------------------------------

--------------------------------------------------------------------------

fn printAllMaxWindows =
(
	local handles = for i in (windows.getChildrenHWND 0 parent:#max) where UIAccessor.IsWindow i[1] and (not i[5] == "AdApplicationButton") and (not i[5] == "") collect i[1]
	for i in handles do try print (UIAccessor.GetWindowText i) catch()
)
printAllMaxWindows()


--------------------------------------------------------------------------
--------------------------------------------------------------------------


--------------------------------------------------------------------------
---Max v9
--------------------------------------------------------------------------
ace = UIAccessor.GetPopupDialogs()
ace.count

UIAccessor.GetWindowResourceID ace[1]
UIAccessor.GetWindowText ace[1]

parent_win = UIAccessor.GetParentWindow ace[1]
UIAccessor.GetWindowText parent_win

DialogList = for i in (UIAccessor.GetPopupDialogs()) where not i == 0 collect i

fn printAllMaxWindows =
(
	local ace = UIAccessor.GetPopupDialogs()
	for i in ace do print (UIAccessor.GetWindowText i)
)
printAllMaxWindows() 

fn getWindowHandleByTitle txt =
(
	for d in UIAccessor.GetPopupDialogs() where
	findString (UIAccessor.GetWindowText d) txt != undefined do exit with d
)
getWindowHandleByTitle "Micra"

fn closeWindowByTitle txt =
(
	local ace = UIAccessor.GetPopupDialogs()
	for i in ace where findString (UIAccessor.GetWindowText i) txt != undefined do 
	(
		print i
		UIAccessor.CloseDialog i
	)
)
closeWindowByTitle "FBX"





"---------------------------------------------------------------------------"
Info:<Interface:UIAccessor>
"---------------------------------------------------------------------------"
ClassOf: Interface
SuperClassOf: Value
No ShowClass for <Interface:UIAccessor>
No Show for <Interface:UIAccessor>
No Properties for <Interface:UIAccessor>
No Methods for <Interface:UIAccessor>
No Events for <Interface:UIAccessor>
PropNames: #()
  Interface: UIAccessor
   Properties:
   Methods:
    <string>GetWindowText <HWND>hwnd
       GetWindowText - no automatic redraw after invoked
    <string>GetWindowClassName <HWND>hwnd
       GetWindowClassName - no automatic redraw after invoked
    <integer>GetWindowResourceID <HWND>hwnd
       GetWindowResourceID - no automatic redraw after invoked
    <HWND by value array>GetChildWindows <HWND>hwnd
       GetChildWindows - no automatic redraw after invoked
    <HWND by value array>GetPopupDialogs()
       GetPopupDialogs - no automatic redraw after invoked
    <HWND>GetParentWindow <HWND>hwnd
       GetParentWindow - no automatic redraw after invoked
    <HWND>GetFirstChildWindow <HWND>hwnd
       GetFirstChildWindow - no automatic redraw after invoked
    <HWND>GetPrevWindow <HWND>hwnd
       GetPrevWindow - no automatic redraw after invoked
    <HWND>GetNextWindow <HWND>hwnd
       GetNextWindow - no automatic redraw after invoked
    <bool>IsWindow <HWND>hwnd
       IsWindow - no automatic redraw after invoked
    <string>GetWindowDllFileName <HWND>hwnd
       GetWindowDllFileName - no automatic redraw after invoked
    <string>GetWindowDllDescription <HWND>hwnd
       GetWindowDllDescription - no automatic redraw after invoked
    <void>CloseDialog <HWND>hwnd
       CloseDialog - no automatic redraw after invoked
    <void>PressDefaultButton()
       PressDefaultButton - no automatic redraw after invoked
    <void>PressButton <HWND>hwnd
       PressButton - no automatic redraw after invoked
    <bool>PressButtonByName <HWND>hwnd <string>name
       PressButtonByName - no automatic redraw after invoked
    <bool>SetWindowText <HWND>hwnd <string>text
       SetWindowText - no automatic redraw after invoked
    <bool>SendMessageID <HWND>hwndDlg <enum>ID
       SendMessageID - no automatic redraw after invoked
       ID enums: {#IDOK|#IDCANCEL|#IDABORT|#IDRETRY|#IDIGNORE|#IDYES|#IDNO|#IDCLOSE}
    <bool>SendMessage <HWND>hwndDlg <integer>MessageID <integer>wParam <integer>lParam
       SendMessage - no automatic redraw after invoked
   Actions:
Interface: OK
No Constructors for <Interface:UIAccessor>
No GetInterface for <Interface:UIAccessor>
	

--------------------------------------------------------------------------

--------------------------------------------------------------------------
		hwnd = (windows.getChildHwnd 0 "MAXScript Listener")[1]
		UIAccessor.GetWindowText hwnd --"MAXScript Listener"
		UIAccessor.GetWindowDllFileName hwnd
	UIAccessor.GetWindowText (UIAccessor.GetWindowResourceID hwnd)
		
		hwnd_parent = UIAccessor.GetParentWindow hwnd
		UIAccessor.GetWindowText hwnd_parent
		UIAccessor.GetWindowDllFileName hwnd_parent
		
		
		intPtr =  dotNetObject "IntPtr" hwnd
		Hwpp = DotNetObject "MaxCustomControls.Win32HandleWrapper" intPtr
		
		mcSystem.show Hwpp
		
		mXSExtendedForm.controls.add (UIAccessor.GetWindowResourceID hwnd)
		
		
		  .[static]<System.Windows.Forms.Control>FromChildHandle <System.IntPtr>handle
  .[static]<System.Windows.Forms.Control>FromHandle <System.IntPtr>handle
  .<System.Windows.Forms.Control>GetChildAtPoint <System.Drawing.Point>pt
  .<System.Windows.Forms.Control>GetChildAtPoint <System.Drawing.Point>pt <System.Windows.Forms.GetChildAtPointSkip>skipValue
		
		mcSystem.show mXSExtendedForm
		
		mcSystem.show ctrl 
		ctrl = dotnetObject "control"
		ctrl.FromHandle listenerHandle
		ctrl.name
		
		.Add <System.Windows.Forms.Control>value
		mXSExtendedForm.Owner 
		mXSExtendedForm.Parent
		mXSExtendedForm.Child