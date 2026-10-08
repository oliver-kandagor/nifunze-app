import json

with open('/Users/kanda/nifunze/figma_style_guide.json', 'r') as f:
    data = json.load(f)

for k, v in data.get("globalVars", {}).items():
    print(f"{k}: {v}")
