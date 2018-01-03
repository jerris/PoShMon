Function Test-CPULoad
{
    [CmdletBinding()]
    param (
        [hashtable]$PoShMonConfiguration
    )

    # Initialization Section
    if ($PoShMonConfiguration.OperatingSystem -eq $null) { throw "'OperatingSystem' configuration not set properly on PoShMonConfiguration parameter." }

    $mainOutput = Get-InitialOutputWithTimer -SectionHeader "Server CPU Load Review" -OutputHeaders ([ordered]@{ 'ServerName' = 'Server Name'; 'CPULoad' = 'CPU Load (%)' })
    $serverNames = $PoShMonConfiguration.General.ServerNames
    $results = @()

    # Retreive processor counters from computers
    if ($PoShMonConfiguration.General.ServerNames -is [String]) {       
        
        $serverName = $ServerNames

        if (($serverName -eq $env:COMPUTERNAME) -or ($serverName -eq "localhost")) {
            $results += Get-Counter "\processor(_total)\% processor time"
        }       
        else {
            throw "''OperatingSystem' in PoShMonconfiguration is not set properly. It had a single name listed, but was not the local system name. It must either be this or an array of computer names."
        }

    } 

    elseif ($PoShMonConfiguration.General.ServerNames -is [Array]) { 

        foreach ($serverName in $serverNames)
        {
            if (($serverName -eq $env:COMPUTERNAME) -or ($serverName -eq "localhost")) {
                $results += Get-Counter "\processor(_total)\% processor time"
            }
            else {
                $results += Get-Counter "\processor(_total)\% processor time" -Computername $ServerName
            }
        }
    }  

    else {
        throw "'OperatingSystem' in PoShMonconfiguration is not set properly. It must be either a string or an array"
    }

    foreach ($counterResult in $results.CounterSamples)
    {
        if ($PoShMonConfiguration.General.ServerNames -eq "localhost" -or $PoShMonConfiguration.General.ServerNames -eq $env:COMPUTERNAME)
            { $serverName = "localhost" }
        else
            { $serverName = $counterResult.Path.Substring(2, $counterResult.Path.LastIndexOf("\\") - 2).ToUpper() }
        $cpuLoad = $counterResult.CookedValue
        $highlight = @()

        $cpuPercentValue = $(($cpuLoad / 100).ToString("00%"))
        Write-Verbose "`t$($serverName): $cpuPercentValue"

        if ($cpuLoad -gt $PoShMonConfiguration.OperatingSystem.CPULoadThresholdPercent)
        {
            $mainOutput.NoIssuesFound = $false
            $highlight += "CPULoad"
            Write-Warning "`tCPU Load ($cpuPercentValue) is above variance threshold ($($PoShMonConfiguration.OperatingSystem.CPULoadThresholdPercent)%)"
        }

        $mainOutput.OutputValues += [pscustomobject]@{
            'ServerName' = $serverName
            'CPULoad' = $cpuPercentValue
            'Highlight' = $highlight
        }
    }

    return (Complete-TimedOutput $mainOutput)
}