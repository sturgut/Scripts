#Copy files to Android Photo naming standard by reading DateTaken

[reflection.assembly]::LoadWithPartialName("System.Drawing") | out-null

$files = Get-ChildItem D:\recover

foreach ($item in $files)
{
    $pic = New-Object System.Drawing.Bitmap($item.FullName)
    $bitearr = $pic.GetPropertyItem(36867).Value 
    $string = [System.Text.Encoding]::ASCII.GetString($bitearr) 
    $DateTime = [datetime]::ParseExact($string,"yyyy:MM:dd HH:mm:ss`0",$Null)

    #IMG_20181114_182945
    $newFilename = "IMG_" + $DateTime.Year + $DateTime.Month.ToString("00") + $DateTime.Day.ToString("00") + "_"+ $DateTime.Hour.ToString("00")+ $DateTime.Minute.ToString("00")+ $DateTime.Second.ToString("00") + ".jpg"
    
    copy-Item $item.fullname $newFilename 
}
