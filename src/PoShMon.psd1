#
# Module manifest for module 'PoShMon'
#
# Generated by: Hilton Giesenow
#
# Generated on: 11 Jan 2017
#

@{

# Script module or binary module file associated with this manifest.
RootModule = 'PoShMon.psm1'

# Version number of this module.
ModuleVersion = '0.8.2'

# Supported PSEditions
# CompatiblePSEditions = @()

# ID used to uniquely identify this module
GUID = '6e6cb274-1bed-4540-b288-95bc638bf679'

# Author of this module
Author = 'Hilton Giesenow'

# Company or vendor of this module
CompanyName = 'Experts Inside'

# Copyright statement for this module
Copyright = '2016 Hilton Giesenow, All Rights Reserved'

# Description of the functionality provided by this module
Description = 'PoShMon is an open source PowerShell-based server and farm monitoring solution. It''s an ''agent-less'' monitoring tool, which means there''s nothing that needs to be installed on any of the environments you want to monitor - you can simply run the script from a regular workstation and have it monitor a single server or group of servers (e.g. a web farm). PoShMon is also able to monitor ''farm''-based products like SharePoint, in which multiple servers work together to provide a single platform. In this case, instead of a list of servers, you need only to supply PoShMon with details of a ''primary'' server against which you want to monitor the platform and it will use, in this case, SharePoint''s API to determine the remaining servers. For more information, documentation etc. see the Project Site as well as the Samples folder within the module.'

# Minimum version of the Windows PowerShell engine required by this module
# PowerShellVersion = ''

# Name of the Windows PowerShell host required by this module
# PowerShellHostName = ''

# Minimum version of the Windows PowerShell host required by this module
# PowerShellHostVersion = ''

# Minimum version of Microsoft .NET Framework required by this module. This prerequisite is valid for the PowerShell Desktop edition only.
# DotNetFrameworkVersion = ''

# Minimum version of the common language runtime (CLR) required by this module. This prerequisite is valid for the PowerShell Desktop edition only.
# CLRVersion = ''

# Processor architecture (None, X86, Amd64) required by this module
# ProcessorArchitecture = ''

# Modules that must be imported into the global environment prior to importing this module
# RequiredModules = @()

# Assemblies that must be loaded prior to importing this module
# RequiredAssemblies = @()

# Script files (.ps1) that are run in the caller's environment prior to importing this module.
# ScriptsToProcess = @()

# Type files (.ps1xml) to be loaded when importing this module
# TypesToProcess = @()

# Format files (.ps1xml) to be loaded when importing this module
# FormatsToProcess = @()

# Modules to import as nested modules of the module specified in RootModule/ModuleToProcess
# NestedModules = @()

# Functions to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no functions to export.
FunctionsToExport = '*'

# Cmdlets to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no cmdlets to export.
CmdletsToExport = '*'

# Variables to export from this module
VariablesToExport = '*'

# Aliases to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no aliases to export.
AliasesToExport = '*'

# DSC resources to export from this module
# DscResourcesToExport = @()

# List of all modules packaged with this module
# ModuleList = @()

# List of all files packaged with this module
# FileList = @()

# Private data to pass to the module specified in RootModule/ModuleToProcess. This may also contain a PSData hashtable with additional module metadata used by PowerShell.
PrivateData = @{

    PSData = @{

        # Tags applied to this module. These help with module discovery in online galleries.
        Tags = 'Monitoring', 'Server', 'Farm', 'SharePoint'

        # A URL to the license for this module.
        LicenseUri = 'https://github.com/HiltonGiesenow/PoShMon/blob/master/LICENSE'

        # A URL to the main website for this project.
        ProjectUri = 'https://github.com/HiltonGiesenow/PoShMon'

        # A URL to an icon representing this module.
        # IconUri = ''

        # ReleaseNotes of this module
        ReleaseNotes = '
0.8.2
* Added date to UserProfileSync output
* Added a function to initialise output for all Test methods
* Added PoShMon version to email output
* Added Farm Health Test (SharePoint) - not active

0.8.1
* Fixing a bug in the SharePoint UPS sync query for datetime

0.8.0
* Added User Profile Sync monitoring for SharePoint 2010/2013 FIM service
* Added CPU monitoring
* Added html encoding for Email notification
* Some unit test bug fixes and coverage work

0.7.0
* Added monitoring for server memory (free + total)
* Removed Credential for Pushbullet, using Header directly instead

0.6.2
* Fixed ordering of output columns (in email etc.)
* Removed hard-coded hard drive space threshold
* Refactored tests to take in ''PoShMonConfiguration'' instead of individual parameters
* Removed an unnecessary function
* Sorting database output by size (Desc)

0.6.1
* Improved global exception handler (try/catch) to handle initial exceptions.
* Added more tests
* Refactored internal Notification code

0.6.0
Adding Office 365 Teams notification output

0.5.1
Fixing Pushbullet notification output

0.5.0
Added Pushbullet support and some additional unit tests. Also improved description in module itself. Also see the GitHub project page for basic help tutorial

0.4.0 
Changed configuration approach 
minor bug fixes'

    } # End of PSData hashtable

} # End of PrivateData hashtable

# HelpInfo URI of this module
# HelpInfoURI = ''

# Default prefix for commands exported from this module. Override the default prefix using Import-Module -Prefix.
# DefaultCommandPrefix = ''

}

