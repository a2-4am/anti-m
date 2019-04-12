#
# Anti-M Makefile
# assembles source code, optionally builds a disk image and mounts it
#
# original by Quinn Dunki on 2014-08-15
# One Girl, One Laptop Productions
# http://www.quinndunki.com/blondihacks
#
# adapted by 4am on 2019-03-09
#

# third-party tools required to build
# https://sourceforge.net/projects/acme-crossass/
ACME=acme
# https://www.brutaldeluxe.fr/products/crossdevtools/cadius/
# https://github.com/mach-kernel/cadius
CADIUS=cadius

BUILDDISK=build/anti-m
VOLUME=ANTI.M

asm:
	mkdir -p build
	$(ACME) -r build/anti-m.lst src/anti-m.a
	cp res/work.bin "$(BUILDDISK)".po
	cp res/_FileInformation.txt build/ >>build/log
	$(CADIUS) ADDFILE "$(BUILDDISK)".po "/${VOLUME}/" "build/ANTI.M.SYSTEM" >>build/log
	$(ACME) -r build/proboot.lst src/proboot.a
	bin/changebootloader.py "$(BUILDDISK)".po build/proboot
	bin/po2do.py build/ build/
	rm "$(BUILDDISK)".po

clean:
	rm -rf build/

mount:
	open "$(BUILDDISK)".dsk

all: clean asm mount
