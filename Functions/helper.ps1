function repos {
     Write-Host ""
     Write-Host "[I]  Identity Service" -f Green
     Write-Host "[IU] Identity Service UI" -f Green
     Write-Host "[T]  Transport and Dispatch" -f Green
     Write-Host "[TU] Transport and Dispatch UI" -f Green
     Write-Host "[P]  Platform" -f Green
     Write-Host "[PU] Platform UI" -f Green
     Write-Host "[WP] Windows PowerShell Profile" -f Green
     
    $input = Read-Host "Please Choose your repo"

    $mainPath ="$home\source\repos\AMCS\"

    if ($input -eq 'I') {
        Set-Location "$mainPath\IdentityService\"
    }elseif ($input -eq 'IU'){
        Set-Location "$mainPath\IdentityServiceUI\"
    }elseif ($input -eq 'T'){
        Set-Location "$mainPath\TransportDispatch\"
    }elseif ($input -eq 'TU'){
        Set-Location "$mainPath\TransportDispatchUI\"
    }elseif ($input -eq 'P'){
        Set-Location "$mainPath\Platform\"
    }elseif ($input -eq 'PU'){
        Set-Location "$mainPath\PlatformUI\"
    }elseif ($input -eq 'wp'){
        Set-Location "$home\Documents\WindowsPowershell\"
    }


    Write-Host ""
}

