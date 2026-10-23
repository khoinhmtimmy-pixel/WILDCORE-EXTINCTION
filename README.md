# WILDCORE: EXTINCTION

A 2.5D third-person survival game built with Godot 4 and GDScript.

## Project Structure

- `scenes/` - Godot scene files (main scene, player, etc.)
- `scripts/` - GDScript source files
- `assets/` - Textures, models, and audio
- `ui/` - User interface scenes and scripts
- `creatures/` - Creature scenes and scripts
- `enemies/` - Enemy scenes and scripts

## Requirements

- Godot Engine 4.7 or newer (standard build, GDScript)

## Running the Game (Desktop)

1. Install Godot 4.7+ from https://godotengine.org/download
2. Open Godot and click **Import**.
3. Select `project.godot` in this repository.
4. Open the imported project.
5. Press **F5** (or click the Play button) to run. The main scene is `scenes/main.tscn`.

### Controls

- **WASD** - Move
- **Mouse / Click** - Look around (click the canvas first on web)
- **Space** - Jump
- **Esc** - Release mouse cursor

## Web Deployment

This repository ships a ready-to-host web build in `build/web/`. To deploy:

1. Upload the contents of `build/web/` to any static host (GitHub Pages, Netlify, Vercel, itch.io, etc.).
2. Open the deployed URL in a browser.

The web export is configured without threads, so no special COOP/COEP headers are required.

To rebuild the web export yourself:

1. Install Godot 4.7+ export templates.
2. Run: `godot --headless --path . --export-release "Web" build/web/index.html`

### Why a deployed folder may appear blank

- The repository contains Godot *source* (`.tscn`, `.gd`), which browsers cannot run directly. You must export to HTML5 first (or use the included `build/web/`).
- On web, mouse look requires a user click before pointer lock is allowed; click the game canvas to enable looking around.

## Status

Foundation only: a basic playable environment with terrain, lighting, sky, and a player character placeholder. Advanced gameplay systems are not implemented yet.
