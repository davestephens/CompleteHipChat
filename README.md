# CompleteHipChat

CompleteHipChat module is a collection of PowerShell cmdlets that let you simplify and automate your interactions with HipChat. Based on the [HipChat API v2](https://www.hipchat.com/docs/apiv2).

Requires PowerShell v3 or greater.

## Installation
CompleteHipChat is hosted on the [PowerShell Gallery](https://www.powershellgallery.com) for easy installation with PowerShellGet. PowerShellGet comes with PowerShell v5, or can be easily installed on earlier versions.

### With PowerShellGet
	Install-Module -Name CompleteHipChat

### Without PowerShellGet
Download the [latest binary](https://github.com/davestephens/CompleteHipChat/archive/master.zip).

Extract the zip, rename the folder within it to "CompleteHipChat", and copy to a folder in your `$env:PSModulePath`.

## Usage
To load the module:

	Import-Module CompleteHipChat

To list available cmdlets:

	Get-Command -Module CompleteHipChat

To get help on a specific cmdlet:	

	Get-Help <cmdlet> -examples

## Functionality
Currently implemented:

- Send a message to a HipChat room - `Send-HipChatMessage`
- Retrieve a list of rooms from the HipChat server - `Get-HipChatRooms`

## TODO
- Work out how to write some meaningful tests.
- Deal with result sets from the API that are larger than the MaxResults parameter.
- More cmdlets!
- Tidy up with reference to the [PowerShell Best Practises and Style Guide](https://github.com/PoshCode/PowerShellPracticeAndStyle).

## Contributing
Fork, write some extra functionality, submit a PR! 

Please try to stick to the [PowerShell Best Practises and Style Guide](https://github.com/PoshCode/PowerShellPracticeAndStyle). 