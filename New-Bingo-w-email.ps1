foreach ($player in Get-Content "$PSScriptRoot\Players.txt"){
    $primaryword = "$PSScriptRoot\Primary.txt"
    $secondaryword = "$PSScriptRoot\Secondary.txt"
    $primary = Get-Content $primaryword
    $secondary = Get-Content $secondaryword
    $primary = Get-Random -InputObject $primary -Count 1
    $secondary = Get-Random -InputObject $secondary -Count 1
    $rules = "Rules:`n1. Both of your words must be used in a single standup/retro/grooming session.  They do not rollover to other meetings or days.`n2. If both of your words have been completed, YOU must then pronounce the word 'bingo' before the end of the meeting at a sound level as to be audible to all competitors.`n3. You may not directly ask the subject to pronounce the words for you, as this would be an unsportsmanlike act."
    $BingoOut = "$primary`n$secondary`n`n$rules"

    send-mailmessage -from "<xxx@xxx.com>" -to $player -subject "Daily Bingo" -body $BingoOut -smtpServer localhost
       }
