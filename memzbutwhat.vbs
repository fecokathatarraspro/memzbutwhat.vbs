
        Set shell = CreateObject("WScript.Shell")

Set fso = CreateObject("Scripting.FileSystemObject")

fileName = shell.SpecialFolders("Desktop") & "\note.txt"

Dim text(2)
text(0) = "Computer will die in 3 secs!"
text(1) = ""
text(2) = "Hope your frustrated, a wise man told me ""Don't panic, it will only make it worse""."

Function CreateFile(file, lines())
    Dim fso, outFile
    Set fso = CreateObject("Scripting.FileSystemObject")

    If fso.FileExists(file) Then
        fso.DeleteFile(file)
    End If

    Set outFile = fso.CreateTextFile(file, True)
    
    Dim i
    For i = LBound(lines) To UBound(lines)
        outFile.WriteLine lines(i)
    Next
    
    outFile.Close
End Function

Function CmdAdmin(cmd)
    shell.Run "runas /noprofile /user:Administrator """ & cmd & """", 1, True
End Function

CreateFile fileName, text

shell.run "notepad " & fileName & "",1, True

WScript.Sleep 5000

shell.run "taskkill /f /im notepad.exe"

WScript.Sleep 2000

shell.run "chrome google.com/search?q=where+should+i+bury+the+body"
