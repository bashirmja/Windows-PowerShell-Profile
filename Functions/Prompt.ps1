function changeDir {
    if (Test-Path "$home\source\repos\") {
        set-location "$home\source\repos\"
    }
}