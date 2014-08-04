on run argv
	
	if (count of argv) > 0 and (argv as string) is "stop" then
		
		log "Stopping VPN"
		
		tell application "System Events"
			tell current location of network preferences
				set VPNservice to service "Indatus" -- name of the VPN service
				if exists VPNservice then disconnect VPNservice
			end tell
		end tell
		
		
		do shell script "networksetup -setdnsservers Wi-Fi empty" with administrator privileges
		
	else
		
		log "Starting VPN"
		
		tell application "System Events"
			tell current location of network preferences
				set VPNservice to service "Indatus" -- name of the VPN service
				if exists VPNservice then connect VPNservice
			end tell
		end tell
		
		do shell script "networksetup -setdnsservers Wi-Fi {DNS SERVER A} {DNS SERVER B}" with administrator privileges
		
	end if
	
	do shell script "dscacheutil -flushcache" with administrator privileges
	
end run