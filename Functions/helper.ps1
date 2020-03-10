function StartupHint {
    Write-Host "AMCS Useful Development Commands:" -f Yellow
    Write-Host ""
    Write-Host "Command  Explanation                  Params <required> [optional]" -f Yellow
    Write-Host "-------- ---------------------------- ---------------------------- " -f Yellow
    Write-Host "Repo     Changing dir to other repos  [repo short name]" -f cyan
    Write-Host "Branch   Changing branche to others   [branch name]" -f cyan
    Write-Host "UCB      Update current branch" -f cyan
    Write-Host "" 
    Write-Host "How to run:" -f cyan
    Write-Host "AMCS Command Params" -f cyan
    Write-Host "" 
}

function Amcs($command, $par1){

    if($command -eq "Repo"){
        ChangeToOtherRepos $par1
    }elseif($command -eq "Branch"){
        ChangeToOtherBranch $par1
    }elseif($command -eq "UCB"){
        UpdateCurrentBranch 
    }else{
        Write-Host "Bad command or file name!"
    }
}

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


function ChangeToOtherBranch($branch) {
     
    git fetch 
    if($branch -notmatch "\S"){
        git branch -a

        $branch = Read-Host "Please Choose your branch"
    }
    git stash
    git checkout $branch
    UpdateCurrentBranch
}

function UpdateCurrentBranch(){
    if (isCurrentDirectoryandParentsGitRepository) {
        git pull 
        git push
        git submodule init
        git submodule update
    }
    else {
        Write-Host "Change dir to a repo" -f red
    }
    
}