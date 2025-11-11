# Java 3D Graphics Engine

A fully native Java 3D graphics engine built from scratch without external dependencies. Features real-time rendering, interactive camera controls, lighting, and can be integrated with Swing or JavaFX.

## Directory Structure

```
Java/
├── src/              # Core engine source files
│   ├── Vector3D.java
│   ├── Matrix4x4.java
│   ├── Vertex.java
│   ├── Triangle.java
│   ├── Mesh.java
│   ├── Camera.java
│   ├── Light.java
│   └── Renderer3D.java
├── examples/         # Example applications
│   ├── Demo3D.java           # Full interactive demo
│   ├── SimpleExample.java    # Minimal example
│   └── AdvancedExample.java  # Advanced multi-object scene
├── docs/             # Documentation
│   ├── README.md
│   ├── QUICKSTART.md
│   └── PROJECT_SUMMARY.md
├── bin/              # Compiled class files (auto-generated)
├── compile.ps1       # Build script
└── run.ps1           # Run script
```

## Quick Start

### 1. Compile Everything
```powershell
.\compile.ps1
```

### 2. Run Examples
```powershell
# Full interactive demo (recommended)
.\run.ps1 Demo3D

# Simple rotating cube
.\run.ps1 SimpleExample

# Advanced scene with GUI controls
.\run.ps1 AdvancedExample
```

### Alternative: Manual Compilation
```powershell
# Compile core engine
javac -d bin src\*.java

# Compile examples
javac -cp bin -d bin examples\*.java

# Run an example
java -cp bin Demo3D
```

## Features

### Core Engine
- **3D Mathematics**: Vector3D, Matrix4x4 for transformations
- **Geometry**: Vertex, Triangle, and Mesh structures
- **Camera System**: Perspective projection with orbit and movement controls
- **Rendering Pipeline**: Model-View-Projection transformations, backface culling, depth sorting
- **Lighting System**: Ambient, directional, and point lights with diffuse shading
- **Rendering Modes**: Wireframe and solid rendering

### Demo Applications

#### Demo3D (Full Interactive Demo)
- Multiple animated 3D objects
- **Controls:**
  - WASD - Move camera
  - Space/Shift - Move up/down
  - Mouse drag - Rotate camera
  - Mouse wheel - Zoom
  - F - Toggle wireframe
  - R - Toggle auto-rotation
  - L - Toggle lighting
  - ESC - Exit

#### SimpleExample
- Minimal code example
- Single rotating cube
- Perfect starting point for integration

#### AdvancedExample
- Multi-object scene
- GUI control panel with sliders
- Real-time parameter adjustment

## Integration Examples

### Basic Swing Integration
```java
Renderer3D renderer = new Renderer3D(800, 600);
Camera camera = new Camera(new Vector3D(0, 0, -5), new Vector3D(0, 0, 0));
renderer.setCamera(camera);
Mesh cube = Mesh.createCube(2.0);

// In paintComponent:
renderer.clear(Color.BLACK);
renderer.render(cube);
g.drawImage(renderer.getBuffer(), 0, 0, null);
```

### JavaFX Integration
```java
import javafx.embed.swing.SwingFXUtils;

Renderer3D renderer = new Renderer3D(800, 600);
ImageView imageView = new ImageView();

// In animation loop:
renderer.clear(Color.BLACK);
renderer.render(mesh);
imageView.setImage(SwingFXUtils.toFXImage(renderer.getBuffer(), null));
```

## Documentation

- **[README.md](docs/README.md)** - Complete technical documentation
- **[QUICKSTART.md](docs/QUICKSTART.md)** - Quick reference guide with code examples
- **[PROJECT_SUMMARY.md](docs/PROJECT_SUMMARY.md)** - Project overview and architecture

## Requirements

- Java JDK 8 or higher
- No external dependencies required

## Performance

- Target: 60 FPS
- Resolution: 800x600 to 1920x1080
- Triangle budget: ~1000-5000 for smooth performance
- Memory: ~10-50 MB depending on scene complexity

## Extending the Engine

The engine is designed to be easily extensible:

- Add new mesh types in `Mesh.java`
- Implement custom shading in `Light.java`
- Add texturing support to `Renderer3D.java`
- Create scene graphs for hierarchical objects
- Implement Z-buffer for proper depth testing

## License

Educational/demonstration project. Free to use and modify.

## Troubleshooting

### Compilation Issues
```powershell
# Clean and rebuild
Remove-Item -Path bin\* -Force
.\compile.ps1
```

### Runtime Issues
- Ensure you're in the Java directory when running
- Check that bin directory contains .class files
- Verify Java version: `java -version`

## Future Enhancements

- [ ] Texture mapping
- [ ] Z-buffer depth testing
- [ ] More primitive shapes
- [ ] Model loading (OBJ, STL)
- [ ] Specular lighting
- [ ] Shadow mapping
- [ ] Multi-threading

---

**Created**: November 2025  
**Version**: 1.0
