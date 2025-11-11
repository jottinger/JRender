# Run Java 3D Engine Examples
# Usage: .\run.ps1 <ClassName>
# Example: .\run.ps1 Demo3D

param(
    [Parameter(Mandatory=$true)]
    [ValidateSet("ShowcaseDemo", "Demo3D", "SimpleExample", "AdvancedExample")]
    [string]$Example
)

Write-Host "Running $Example..." -ForegroundColor Cyan

# Check if bin directory exists
if (-not (Test-Path "bin")) {
    Write-Host "Error: bin directory not found. Run compile.ps1 first." -ForegroundColor Red
    exit 1
}

# Run the example
java -cp bin $Example

if ($LASTEXITCODE -ne 0) {
    Write-Host "`nProgram exited with code $LASTEXITCODE" -ForegroundColor Yellow
}
