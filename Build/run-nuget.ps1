param (
    [string]$version = $(Read-Host "Version:"),
    [switch]$publish
)


$buildDirectory = split-path -parent $MyInvocation.MyCommand.Definition
& "$buildDirectory\psake.ps1" "$buildDirectory\nuget.ps1" -parameters @{"version"="$version"}
if ($publish) {
    & "$buildDirectory\psake.ps1" "$buildDirectory\nuget.ps1" Publish -parameters @{"version"="$version"}
}
