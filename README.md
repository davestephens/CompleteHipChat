# PSHipChat

PSHipchat is a collection of PowerShell Cmdlets that let you simplify and automate your interactions with HipChat. Based on [HipChat API v2](https://www.hipchat.com/docs/apiv2).

## Installation
Download the [latest binary](https://github.com/davestephens/PSHipchat/archive/master.zip)

Extract the zip, rename the folder within it to "PSHipChat", and copy to a folder in your`$env:PSModulePath`.

## Usage
To load the module:

	Import-Module PSHipchat

To list available cmdlets:

	Get-Command -Module PSHipchat

To get help on a specific cmdlet:	

	Get-Help Send-HipChatMessage -examples

## TODO

- Deal with result sets from the API that are larger than the MaxResults parameter.
- More cmdlets!
- Tidy up with reference to the [PowerShell Best Practises and Style Guide](https://github.com/PoshCode/PowerShellPracticeAndStyle)

## Contributing

Fork, write some extra functionality, submit a PR! 

Please try to stick to the [PowerShell Best Practises and Style Guide](https://github.com/PoshCode/PowerShellPracticeAndStyle). 