function Send-HipChatMessage {
<#

.SYNOPSIS
	Sends a message to a room in HipChat.
.DESCRIPTION
	Sends a message to a room in HipChat.
.LINK
	https://github.com/DaveStephens/PSHipchat
.PARAMETER AuthToken
	Required. Your HipChat API token, created here https://www.hipchat.com/account/api
.PARAMETER RoomID
	Required. The id of the room.
.PARAMETER Message
	Required. The message body. 10,000 characters max.
.PARAMETER Color
	The background color of the HipChat message. One of "yellow", "red", "green", "purple", "gray", or "random". Defaults to gray.
.PARAMETER Notify
	Whether this message should trigger a user notification (change the tab color, play a sound, notify mobile phones, etc).
	Each recipient's notification preferences are taken into account. Defaults to false.
.PARAMETER MessageFormat
	Determines how the message is treated by the HipChat server and rendered inside HipChat applications. More info at https://www.hipchat.com/docs/apiv2/method/send_room_notification.

	Valid values are html or text, defaults to 'text'.
.PARAMETER ApiHost
	The URI of the HipChat api (default: api.hipchat.com).
.PARAMETER TimeoutSecs
	Timeout of the HTTP call to the Hipchat API. Defaults to 10 seconds.
.EXAMPLE
	Send-HipChatMessage -AuthToken 1234abcd5678efgh -RoomID 1234 -Message "All your base are belong to us."

#>
	[cmdletbinding()]
		param(
			[Parameter(
				Position = 0,
				Mandatory = $True )]
				[string]$AuthToken,
			[Parameter(
				Position = 1,
				Mandatory = $True )]
				[string]$RoomID,
			[Parameter(
				Position = 2,
				Mandatory = $True )]
				[string]$Message,
			[Parameter(
				Position = 3,
				Mandatory = $False )]
				[string]$Color = "gray",
			[Parameter(
				Position = 4,
				Mandatory = $False )]
				[string]$Notify = "false",
			[Parameter(
				Position = 5,
				Mandatory = $False )]
				[string]$MessageFormat = "text",
			[Parameter(
				Position = 6,
				Mandatory = $False )]
				[string]$ApiHost = "api.hipchat.com",
			[Parameter(
				Position = 7,
				Mandatory = $False )]
				[string]$TimeoutSecs = 10
			)
	begin {
		$DebugPreference = "Continue"
	}

	process	{
		try {
			$RoomID = [System.Uri]::EscapeDataString($RoomID)
			$url = "https://$ApiHost/v2/room/$RoomID/notification"
			Write-Verbose $url

			$headers = @{			
				"Authorization" = "Bearer $AuthToken"
			}

			$messageContent = @{
				"color" = $Color
				"message_format" = $MessageFormat
				"notify" = $Notify
				"message" = $Message
			}

			$jsonMessage = ConvertTo-Json $messageContent
			Write-Verbose $jsonMessage

			$result = Invoke-RestMethod -Method Post -Uri $url -Headers $headers -TimeoutSec $TimeoutSecs -Body $jsonMessage -ContentType 'application/json'
			Write-Verbose $result
		}
		catch {
			throw $_
		}
	}
end	{
		return $result
	}
}
