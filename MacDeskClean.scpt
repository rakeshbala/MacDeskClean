-- Author : Rakesh Balasubramanian

tell application "Finder"
	
	
	--Check if desktop needs cleanup
	if (count of every file of folder "Desktop" of home) = 0 then
		display dialog "No files to clean up" buttons {"Ok"}
		return
	end if
	
	--Confirm
	display dialog "Are you sure you want to clean and backup the Desktop?"
	
	
	--get the list of all files in Desktop
	set rootFolderName to "Desk_Bkup"
	set rootFolderName to rootFolderName & "_" & (month of (current date) as number)
	set rootFolderName to rootFolderName & "/" & day of (current date)
	set rootFolderName to rootFolderName & "/" & year of (current date)
	
	
	--create root folder and sub folder structure if not exists
	if not (exists folder rootFolderName of folder "Desktop" of home) then
		make new folder at folder "Desktop" of home with properties {name:rootFolderName}
		set rootFolder to folder rootFolderName of folder "Desktop" of home
		make new folder at rootFolder with properties {name:"Images"}
		make new folder at rootFolder with properties {name:"Audio"}
		make new folder at rootFolder with properties {name:"Videos"}
		make new folder at rootFolder with properties {name:"Artifacts & Text"}
		make new folder at rootFolder with properties {name:"Code and data"}
		make new folder at rootFolder with properties {name:"Compressed"}
		make new folder at rootFolder with properties {name:"Others"}
	else
		set rootFolder to folder rootFolderName of folder "Desktop" of home
	end if
	
	
	--create extension lists
	set imageExts to {"png", "jpeg", "jpg", "tiff", "bmp", "gif", "ico"}
	set videoExts to {"mpeg", "mov", "m4v", "mp4", "vob", "dat", "3gp", "avi", "dvx", "flv", "mkv", "mpg", "rm", "swf", "wmv", "divx", "xvid", "ogv"}
	set audioExts to {"aif", "iff", "m3u", "m4a", "mid", "mp3", "mpa", "ra", "wav", "wma", "caf", "aac", "ogg", "aiff"}
	set docExts to {"docx", "doc", "ppt", "pptx", "xls", "xlsx", "pdf", "txt"}
	set dataExts to {"js", "plist", "json", "h", "m", "c", "db", "sqlite", "sh", "css", "html", "htm", "xml", "java", "jsp", "war"}
	set compressedExts to {"zip", "rar", "7z", "gz", "bz", "tar", "tgz", "gzip"}
	
	--loop through all files in the desktop
	set fileList to every file of folder "Desktop" of home
	repeat with index from 1 to count of fileList
		set fileObject to item index of fileList
		set fileMoved to false
		--move images
		repeat with extIndex from 1 to count of imageExts
			if name extension of fileObject is item extIndex of imageExts then
				move fileObject to folder "Images" of rootFolder
				set fileMoved to true
				exit repeat
			end if
		end repeat
		
		
		--move videos
		if fileMoved is false then
			repeat with extIndex from 1 to count of videoExts
				if name extension of fileObject is item extIndex of videoExts then
					move fileObject to folder "Videos" of rootFolder
					set fileMoved to true
					exit repeat
				end if
			end repeat
		end if
		
		--move audio
		if fileMoved is false then
			repeat with extIndex from 1 to count of audioExts
				if name extension of fileObject is item extIndex of audioExts then
					move fileObject to folder "Audio" of rootFolder
					set fileMoved to true
					exit repeat
				end if
			end repeat
		end if
		
		
		--move documents
		if fileMoved is false then
			repeat with extIndex from 1 to count of docExts
				if name extension of fileObject is item extIndex of docExts then
					move fileObject to folder "Artifacts & Text" of rootFolder
					set fileMoved to true
					exit repeat
				end if
			end repeat
		end if
		
		--move code files
		if fileMoved is false then
			repeat with extIndex from 1 to count of dataExts
				if name extension of fileObject is item extIndex of dataExts then
					move fileObject to folder "Code and data" of rootFolder
					set fileMoved to true
					exit repeat
				end if
			end repeat
		end if
		
		
		--move compressed files
		if fileMoved is false then
			repeat with extIndex from 1 to count of compressedExts
				if name extension of fileObject is item extIndex of compressedExts then
					move fileObject to folder "Compressed" of rootFolder
					set fileMoved to true
					exit repeat
				end if
			end repeat
		end if
		
		
		--move all other files
		if fileMoved is false then
			move fileObject to folder "Others" of rootFolder
			set fileMoved to true
		end if
		
	end repeat
	display dialog "Cleanup finished" buttons {"Ok"}
	
end tell
