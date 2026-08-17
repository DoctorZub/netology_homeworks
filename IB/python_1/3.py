import sys
import os
from pathlib import Path

p = Path(fr"{sys.argv[1]}")

if p.exists():
    if p.is_file():
        print("это файл")
    elif p.is_dir():
        print("это каталог")
else:
    print("такого пути не существует")