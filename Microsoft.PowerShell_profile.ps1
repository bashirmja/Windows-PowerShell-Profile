$here = Split-Path -Parent $MyInvocation.MyCommand.Path
Resolve-Path $here\Functions\*.ps1 | ForEach-Object { . $_.ProviderPath }

