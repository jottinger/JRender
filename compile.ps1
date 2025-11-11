# Compile Java 3D Engine
# Compiles all source files to the bin directory

Write-Host "Compiling Java 3D Graphics Engine..." -ForegroundColor Cyan
Write-Host "=" * 50 -ForegroundColor Cyan

# Clean bin directory
Write-Host "`nCleaning bin directory..." -ForegroundColor Yellow
Remove-Item -Path "bin\*" -Force -ErrorAction SilentlyContinue

# Compile core engine
Write-Host "Compiling core engine..." -ForegroundColor Green
javac -d bin src\*.java

if ($LASTEXITCODE -eq 0) {
    Write-Host "[OK] Core engine compiled successfully" -ForegroundColor Green
    
    # Compile examples
    Write-Host "`nCompiling examples..." -ForegroundColor Green
    javac -cp bin -d bin examples\*.java
    
    if ($LASTEXITCODE -eq 0) {
        Write-Host "[OK] Examples compiled successfully" -ForegroundColor Green
        Write-Host "`n" + ("=" * 50) -ForegroundColor Cyan
        Write-Host "Build successful!" -ForegroundColor Green
        Write-Host "`nYou can now run:" -ForegroundColor Yellow
        Write-Host "  .\run.ps1 ShowcaseDemo   (RECOMMENDED!)" -ForegroundColor White
        Write-Host "  .\run.ps1 Demo3D" -ForegroundColor White
        Write-Host "  .\run.ps1 SimpleExample" -ForegroundColor White
        Write-Host "  .\run.ps1 AdvancedExample" -ForegroundColor White
    } else {
        Write-Host "[ERROR] Failed to compile examples" -ForegroundColor Red
        exit 1
    }
} else {
    Write-Host "[ERROR] Failed to compile core engine" -ForegroundColor Red
    exit 1
}
