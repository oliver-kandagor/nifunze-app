import json
import sys

with open('/Users/kanda/nifunze/figma_full.json', 'r') as f:
    data = json.load(f)

styles_meta = data.get('styles', {})
print(f"Found {len(styles_meta)} styles in metadata.")

# We want to extract the actual values. In Figma API, the node tree contains the style values if they are used, or we might find them in the styles definition if they exist.
# Actually, the file JSON has a `document` property.
# Let's search the document for nodes that define these styles.
# Or if it's simpler, just dump the whole document structure and extract anything with `type == "TEXT"` or `fills` to find the colors.

colors = {}
text_styles = {}

def traverse(node):
    if 'styles' in node:
        for k, v in node['styles'].items():
            if k == 'fill' and 'fills' in node and node['fills']:
                fill = node['fills'][0]
                if fill['type'] == 'SOLID' and 'color' in fill:
                    c = fill['color']
                    name = styles_meta.get(v, {}).get('name', v)
                    colors[name] = f"rgba({c.get('r',0)*255}, {c.get('g',0)*255}, {c.get('b',0)*255}, {c.get('a',1)})"
            if k == 'text' and 'style' in node:
                name = styles_meta.get(v, {}).get('name', v)
                text_styles[name] = node['style']

    if 'children' in node:
        for child in node['children']:
            traverse(child)

if 'document' in data:
    traverse(data['document'])

with open('/Users/kanda/nifunze/extracted_styles.json', 'w') as f:
    json.dump({'colors': colors, 'text_styles': text_styles}, f, indent=2)
print("Extracted to extracted_styles.json")
