function List-FRMServices
{
    Param(
        [Parameter(Mandatory=$false)] [string] $Section = 'firewall'
    )

    # Check creds
    $Credentials = Get-AKCredentialsFromRC -Section $Section
    if(!$Credentials){ return $null }
    
    $ReqURL = "https://" + $Credentials.host + "/firewall-rules-manager/v1/services"
    $Result = Invoke-AkamaiOPEN -Method GET -ClientToken $Credentials.client_token -ClientAccessToken $Credentials.access_token -ClientSecret $Credentials.client_secret -ReqURL $ReqURL
    return $Result
}

