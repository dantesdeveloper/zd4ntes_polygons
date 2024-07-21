# 📐 System of Polygons

> Simple function to create HUDs, notifications and other systems.

# Installation
- `1.` - Download MTA:SA on your machine: https://multitheftauto.com/
- `2.` - Download this repository.

# Explication

**Full Polygons**
```lua
createHexagon('id', width, height)
```

| Parameter | Description                   |
| :-------- | :---------------------------- |
| `id`      | What is the polygon called.   |
| `width`   | Size of width.                |
| `height`  | Size of height.               |

**Stroke Polygons**
```lua
createHexagonStroke('id', width, height, stroke)
```

| Parameter | Description                   |
| :-------- | :---------------------------- |
| `id`      | What is the polygon called.   |
| `width`   | Size of width.                |
| `height`  | Size of height.               |
| `stroke`  | Size of stroke.               |

**Draw Polygons**
```lua
drawHexagon('id', x, y, color, rotX, rotY, rotZ, postGUI)
```

| Parameter | Description                   |
| :-------- | :---------------------------- |
| `id`      | What is the polygon called.   |
| `x`       | Size of x.                    |
| `y`       | Size of y.                    |
| `tocolor` | Color of polygon.             |
| `rotX`    | Polygon rotation in X.        |
| `rotY`    | Polygon rotation in Y.        |
| `rotZ`    | Polygon rotation in Z.        |
| `postGUI` | Define if the polygon is drawn over the graphical interface (true) or behind it (false). |

**Offset Polygons**
```lua
hexagonOffset('id', value)
```

| Parameter | Description                   |
| :-------- | :---------------------------- |
| `id`      | What is the polygon called.   |
| `value`   | Value to Offset in svg.       |

# Utilization

**Example**
```lua
cache = {
      example = { false, 0, getTickCount() }
}

function start()
      createHexagon('bgExample', 50, 50)
      createHexagonStroke('example', 55, 55)
end
addEventHandler('onClientResourceStart', resourceRoot, start)

function interface()
      drawHexagon('base', 910, 500, tocolor(0, 0, 0), 0, 0, 0, false)

      drawHexagon('example', 910, 500, tocolor(255, 0, 0), 0, 0, 0, false)
      hexagonOffset('example', getElementHealth(localPlayer))
end
addEventHandler('onClientRender', root, interface)
```
