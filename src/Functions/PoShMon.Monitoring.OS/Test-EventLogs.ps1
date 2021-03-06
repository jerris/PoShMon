Function Test-EventLogs
{
    [CmdletBinding()]
    param (
        [hashtable]$PoShMonConfiguration
    )

    $allTestsOutput = @()

    foreach ($SeverityCode in $PoShMonConfiguration.OperatingSystem.EventLogCodes)
    {   
        $mainOutput = Get-InitialOutputWithTimer -SectionHeader "$SeverityCode Event Log Issues" -GroupBy 'ServerName' -OutputHeaders ([ordered]@{ 'EventID' = 'Event ID'; 'InstanceCount' = 'Count'; 'Source' = 'Source'; 'User' = 'User'; 'Timestamp' = 'Timestamp'; 'Message' ='Message' })

        $wmiStartDate = (Get-Date).AddMinutes(-$PoShMonConfiguration.General.MinutesToScanHistory)
        $wmidate = new-object -com Wbemscripting.swbemdatetime
        $wmidate.SetVarDate($wmiStartDate, $true)
        $wmiStartDateWmi = $wmidate.value

        foreach ($serverName in $PoShMonConfiguration.General.ServerNames)
        {
            $itemOutputValues = @()
        
            $eventLogEntryGroups = Get-GroupedEventLogItemsBySeverity -ComputerName $serverName -SeverityCode $SeverityCode -WmiStartDate $wmiStartDateWmi

            Write-Verbose "`t$serverName"

            if ($eventLogEntryGroups.Count -gt 0)
            {
                foreach ($eventLogEntryGroup in $eventLogEntryGroups)
                {
                    $currentEntry = $eventLogEntryGroup.Group[0]

                    if ($EventIDIgnoreList.Count -eq 0 -or $EventIDIgnoreList.ContainsKey($currentEntry.EventCode) -eq $false)
                    {
                        $mainOutput.NoIssuesFound = $false

                        Write-Warning ("`t`t" + $currentEntry.EventCode.ToString() + ' : ' + $eventLogEntryGroup.Count + ' : ' + $currentEntry.SourceName + ' : ' + $currentEntry.User + ' : ' + $currentEntry.ConvertToDateTime($currentEntry.TimeGenerated) + ' - ' + $currentEntry.Message)
                
                        $mainOutput.OutputValues += [pscustomobject]@{
                                        'ServerName' = $serverName;
                                        'EventID' = $currentEntry.EventCode;
                                        'InstanceCount' = $eventLogEntryGroup.Count;
                                        'Source' = $currentEntry.SourceName;
                                        'User' = $currentEntry.User;
                                        'Timestamp' = $currentEntry.ConvertToDateTime($currentEntry.TimeGenerated);
                                        'Message' = $currentEntry.Message
                                    }
                    }
                }
            }

            if ($mainOutput.NoIssuesFound)
            {
                Write-Verbose "`t`tNo Entries Found In Time Specified"

                $mainOutput.OutputValues += [pscustomobject]@{
                                'ServerName' = $serverName;
                }
            }
        }

        $allTestsOutput += (Complete-TimedOutput $mainOutput)
    }

    return $allTestsOutput
}