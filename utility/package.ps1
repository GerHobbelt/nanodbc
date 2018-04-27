#
# Package File
#

# Cleanup previous files
del *.nupkg
del nanodbc.autopkg
# Update the package definition based on the nuget from gitversion..

$commitCount = (gitversion.exe /showvariable CommitsSinceVersionSource)
$myVersion= (gitversion.exe /showvariable NugetVersion)

Write-Host "Version     : $myVersion"
Write-Host "Commit Count: $commitCount"

(Get-Content nanodbc.autopkg.source) | ForEach-Object { $_ -replace "%VERSION%", $myVersion } | Set-Content nanodbc.autopkg

Write-NugetPackage *.autopkg

# Push the package
nuget push *.nupkg -src $env:MY_NUGET_SERVER -ApiKey $env:MY_NUGET_APIKEY -verbosity detailed

# Delete all files.
del *.nupkg
del nanodbc.autopkg

# Tag the git repository.
git tag -d $myVersion
git push origin :refs/tags/$myVersion
git tag -a $myVersion -f -m "$myVersion (#$commitCount) on $env:computername by $env:username"
git push --tags
