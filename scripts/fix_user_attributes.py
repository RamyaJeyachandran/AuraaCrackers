import re
import os

def replace_in_file(filepath, mapping):
    with open(filepath, 'r', encoding='utf-8') as f:
        content = f.read()

    new_content = content
    for old, new in mapping.items():
        new_content = new_content.replace(old, new)

    if new_content != content:
        with open(filepath, 'w', encoding='utf-8') as f:
            f.write(new_content)
        print(f"Updated {filepath}")

if __name__ == "__main__":
    mapping = {
        'user.user_name': 'user.username',
        'user_name': 'username'
    }
    # This might be too aggressive if 'user_name' is used in strings or logic.
    # Let's focus on user attributes and template tags etc.
    
    # Actually, I'll just manually fix the core ones since I see them.
    # But for templates like navbar, I should fix them.
