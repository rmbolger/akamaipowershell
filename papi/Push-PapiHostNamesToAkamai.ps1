function Push-PapiHostNamesToAkamai
{
    Param(
        [Parameter(Mandatory=$true)]  [string] $GroupID,
        [Parameter(Mandatory=$true)]  [string] $ContractId,
        [Parameter(Mandatory=$true)]  [string] $PropertyId,
        [Parameter(Mandatory=$true)]  [int]    $LatestVersionNo,
        [Parameter(Mandatory=$true)]  [string] $Body,
        [Parameter(Mandatory=$false)] [string] $Section = 'papi'
    )

    # Check creds
    $Credentials = Get-AKCredentialsFromRC -Section $Section
    if(!$Credentials){ return $null }

    $ReqURL = "https://" + $Credentials.host + "/papi/v1/properties/$PropertyId/versions/$LatestVersionNo/hostnames/?contractId=$ContractId&groupId=$GroupID"
    $Result = Invoke-AkamaiOPEN -Method PUT -ClientToken $Credentials.client_token -ClientAccessToken $Credentials.access_token -ClientSecret $Credentials.client_secret -ReqURL $ReqURL -Body $Body
    return $Result
}

