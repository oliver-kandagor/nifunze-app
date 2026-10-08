import json

with open('/Users/kanda/nifunze/figma_style_guide.json', 'r') as f:
    data = json.load(f)

print("COLORS:")
for k, v in data.get('globalVars', {}).items():
    if isinstance(v, list) and len(v) > 0 and isinstance(v[0], str) and v[0].startswith('#'):
        print(f"  {k}: {v[0]}")

print("\nTEXT STYLES:")
for k, v in data.get('globalVars', {}).items():
    if isinstance(v, dict) and 'fontFamily' in v:
        print(f"  {k}: {v['fontFamily']} {v.get('fontWeight')} {v.get('fontSize')}px")
