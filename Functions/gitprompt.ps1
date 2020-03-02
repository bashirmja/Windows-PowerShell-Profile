
function prompt {
    if (isCurrentDirectoryGitRepository) {
        write-Host((Get-Location).Path |split-path -leaf) -nonewline -foregroundcolor gray
        GitPrompt
        return ">"
    }
    else {
        write-Host(Get-Location).Path -nonewline -foregroundcolor gray
        if (isCurrentDirectoryandParentsGitRepository) {
            GitPrompt
        }
        return ">"
    }
}

function GitPrompt {
    $a = Write-Host("[") -nonewline -foregroundcolor yellow
    $B = Write-Host(GetBranchName) -nonewline -foregroundcolor green
    $C = Write-Host("]") -nonewline -foregroundcolor yellow
    return $a, $B, $C
}

function GetBranchName {
    $name = Split-Path -Leaf (git symbolic-ref HEAD)
    return $name
}

function GitHeadCommitId {
    return git log -1 --format="%h"
}

function isCurrentDirectoryGitRepository {
    if ((Test-Path ".git")) {
        return $TRUE
    }
    else {
        return $FALSE
    }
}

function isCurrentDirectoryandParentsGitRepository {
    if (Test-Path ".git") {
        return $TRUE
    }
    else {

        $checkIn = (Get-Item .).parent
        while ($NULL -ne $checkIn) {
            $pathToTest = $checkIn.fullname + '/.git'
            if (Test-Path $pathToTest) {
                return $TRUE
            }
            else {
                $checkIn = $checkIn.parent
            }
        }
    }
    return $FALSE
}