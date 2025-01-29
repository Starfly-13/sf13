# build_windows.ps1

if(!(Test-Path -Path "C:/byond")){
    bash tools/starfly/ci/download_byond_windows.sh
    [System.IO.Compression.ZipFile]::ExtractToDirectory("C:/byond.zip", "C:/")
}

bash tools/ci/install_node.sh
bash tools/build/build -Werror
exit $LASTEXITCODE
