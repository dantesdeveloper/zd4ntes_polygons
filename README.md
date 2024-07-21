# 📐 System of Polygons

> Simple function to create HUDs, notifications and other systems.

# Installation
- `1.` - Download MTA:SA on your machine: https://multitheftauto.com/
- `2.` - Download this repository.

# Explication

**Full Polygons**
```lua
dxCreateTriangle('id', width, height)
dxCreateDiamond('id', width, height) 
dxCreatePentagon('id', width, height) 
dxCreateHexagon('id', width, height)
```

| Parâmetro | Descrição                     |
| :-------- | :---------------------------- |
| `id`      | What is the polygon called.   |
| `width`   | Size of width.                |
| `height`  | Size of height.               |

**Stroke Polygons**
```lua
dxCreateTriangleStroke('id', width, height, stroke)
dxCreateDiamondStroke('id', width, height, stroke) 
dxCreatePentagonStroke('id', width, height, stroke) 
dxCreateHexagonStroke('id', width, height, stroke)
```

| Parâmetro | Descrição                     |
| :-------- | :---------------------------- |
| `id`      | What is the polygon called.   |
| `width`   | Size of width.                |
| `height`  | Size of height.               |
| `stroke`  | Size of stroke.               |

**Draw Polygons**
```lua
dxDrawTriangle('id', x, y, color, rotX, rotY, rotZ, postGUI)
dxDrawDiamond('id', x, y, color, rotX, rotY, rotZ, postGUI)
dxDrawPentagon('id', x, y, color, rotX, rotY, rotZ, postGUI)
dxDrawHexagon('id', x, y, color, rotX, rotY, rotZ, postGUI)
```

| Parâmetro | Descrição                     |
| :-------- | :---------------------------- |
| `id`      | What is the polygon called.   |
| `x`       | Size of x.                    |
| `y`       | Size of y.                    |
| `tocolor` | Color of polygon.             |
| `rotX`    | Polygon rotation in X.        |
| `rotY`    | Polygon rotation in Y.        |
| `rotZ`    | Polygon rotation in Z.        |
| `postGUI` | Define if the polygon is drawn over the graphical interface (true) or behind it (false).             |

# Utilization

**Example**
```lua
addCommandHandler("localizar", function(player)
    local target = getRandomPlayer()
    local targetX, targetY, targetZ = getElementPosition(target)
    exports["mta-gps"]:setGPS(player, targetX, targetY, targetZ)
end)
```
