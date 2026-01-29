import os
import shutil

# Define the base directory
locations_dir = r"c:\Users\Admin\Desktop\Korean Motor Spares\locations"

# Use midrand.html as the template (it's still intact)
template_file = os.path.join(locations_dir, "midrand.html")

# Files that were corrupted
corrupted_files = [
    ("alberton.html", "Alberton"),
    ("benoni.html", "Benoni"),
    ("boksburg.html", "Boksburg"),
    ("brakpan.html", "Brakpan"),
    ("centurion.html", "Centurion")
]

def restore_file(filename, location_name):
    """Restore a corrupted file using the template"""
    try:
        # Read the template
        with open(template_file, 'r', encoding='utf-8') as f:
            content = f.read()
        
        # Replace "Midrand" with the actual location name
        content = content.replace("Midrand", location_name)
        content = content.replace("midrand", location_name.lower())
        
        # Write to the target file
        target_file = os.path.join(locations_dir, filename)
        with open(target_file, 'w', encoding='utf-8') as f:
            f.write(content)
        
        print(f"✓ Restored {filename}")
        return True
        
    except Exception as e:
        print(f"✗ Error restoring {filename}: {str(e)}")
        return False

print("Restoring corrupted location files...\n")
restored_count = 0

for filename, location_name in corrupted_files:
    if restore_file(filename, location_name):
        restored_count += 1

print(f"\n{'='*50}")
print(f"Restored {restored_count} out of {len(corrupted_files)} files.")
print(f"{'='*50}")
