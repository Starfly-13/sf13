# build.ps1

# if we don't have a C:/byond folder
if(!(Test-Path -Path "C:/byond")){
    # copy the cached BYOND download to C:/byond.zip
    bash tools/starfly/ci/install_byond_windows.sh
    # unzip C:/byond.zip to C:/byond
    [System.IO.Compression.ZipFile]::ExtractToDirectory("C:/byond.zip", "C:/")
    # remove the zip now that we're done with it
    Remove-Item C:/byond.zip
}

# install Node.js
bash tools/ci/install_node.sh
# build the project!
bash tools/build/build -Werror

# report if we succeeded or not
exit $LASTEXITCODE
