$resourceGroup = "xxxxx"
$vmName = "VM-Web1"
$location = "East US2"


# Install IIS
$PublicSettings = '{"commandToExecute":"powershell Add-WindowsFeature Web-Server"}'

Set-AzureRmVMExtension -ExtensionName "IIS" -ResourceGroupName $resourceGroup -VMName $vmName `
  -Publisher "Microsoft.Compute" -ExtensionType "CustomScriptExtension" -TypeHandlerVersion 1.4 `
  -SettingString $PublicSettings -Location $location
  
$resourceGroup = "xxxxx"
$vmName = "VM-Web2"
$location = "East US2"


# Install IIS
$PublicSettings = '{"commandToExecute":"powershell Add-WindowsFeature Web-Server"}'

Set-AzureRmVMExtension -ExtensionName "IIS" -ResourceGroupName $resourceGroup -VMName $vmName `
  -Publisher "Microsoft.Compute" -ExtensionType "CustomScriptExtension" -TypeHandlerVersion 1.4 `
  -SettingString $PublicSettings -Location $location
