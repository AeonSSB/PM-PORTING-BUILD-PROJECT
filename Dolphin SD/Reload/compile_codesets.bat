GCTRealMate.exe "./RSBE01.txt" -q
GCTRealMate.exe "./BOOST.txt" -q
GCTRealMate.exe "./Source/Injects/MDEF.txt" -q
GCTRealMate.exe "./Source/Injects/DEFINE.txt" -q

copy ".\Source\Injects\MDEF.GCT" ".\pf\injects\MDEF.gct"
copy ".\Source\Injects\DEFINE.GCT" ".\pf\injects\DEFINE.gct"
pause