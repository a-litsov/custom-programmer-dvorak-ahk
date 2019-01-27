SetBatchLines -1
SleepDuration = 1
TimePeriod = 1

~*Ctrl::
~*Alt::
~*LWin::
~*RWin::
Sleep, 1 ;                 This prevents from
If GetKeyState("RAlt") ;   switching if it
   return ;                was AltGr pressed.
   
WinID := WinExist("A") ; changed the method to more suitable according to documentation: http://l.autohotkey.net/docs/commands/WinGet.htm
ThreadID:=DllCall("GetWindowThreadProcessId", UInt, WinID, UInt, 0)
InputLocaleID:=DllCall("GetKeyboardLayout", UInt, ThreadID, UInt)
if (InputLocaleID=ceil(4026663945)) { ; Added brackets and "else" condition, now "if" condition works just fine
	Qwerty = 1 
}		 
else {	
	Qwerty = 0							
}		

Loop ;    Waits for keys to be released.
{
   If !(GetKeyState("Ctrl")
   or GetKeyState("Alt")
   or GetKeyState("LWin")
   or GetKeyState("RWin"))
      Break
   Sleep, 10 ;    This makes the script less CPU consuming.
}
Qwerty = 0
return


; ##############################
;         QWERTY MAPPING
; ##############################
#if Qwerty
SC0x2::1
SC0x3::2
SC0x4::3
SC0x5::4
SC0x6::5
SC0x7::6
SC0x8::7
SC0x9::8
SC0xa::9
SC0xb::0
SC0xc::-
SC0xd::=
SC0x10::q
SC0x11::w
SC0x12::e
SC0x13::r
SC0x14::t
SC0x15::y
SC0x16::u
;SC0x17::i ; commented "i" mapping because otherwise "ctrl+c" is not working in cmd, for example
SC0x18::o
SC0x19::p
SC0x1a::[
SC0x1b::]
SC0x1e::a
SC0x1f::s
SC0x20::d
SC0x21::f
SC0x22::g
SC0x23::h
SC0x24::j
SC0x25::k
SC0x26::l
SC0x27::`;
SC0x28::'
SC0x29::vkC0 ;    ( ` ) key
SC0x2b::\
SC0x2c::z
SC0x2d::x
SC0x2e::c
SC0x2f::v
SC0x30::b
SC0x31::n
SC0x32::m
SC0x33::,
SC0x34::.
SC0x35::/
SC0x56::vkE2 ;    the additional key, backslash ( \ ) on standard qwerty
#if