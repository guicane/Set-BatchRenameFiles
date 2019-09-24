<#
.SYNOPSIS
#This renames files on a given path and all its subfolders
    
.PARAMETER Path
Top level path of where the files will be renamed.
   
.PARAMETER Extension
Extension of the files to be renamed.
    
.EXAMPLE
Set-BatchRenameFiles -Path 'c:\Users\user\music' -Extension '.m4a'
    
.NOTES
General notes
#>
function Set-BatchRenameFiles {
    param (
        [Parameter(Mandatory = $true)]
        [string]
        $Path,

        [Parameter(Mandatory = $true)]
        [string]
        $Extension
    )

    Get-ChildItem -Path $path -Recurse -File | Where-Object {$_.extension -eq $Extension} | ForEach-Object {
        $a=$_.FullName
        $b=$a.Substring(0,($a.Length-30))+$extension
        Rename-Item -Path $a -NewName $b -Verbose
    }
}