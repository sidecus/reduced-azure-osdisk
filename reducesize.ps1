# Script to help create Azure image with smaller OS disk (Azure default is 30GB).
# You can use images generated by this script to create custom virtual machine to save cost.

# Convert existing ubuntu azure image to vhdx
Convert-VHD -path .\livecd.ubuntu-cpc.azure.vhd -DestinationPath ubuntu32G.azure.vhdx -VHDType Dynamic
Get-VHD .\ubuntu32G.azure.vhdx

# Resize 
ren .\ubuntu32G.azure.vhdx .\ubuntu8G.azure.vhdx
Resize-VHD -Path .\ubuntu8G.azure.vhdx -SizeBytes 8GB
Get-VHD .\ubuntu8G.azure.vhdx

# Convert back to fixed disk size vhd
Convert-VHD -Path .\ubuntu8g.azure.vhdx -DestinationPath .\ubuntu8g.azure.vhd -VHDType Fixed