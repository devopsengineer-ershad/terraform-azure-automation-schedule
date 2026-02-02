param(
    # Target Resource
    [Parameter(Mandatory = $true)]
    [string] $ResourceGroupName,

    [Parameter(Mandatory = $true)]
    [string] $VMName,

    # Time Control (from tfvars)
    [Parameter(Mandatory = $true)]
    [string] $TimeZoneId,

    [Parameter(Mandatory = $true)]
    [string] $DeletionTime,   # hh:mm

    # Safety Controls
    [Parameter(Mandatory = $true)]
    [bool] $DryRun,

    [Parameter(Mandatory = $true)]
    [bool] $AllowDelete,

    # Governance
    [Parameter(Mandatory = $true)]
    [string] $Environment,

    # Optional Buffer
    [Parameter(Mandatory = $true)]
    [int] $GraceMinutes,

    # Audit
    [Parameter(Mandatory = $true)]
    [string] $TriggeredBy,

    [Parameter(Mandatory = $true)]
    [string] $CorrelationId
)

try {
    # Authenticate using Managed Identity
    Connect-AzAccount -Identity

    # Current time in given timezone
    $currentTime = [System.TimeZoneInfo]::ConvertTimeBySystemTimeZoneId(
        (Get-Date), $TimeZoneId
    )

    # Build today's deletion time + grace period
    $targetTime = Get-Date "$($currentTime.ToString('yyyy-MM-dd')) $DeletionTime"
    $targetTime = $targetTime.AddMinutes($GraceMinutes)

    # Time window guard
    if ($currentTime -lt $targetTime) {
        Write-Output "Deletion window not reached. Skipping."
        return
    }

    # Prod safety
    if ($Environment -eq "prod" -and -not $AllowDelete) {
        Write-Output "Prod environment detected. AllowDelete=false. Skipping."
        return
    }

    # Dry run
    if ($DryRun) {
        Write-Output "DryRun=true. VM '$VMName' will NOT be deleted."
        return
    }

    # Final approval
    if (-not $AllowDelete) {
        Write-Output "AllowDelete=false. Skipping deletion."
        return
    }

    # Delete VM
    Remove-AzVM `
        -ResourceGroupName $ResourceGroupName `
        -Name $VMName `
        -Force `
        -ErrorAction Stop

    Write-Output "VM '$VMName' deleted successfully."
}
catch {
    Write-Error $_
    throw
}
