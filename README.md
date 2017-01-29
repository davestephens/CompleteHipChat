# CompleteHipChat

CompleteHipChat module is a collection of PowerShell cmdlets that let you simplify and automate your interactions with HipChat. Based on the [HipChat API v2](https://www.hipchat.com/docs/apiv2).

Requires PowerShell v3 or greater.

## Installation
Download the [latest binary](https://github.com/davestephens/PSHipChat/archive/master.zip).

Extract the zip, rename the folder within it to "PSHipChat", and copy to a folder in your`$env:PSModulePath`.

## Usage
To load the module:

	Import-Module CompleteHipChat

To list available cmdlets:

	Get-Command -Module CompleteHipChat

To get help on a specific cmdlet:	

	Get-Help Send-HipChatMessage -examples

## TODO

- Work out how to write some meaningful tests.
- Deal with result sets from the API that are larger than the MaxResults parameter.
- More cmdlets!
- Tidy up with reference to the [PowerShell Best Practises and Style Guide](https://github.com/PoshCode/PowerShellPracticeAndStyle).

## Contributing

Fork, write some extra functionality, submit a PR! 

Please try to stick to the [PowerShell Best Practises and Style Guide](https://github.com/PoshCode/PowerShellPracticeAndStyle). 