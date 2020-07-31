activate application "System Preferences"
tell application "System Events" to tell process "System Preferences"
	set frontmost to true
	
	tell first window to tell toolbar 1 to tell group 2 to tell group 1 to tell button "Show All" to perform action "AXPress"
	
	delay 1
	
	tell first window to tell first scroll area to tell button "Displays" to perform action "AXPress"
	
	delay 1
	
	tell first window
		if exists button "Gather Windows" then
			tell button "Gather Windows" to perform action "AXPress"
		end if
	end tell
	
	delay 1
	
	repeat with x from 1 to (count windows)
		tell window x to tell tab group 1
			if exists slider 1 then
				tell slider 1
					set oldValue to value
					set value to 0
					set value to oldValue
				end tell
			end if
		end tell
	end repeat
end tell

delay 1

tell application "System Preferences" to quit