Function New-PushbulletRepairMessageSubject
{
    [CmdletBinding()]
    Param(
        [hashtable]$PoShMonConfiguration,
        [object[]]$RepairOutputValues
    )

    return "[PoShMon $($PoShMonConfiguration.General.EnvironmentName) Repair Results]`r`n"
}