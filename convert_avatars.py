import os
import re
import base64

avatar_dir = 'assets/images/avatar'
for filename in os.listdir(avatar_dir):
    if filename.endswith('.svg'):
        filepath = os.path.join(avatar_dir, filename)
        with open(filepath, 'r') as f:
            content = f.read()
        
        match = re.search(r'data:image/png;base64,([^"]+)', content)
        if match:
            b64_data = match.group(1)
            png_data = base64.b64decode(b64_data)
            
            png_filename = filename.replace('.svg', '.png')
            png_filepath = os.path.join(avatar_dir, png_filename)
            with open(png_filepath, 'wb') as f:
                f.write(png_data)
            print(f"Converted {filename} to {png_filename}")
        else:
            print(f"No base64 png found in {filename}")
