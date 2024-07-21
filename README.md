# 📐 System of Polygons

> Simple function to create HUDs, notifications and other systems.

# Installation
- `1.` - Download MTA:SA on your machine: https://multitheftauto.com/
- `2.` - Download this repository.

# Explication

**Full Polygons**
```lua
createTriangle('id', width, height)
createDiamond('id', width, height) 
createPentagon('id', width, height) 
createHexagon('id', width, height)
```

| Parâmetro | Descrição                     |
| :-------- | :---------------------------- |
| `id`      | What is the polygon called.   |
| `width`   | Size of width.                |
| `height`  | Size of height.               |

**Stroke Polygons**
```lua
createTriangleStroke('id', width, height, stroke)
createDiamondStroke('id', width, height, stroke) 
createPentagonStroke('id', width, height, stroke) 
createHexagonStroke('id', width, height, stroke)
```

| Parâmetro | Descrição                     |
| :-------- | :---------------------------- |
| `id`      | What is the polygon called.   |
| `width`   | Size of width.                |
| `height`  | Size of height.               |
| `stroke`  | Size of stroke.               |

**Stroke Polygons**
```lua
createTriangleStroke('id', width, height, stroke)
createDiamondStroke('id', width, height, stroke) 
createPentagonStroke('id', width, height, stroke) 
createHexagonStroke('id', width, height, stroke)
```

| Parâmetro | Descrição                     |
| :-------- | :---------------------------- |
| `id`      | What is the polygon called.   |
| `width`   | Size of width.                |
| `height`  | Size of height.               |
| `stroke`  | Size of stroke.               |

# How to use

**Example**
```lua
addCommandHandler("localizar", function(player)
    local target = getRandomPlayer()
    local targetX, targetY, targetZ = getElementPosition(target)
    exports["mta-gps"]:setGPS(player, targetX, targetY, targetZ)
end)
```
