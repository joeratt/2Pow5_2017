-- Connects to a Windows fileshare from OS X -- cerner_2^5_2017
set theResponse to display dialog "What's the fileshare location?" default answer "" with icon note buttons {"Cancel", "Continue"} default button "Continue"

-- Reverse the slashes, and prepend "smb:"
set theThing to "smb:" & findAndReplaceInText(text returned of theResponse, "\\", "/")
-- Open the File share in Finder
try
	do shell script "open " & quote & theThing & quote
on error errMsg
	display dialog "ERROR: " & errMsg
end try

--> This is from Apple's website: https://developer.apple.com/library/content/documentation/LanguagesUtilities/Conceptual/MacAutomationScriptingGuide/ManipulateText.html
on findAndReplaceInText(theText, theSearchString, theReplacementString)
	set AppleScript's text item delimiters to theSearchString
	set theTextItems to every text item of theText
	set AppleScript's text item delimiters to theReplacementString
	set theText to theTextItems as string
	
	set AppleScript's text item delimiters to ""
	return theText
end findAndReplaceInText
