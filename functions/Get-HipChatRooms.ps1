function Get-HipChatRooms {
<#

.SYNOPSIS
	Returns an array of HipChat rooms that the auth token has access to.
.DESCRIPTION
	Returns an array of HipChat rooms that the auth token has access to.
.LINK
	https://github.com/DaveStephens/PSHipchat
.PARAMETER AuthToken
	Required. Your HipChat API token, that you can create here https://www.hipchat.com/account/api
.PARAMETER MaxResults
	The maximum results that you want to see. Defaults to 100, limited to 1000 by the Hipchat API.
.PARAMETER IncludePrivate
	Whether to include private rooms in the results. Defaults to true.
.PARAMETER IncludeArchived
	Whether to include archived rooms in the results. Defaults to false.
.PARAMETER ApiHost
	The URI of the HipChat api (default: api.hipchat.com)
.PARAMETER TimeoutSecs
	Timeout of the HTTP call to the HipChat API. Defaults to 10 seconds.
.EXAMPLE
	Get-HipChatRooms -AuthToken 1234abcd5678efgh -MaxResults 1000 

#>
	[cmdletbinding()]
		param(
			[Parameter(
				Position = 0,
				Mandatory = $True )]
				[string]$AuthToken,
			[Parameter(
				Position = 1,
				Mandatory = $False )]
				[string]$MaxResults = 100,
			[Parameter(
				Position = 2,
				Mandatory = $False )]
				[string]$IncludePrivate = "true",
			[Parameter(
				Position = 3,
				Mandatory = $False )]
				[string]$IncludeArchived = "false",
			[Parameter(
				Position = 4,
				Mandatory = $False )]
				[string]$ApiHost = "api.hipchat.com",
			[Parameter(
				Position = 5,
				Mandatory = $False )]
				[string]$TimeoutSecs = 10
			)
	begin {
		$DebugPreference = "Continue"
	}

	process	{
		try {
			$url = "https://$ApiHost/v2/room"
			Write-Verbose $url

			$headers = @{			
				"Authorization" = "Bearer $AuthToken"
			}

			$messageContent = @{
				"max-results" = $MaxResults
				"include-archived" = $IncludeArchived
				"include-private" = $IncludePrivate
			}

			$jsonMessage = ConvertTo-Json $messageContent
			Write-Verbose $jsonMessage

			$result = Invoke-RestMethod -Method Get -Uri $url -Headers $headers -TimeoutSec $TimeoutSecs -Body $jsonMessage -ContentType 'application/json'
		}
		catch {
			throw $_
		}
	}
	end	{
		return $result.items
	}
}
