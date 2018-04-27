Build and Package Notes
=======================

# Build

- Visual Studio 2015 Community Edition or Pro/Enterprise.
- Windows Vista x64 or better.
- Powershell 3.0 or better.
- Chocolatey
- gitversion.portable (install via chocolatey)
- You will need the [CoApp Powershell Tools](http://coapp.org/index.html) which can be downloaded from this [link](http://coapp.org/files/CoApp.Tools.Powershell.msi).
- If you are using Nuget to publish, you will need to update the package.ps1 file with the server and your ApiKey. Make sure that that key is set under the environment variable `MY_NUGET_APIKEY`.

## How-to

1. Change to the `utility/` directory under `nanodbc`
1. Run the powershell script to package the header and cpp files.


