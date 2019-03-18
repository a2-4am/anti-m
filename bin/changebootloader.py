#!/usr/bin/env python3

import sys
import os.path

target_disk_image, bootloader = sys.argv[1:]
ext = os.path.splitext(target_disk_image)[-1].lower()
assert(ext in (".dsk", ".do", ".po", ".2mg"))
if ext == ".2mg":
    offset = 64
else:
    offset = 0
with open(bootloader, 'rb') as f:
    boot = f.read()
assert(len(boot) == 512)
with open(target_disk_image, 'rb') as f:
    data = bytearray(f.read())
data[offset:offset+len(boot)] = boot
with open(target_disk_image, 'wb') as f:
    f.write(data)
