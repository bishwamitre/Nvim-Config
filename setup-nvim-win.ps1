# Script to install Neovim, Neovide, Git, and set up custom config

function Ensure-Scoop {
    if (-not (Get-Command scoop -ErrorAction SilentlyContinue)) {
        Write-Host "Installing Scoop..."
        Set-ExecutionPolicy RemoteSigned -Scope CurrentUser -Force
        iwr -useb get.scoop.sh | iex
    } else {
        Write-Host "Scoop is already installed."
    }
}

# Install Scoop and required buckets
Ensure-Scoop
scoop bucket add extras

# Install essential tools
scoop install git
scoop install neovim
scoop install neovide

# Clone the Neovim config repository
$tempPath = "$env:TEMP\Nvim-Config"
$repoURL = "https://github.com/bishwamitre/Nvim-Config.git"

if (Test-Path $tempPath) {
    Remove-Item $tempPath -Recurse -Force
}

Write-Host "Cloning Neovim config from GitHub..."
git clone --depth 1 $repoURL $tempPath

# Create config directory if not exists
$nvimConfigPath = "$env:LOCALAPPDATA\nvim"
if (-Not (Test-Path $nvimConfigPath)) {
    New-Item -ItemType Directory -Path $nvimConfigPath | Out-Null
}

# Copy config files
Write-Host "Copying Neovim config to $nvimConfigPath..."
Copy-Item "$tempPath\nvim\*" $nvimConfigPath -Recurse -Force

# Cleanup
Remove-Item $tempPath -Recurse -Force

Write-Host "✅ Setup complete. Launch Neovim by running 'nvim' or 'neovide'"
