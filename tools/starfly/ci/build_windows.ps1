# build_windows.ps1

bash tools/ci/install_node.sh
bash tools/build/build -Werror
exit $LASTEXITCODE
