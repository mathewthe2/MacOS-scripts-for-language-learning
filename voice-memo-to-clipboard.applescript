set appName to "VoiceMemos"

if application appName is running then
	
	tell application id (id of application appName)
		quit
	end tell
	copy {do shell script "echo $HOME"} to {homeFolder}
	set recordingsFolder to homeFolder & "/Library/Application Support/com.apple.voicememos/Recordings"
	set audioFileName to (do shell script "cd " & quoted form of recordingsFolder & " && ls -ltr -A1 | grep m4a | tail -1")
	set the clipboard to POSIX file (recordingsFolder & "/" & audioFileName)
else
	tell application id (id of application appName) to activate
	tell application "System Events"
		perform action "AXRaise" of window 1 of process appName
		keystroke "n" using command down
	end tell
end if