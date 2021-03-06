tell application "Finder"
	tell disk "DEPLOY_ACTUAL_VOLUME_NAME"
		open
		set current view of container window to icon view
		set toolbar visible of container window to false
		set statusbar visible of container window to false
		
		-- size of window should match size of background
		set the bounds of container window to {400, 100, 1040, 538}
		
		set theViewOptions to the icon view options of container window
		set arrangement of theViewOptions to not arranged
		set icon size of theViewOptions to 128
		set background picture of theViewOptions to file ".background:background.png"
		
		-- Create alias for install location
		make new alias file at container window to DEPLOY_INSTALL_LOCATION with properties {name:"DEPLOY_INSTALL_NAME"}
		
		set allTheFiles to the name of every item of container window
		repeat with theFile in allTheFiles
			set theFilePath to POSIX path of theFile
			if theFilePath is "/DEPLOY_APPLICATION_NAME.app" then
				-- Position application location
				set position of item theFile of container window to {128, 245}
			else if theFilePath is "/DEPLOY_INSTALL_NAME" then
				-- Position install location
				set position of item theFile of container window to {512, 245}
			else
				-- Move all other files far enough to be not visible if user has "show hidden files" option set
				set position of item theFile of container window to {1000, 0}
			end if
		end repeat
		
		close
		open
		update without registering applications
		delay 10
	end tell
end tell

