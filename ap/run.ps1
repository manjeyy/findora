# run.ps1
<#
.SYNOPSIS
Run Jetty with different reload modes.
.PARAMETER mode
reload : Auto hot reload every 1 second
manual : Manual reload (press Enter to redeploy)
none   : No reload
#>

param (
    [string]$mode
)

if (-not $mode) {
    Write-Host "Please provide a mode: reload, manual, or none"
    exit
}

switch ($mode.ToLower()) {
    "reload" {
        Write-Host "Starting Jetty with auto hot reload every 1 second..."
        .\mvnw.cmd --% org.eclipse.jetty.ee10:jetty-ee10-maven-plugin:12.1.8:run -Djetty.scan=1
    }
    "manual" {
        Write-Host "Starting Jetty with manual reload (press Enter to redeploy)..."
        .\mvnw.cmd --% org.eclipse.jetty.ee10:jetty-ee10-maven-plugin:12.1.8:run -Djetty.scan=0
    }
    "none" {
        Write-Host "Starting Jetty with no reload..."
        .\mvnw.cmd --% org.eclipse.jetty.ee10:jetty-ee10-maven-plugin:12.1.8:run -Djetty.scan=-1
    }
    Default {
        Write-Host "Invalid mode. Use reload, manual, or none."
    }
}