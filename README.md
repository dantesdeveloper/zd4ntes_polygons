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

| Parâmetro | Descrição                     |
| :-------- | :---------------------------- |
| `id`      | What is the polygon called.   |
| `width`   | Size of width.                |
| `height`  | Size of height.               |

**Stroke Polygons**
```lua
createHexagonStroke('id', width, height, stroke)
```

| Parâmetro | Descrição                     |
| :-------- | :---------------------------- |
| `id`      | What is the polygon called.   |
| `width`   | Size of width.                |
| `height`  | Size of height.               |
| `stroke`  | Size of stroke.               |

**Draw Polygons**
```lua
drawHexagon('id', x, y, color, rotX, rotY, rotZ, postGUI)
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

```
