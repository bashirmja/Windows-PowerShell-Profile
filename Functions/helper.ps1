function StartupHint {
    Write-Host "Useful Development Commands:" -f Yellow
    Write-Host ""
    Write-Host "Command  Explanation                  Params <required> [optional]" -f Yellow
    Write-Host "-------- ---------------------------- ---------------------------- " -f Yellow
    Write-Host "Repo     Changing dir to other repos  [repo short name]" -f cyan
    Write-Host "Branch   Changing branche to others   [branch name]" -f cyan
    Write-Host "UCB      Update current branch" -f cyan
    Write-Host "" 
    Write-Host "How to run:" -f cyan
    Write-Host "Run Command Params" -f cyan
    Write-Host "" 
}

function Run($command, $par1){

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
        Write-Host "[WP] Windows PowerShell Profile" -f Green
     
        $repo = Read-Host "Please Choose your repo" 
    }

    $mainPath ="$home\source\repos\"

    if ($repo -eq 'wp') {
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
        git submodule foreach 'git stash'
    }
    else {
        Write-Host "Change dir to a repo" -f red
    }
    
}
