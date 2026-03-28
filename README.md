# Tibbetts Minimap

Lightweight modular minimap enhancement addon for World of Warcraft (Ascension 3.3.5 + Classic).

---

## Overview

Tibbetts Minimap improves the default minimap by:

* Organizing minimap buttons into a clean grid
* Providing a UI-based filter system
* Aligning buffs/debuffs dynamically to the minimap
* Offering a modular, extensible architecture

Designed specifically for compatibility with legacy clients and private servers.

---

## Features

### Button System

* Automatic button detection
* Grid layout engine
* Adjustable size + rows
* Click-to-filter UI
* Protected frame safe

### Buff System

* Minimap edge anchoring
* Direction toggle (left/right)
* Adjustable size, spacing, rows
* Stable deterministic layout

### UI System

* `/tm ui` opens configuration
* Tabbed interface:

  * Buttons
  * Buffs
  * Filters
  * Modules

### Module System

* Toggle systems at runtime
* Independent enable/disable

### Config System

* SavedVariables profile storage
* Persistent settings + filters

---

## Installation

```
Interface/AddOns/TibbettsMinimap/
```

---

## Compatibility

* Ascension WoW (3.3.5)
* Wrath Classic
* Classic Era
* 3.3.5 private servers

---

## Architecture

```
Core/
  Config.lua
  Timer.lua

Modules/
  ModuleManager.lua
  LayoutEngine.lua
  ButtonSystem.lua
  BuffSystem.lua

UI/
  MainUI.lua
  Slash.lua
```

---

## Design Goals

* No retail API usage
* No taint / protected frame issues
* Stable across legacy clients
* Modular and extensible

---

## Known Limitations

* Timer-based updates (not event-driven yet)
* No drag positioning system
* Limited buff growth directions
* Filter UI lacks state highlighting

---

## Roadmap

### v1.1

* Event-driven updates
* Drag + snap layout system

### v1.2

* Advanced UI controls
* Buff growth modes
* Filter state indicators

---

## Contributing

* Keep compatibility with 3.3.5 API
* Avoid retail-only functions
* Maintain module isolation

---

## License

MIT

---
