import sys
import os

for i in os.listdir(sys.argv[1]):
    print(i)

print(f"\nTotal objects: {len(os.listdir(sys.argv[1]))}")