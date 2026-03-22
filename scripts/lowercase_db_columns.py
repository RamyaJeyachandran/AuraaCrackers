import re
import os

def fix_db_columns(filepath):
    with open(filepath, 'r', encoding='utf-8') as f:
        content = f.read()

    # Find all db_column='...' and lowercase the value
    def lower_val(match):
        prefix = match.group(1)
        val = match.group(2).lower()
        suffix = match.group(3)
        return f"{prefix}{val}{suffix}"

    new_content = re.sub(r"(db_column=')(.*?)(')", lower_val, content)
    new_content = re.sub(r"(db_column=\")(.*?)(\")", lower_val, new_content)

    with open(filepath, 'w', encoding='utf-8') as f:
        f.write(new_content)
    print(f"Fixed {filepath}")

if __name__ == "__main__":
    files = [
        r'd:\AuraaZenAIProject\auraaCrakersProject\apps\crackers\models.py',
        r'd:\AuraaZenAIProject\auraaCrakersProject\apps\users\models.py'
    ]
    for f in files:
        if os.path.exists(f):
            fix_db_columns(f)
        else:
            print(f"File not found: {f}")
