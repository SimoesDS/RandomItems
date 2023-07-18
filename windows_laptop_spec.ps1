$cpu = (Get-WmiObject Win32_Processor).Name
$ram = (Get-WmiObject Win32_ComputerSystem).TotalPhysicalMemory
$storage = (Get-WmiObject Win32_DiskDrive).Size
$os = (Get-WmiObject Win32_OperatingSystem).Caption
$gpu = (Get-WmiObject Win32_VideoController).VideoProcessor -split "\n" -join " | "
$gpu = $gpu -replace ' \| $', ''
$monitor = Get-WmiObject Win32_DesktopMonitor | Select-Object ScreenWidth, ScreenHeight, MonitorType
$model = (Get-WmiObject Win32_ComputerSystem).Model
$manufacturer = (Get-WmiObject Win32_ComputerSystem).Manufacturer
$screen = [System.Windows.Forms.Screen]::PrimaryScreen
$width = $screen.Bounds.Width
$height = $screen.Bounds.Height

$ramGB = [math]::Round($ram / 1.073741824e9, 2)
$storageGB = [math]::Round($storage / 1.073741824e9, 2)

Write-Host "PC Model: $manufacturer $model"
Write-Host "CPU: $cpu"
Write-Host "RAM: $ramGB GB"
Write-Host "Graphics Card: $gpu"
Write-Host "Storage: $storageGB GB"
Write-Host "Windows Version: $os"
Write-Host "Screen Resolution: $width x $height"