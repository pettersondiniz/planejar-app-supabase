[CmdletBinding()]
param()

$ErrorActionPreference = 'Stop'

function Test-CommandAvailable([string]$Name) {
  return $null -ne (Get-Command $Name -ErrorAction SilentlyContinue)
}

function Test-QuietCommand([scriptblock]$Command) {
  try {
    & $Command *> $null
    return $LASTEXITCODE -eq 0
  }
  catch {
    return $false
  }
}

$result = [ordered]@{
  gitInstalled = Test-CommandAvailable 'git'
  nodeInstalled = Test-CommandAvailable 'node'
  npmInstalled = Test-CommandAvailable 'npm'
  gitIdentityConfigured = $false
  cloudflareCliAvailable = $false
  cloudflareAuthenticated = $false
  supabaseCliAvailable = $false
  supabaseAuthenticated = $false
}

if ($result.gitInstalled) {
  $hasName = -not [string]::IsNullOrWhiteSpace((& git config --global --get user.name 2>$null))
  $hasEmail = -not [string]::IsNullOrWhiteSpace((& git config --global --get user.email 2>$null))
  $result.gitIdentityConfigured = $hasName -and $hasEmail
}

if ($result.npmInstalled) {
  $result.cloudflareCliAvailable = Test-QuietCommand { npx --no-install wrangler --version }
  if ($result.cloudflareCliAvailable) {
    $result.cloudflareAuthenticated = Test-QuietCommand { npx --no-install wrangler whoami }
  }

  $result.supabaseCliAvailable = Test-QuietCommand { npx --no-install supabase --version }
  if ($result.supabaseCliAvailable) {
    $result.supabaseAuthenticated = Test-QuietCommand { npx --no-install supabase projects list }
  }
}

[pscustomobject]$result
