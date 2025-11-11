# Quick Reference Card - Java 3D Engine

## Project Structure

```
Java/
├── src/                    → Core engine (8 files)
├── examples/               → Demo apps (3 files)
├── docs/                   → Documentation (4 files)
├── bin/                    → Compiled classes (auto-generated)
├── compile.ps1             → Build everything
├── run.ps1                 → Run examples
└── README.md               → Main documentation
```

## Quick Commands

```powershell
# Build everything
.\compile.ps1

# Run demos
.\run.ps1 Demo3D           # Full interactive demo ⭐
.\run.ps1 SimpleExample    # Minimal example
.\run.ps1 AdvancedExample  # GUI controls

# Clean build
Remove-Item bin\* -Force
.\compile.ps1
```

## Demo3D Controls

| Key/Mouse | Action |
|-----------|--------|
| **W** | Forward |
| **S** | Backward |
| **A** | Left |
| **D** | Right |
| **Space** | Up |
| **Shift** | Down |
| **Mouse Drag** | Rotate camera |
| **Mouse Wheel** | Zoom |
| **F** | Wireframe toggle |
| **R** | Auto-rotate toggle |
| **L** | Lighting toggle |
| **ESC** | Exit |

## Core Classes

| Class | Purpose |
|-------|---------|
| `Vector3D` | 3D vectors & math |
| `Matrix4x4` | Transformations |
| `Vertex` | 3D point + normal |
| `Triangle` | 3D triangle |
| `Mesh` | Collection of triangles |
| `Camera` | View & projection |
| `Light` | Lighting sources |
| `Renderer3D` | Main render engine |

## Quick Code Examples

### Create a Cube
```java
Mesh cube = Mesh.createCube(2.0);
cube.position = new Vector3D(0, 0, 0);
cube.rotation.y = Math.PI / 4;
```

### Setup Camera
```java
Camera camera = new Camera(
    new Vector3D(0, 2, -5),  // Position
    new Vector3D(0, 0, 0)    // Look at
);
```

### Add Lighting
```java
renderer.addLight(Light.createAmbient(Color.WHITE, 0.3));
renderer.addLight(Light.createDirectional(
    new Vector3D(-1, -1, -1), Color.WHITE));
```

### Render Loop
```java
renderer.clear(Color.BLACK);
mesh.rotation.y += 0.01;  // Animate
renderer.render(mesh);
g.drawImage(renderer.getBuffer(), 0, 0, null);
```

## Documentation

| File | Content |
|------|---------|
| `README.md` | Main documentation |
| `docs/README.md` | Technical details |
| `docs/QUICKSTART.md` | Code examples |
| `docs/PROJECT_SUMMARY.md` | Architecture |
| `STRUCTURE.md` | Directory layout |

## 🔧 Troubleshooting

**Compilation fails?**
```powershell
# Clean and rebuild
Remove-Item bin\* -Force
.\compile.ps1
```

**Can't run example?**
```powershell
# Make sure you compiled first
.\compile.ps1
.\run.ps1 Demo3D
```

**Objects not visible?**
- Check camera position
- Verify object positions
- Enable lighting

## Performance Tips

Enable backface culling (default: ON)  
Use wireframe for debugging  
Keep triangle count < 5000  
Lower resolution for more FPS  
Reduce number of lights  

## Next Steps

1. Run `.\compile.ps1`
2. Run `.\run.ps1 Demo3D`
3. Read `docs/QUICKSTART.md` for examples
4. Modify `examples/SimpleExample.java`
5. Create your own 3D scenes!

## Features

Pure Java - no dependencies  
Real-time 60 FPS rendering  
Interactive camera controls  
Multiple lighting types  
Wireframe & solid modes  
Easy Swing/JavaFX integration  
Well-documented code  
Ready-to-run examples  

---

**Version**: 1.0 | **Date**: Nov 2025 | **Lines**: ~1300
