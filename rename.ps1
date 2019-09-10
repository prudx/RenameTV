## -- Daniel Maguire --
## This is my first powershell script, it's purpose is to rename tv show episodes based on filetype and show name inputs

param (
    [string]$extension = "mkv",
    [string]$name = $( Read-Host "Input show name please: " )
 )


$dir = get-childitem -recurse -filter "*$name*" | where {$_.extension -eq ".$extension"}

ForEach ($file in $dir ) 
{ 
    echo $file.extension

    $filename = $file.name
    $season = $filename -match "S\d\d"
    $season = $matches[0]

    $episode = $filename -match "E\d\d"
    $episode = $matches[0]

    rename-item $file "$name $season$episode.$extension"
}

echo $dir