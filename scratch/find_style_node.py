import json

with open('/Users/kanda/nifunze/figma_full.json', 'r') as f:
    data = json.load(f)

def search(node):
    name = node.get('name', '').lower()
    if 'style' in name or 'color' in name or 'typo' in name or 'guide' in name:
        print("Found node:", node['id'], node['name'])
    
    if 'children' in node:
        for child in node['children']:
            search(child)

if 'document' in data:
    search(data['document'])
