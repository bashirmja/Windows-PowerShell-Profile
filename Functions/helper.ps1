function ChangeToOtherRepos($repo) {
     
     if($repo -notmatch "\S"){

        Write-Host ""
        Write-Host "[I]  Identity Service" -f Green
        Write-Host "[IU] Identity Service UI" -f Green
        Write-Host "[T]  Transport and Dispatch" -f Green
        Write-Host "[TU] Transport and Dispatch UI" -f Green
        Write-Host "[P]  Platform" -f Green
        Write-Host "[PU] Platform UI" -f Green
        Write-Host "[WP] Windows PowerShell Profile" -f Green
     
        $repo = Read-Host "Please Choose your repo"
    }

    $mainPath ="$home\source\repos\AMCS\"

    if ($repo -eq 'I') {
        Set-Location "$mainPath\IdentityService\"
    }elseif ($repo -eq 'IU'){
        Set-Location "$mainPath\IdentityServiceUI\"
    }elseif ($repo -eq 'T'){
        Set-Location "$mainPath\TransportDispatch\"
    }elseif ($repo -eq 'TU'){
        Set-Location "$mainPath\TransportDispatchUI\"
    }elseif ($repo -eq 'P'){
        Set-Location "$mainPath\Platform\"
    }elseif ($repo -eq 'PU'){
        Set-Location "$mainPath\PlatformUI\"
    }elseif ($repo -eq 'wp'){
        Set-Location "$home\Documents\WindowsPowershell\"
    }else{
        Write-Host "Repo not found" -f red
    }


    Write-Host ""
}


function startupHint {
    Write-Host "AMCS Useful Development Commands:" -f Yellow
    Write-Host ""
    Write-Host "(CMD) Command Explanation       Params <required> [optional]" -f Yellow
    Write-Host "----- ------------------------- ---------------------------- " -f Yellow
    Write-Host "(REP) Change dir to other repos [repo short name]" -f cyan
    Write-Host "" 
    Write-Host "How to run:" -f cyan
    Write-Host "AMCS <CMD> <[Params]>" -f cyan
    Write-Host "" 
}

function amcs($command, $par1){

    if($command -eq "REP"){
        ChangeToOtherRepos $par1
    }else{
        Write-Host "Bad command or file name!"
    }
}