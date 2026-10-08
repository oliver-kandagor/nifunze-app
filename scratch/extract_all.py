import json

with open('/Users/kanda/nifunze/figma_full.json', 'r') as f:
    data = json.load(f)

styles_meta = data.get('styles', {})
extracted_colors = {}
extracted_texts = {}

def rgba_to_hex(r, g, b, a):
    def to_hex(val):
        return f"{int(round(val * 255)):02X}"
    if a < 1.0:
        return f"0x{to_hex(a)}{to_hex(r)}{to_hex(g)}{to_hex(b)}"
    return f"0xFF{to_hex(r)}{to_hex(g)}{to_hex(b)}"

def traverse(node):
    # Extract from node styles mapping
    node_styles = node.get('styles', {})
    
    # Fill colors
    if 'fill' in node_styles and 'fills' in node:
        style_id = node_styles['fill']
        for fill in node.get('fills', []):
            if fill.get('type') == 'SOLID' and 'color' in fill:
                c = fill['color']
                hex_color = rgba_to_hex(c.get('r',0), c.get('g',0), c.get('b',0), c.get('a',1))
                name = styles_meta.get(style_id, {}).get('name', style_id)
                extracted_colors[name] = hex_color

    # Text styles
    if 'text' in node_styles and 'style' in node:
        style_id = node_styles['text']
        name = styles_meta.get(style_id, {}).get('name', style_id)
        extracted_texts[name] = node['style']

    if 'children' in node:
        for child in node['children']:
            traverse(child)

if 'document' in data:
    traverse(data['document'])

print("Found Colors:")
for k, v in sorted(extracted_colors.items()):
    print(f"  {k}: {v}")

print("\nFound Text Styles:")
for k, v in sorted(extracted_texts.items()):
    print(f"  {k}: {v.get('fontFamily', '')} {v.get('fontWeight', '')} {v.get('fontSize', '')}px")

