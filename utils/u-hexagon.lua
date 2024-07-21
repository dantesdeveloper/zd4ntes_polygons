 local vectors = {}

function createVector(width, height, rawData)
      local svgElm = svgCreate(width, height, rawData)
      local svgXML = svgGetDocumentXML(svgElm)
      local rect = xmlFindChild(svgXML, 'polygon', 0)

      return { 
            svg = svgElm,
            xml = svgXML,
            polygon = polygon
      }
end

function createHexagon(id, width, height)
      if (not id) then return end
      if (not (width or height)) then return end

      if (not vectors[id]) then
            width = width or 1
            height = height or 1

            local radius = math.min(width, height) / 2
            
            local hexagonPoints = {}
            for i = 0, 5 do
                  local angle = i * math.pi / 3
                  local x = radius * math.cos(angle) + radius
                  local y = radius * math.sin(angle) + radius
                  table.insert(hexagonPoints, string.format('%s,%s', x, y))
            end
            local points = table.concat(hexagonPoints, ' ')

            local raw = string.format([[
                  <svg width='%s' height='%s'>
                  <polygon points='%s' fill='#FFFFFF' />
                  </svg>
                  ]], width, height, points)
            local svg = createVector(width, height, raw)

            local attributes = {
                  type = 'hexagon',
                  svgDetails = svg,
                  width = width,
                  height = height
            }
            vectors[id] = attributes
      end
      return vectors[id]
end

function createHexagonStroke(id, width, height, sizeStroke)
      if (not id) then return end
      if (not (width or height)) then return end

      if (not vectors[id]) then
            sizeStroke = sizeStroke or 2

            local radius = math.min(width, height) / 2
            local radiusLength = (2 * math.pi) * radius
            local newWidth, newHeight = width + (sizeStroke * 2), height + (sizeStroke * 2)
            
            local hexagonPoints = {}
            for i = 0, 5 do
                  local angle = i * math.pi / 3
                  local x = radius * math.cos(angle) + radius
                  local y = radius * math.sin(angle) + radius
                  table.insert(hexagonPoints, string.format('%s,%s', x, y))
            end
            local points = table.concat(hexagonPoints, ' ')

            local raw = string.format([[
            <svg width='%s' height='%s'>
            <polygon points='%s' fill='#FFFFFF' fill-opacity='0' stroke='#FFFFFF'
            stroke-width='%s' stroke-dasharray='%s' stroke-dashoffset='%s' stroke-linecap='round' stroke-linejoin='round' />
            </svg>
            ]], newWidth, newHeight, points, sizeStroke, radiusLength, 0)
            local svg = createVector(width, height, raw)

            local attributes = {
                  type = 'hexagon-stroke',
                  svgDetails = svg,
                  width = width,
                  height = height,
                  radiusLength = radiusLength
            }
            vectors[id] = attributes
      end
      return vectors[id]
end

function hexagonOffset(id, value)
      if (not vectors[id]) then return end

      local svg = vectors[id]
      if (cache[id][2] ~= value) then
            if (not cache[id][1]) then
                  cache[id][3] = getTickCount()
                  cache[id][1] = true
            end
        
            local progress = (getTickCount() - cache[id][3]) / 2500
            cache[id][2] = interpolateBetween(cache[id][2], 0, 0, value, 0, 0, progress, 'OutQuad')

            if (progress > 1) then
                  cache[id][3] = nil
                  cache[id][1] = false
            end 

            local polygon = svg.svgDetails.polygon
            local newValue = svg.radiusLength - (svg.radiusLength / 100) * cache[id][2]

            xmlNodeSetAttribute(polygon, 'stroke-dashoffset', newValue)
            svgSetDocumentXML(svg.svgDetails.svg, svg.svgDetails.xml)
      elseif (cache[id][1]) then
            cache[id][1] = false
      end
end

function drawHexagon(id, x, y, color, rotX, rotY, rotZ, postGUI)
      if (not vectors[id]) then return end
      if (not (x or y)) then return end
      local svg = vectors[id]
    
      postGUI = postGUI or false 
      color = color or 0xFFFFFFFF
      
      local width, height = svg.width, svg.height
      
      dxSetBlendMode('add')
      dxDrawImage(x, y, width, height, svg.svgDetails.svg, rotX, rotY, rotZ, color, postGUI)
      dxSetBlendMode('modulate_add')
end
