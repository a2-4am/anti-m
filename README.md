# Anti-M

Boot any Apple II disk on any Apple II

[Download latest Anti-M disk image](https://github.com/a2-4am/anti-m/releases/download/v1.6/anti-m-v1.6-2019-11-09.dsk)
(version **1.6**, released **2019-11-09**, runs on any 48K Apple II)

## What is this?

Many early Apple II games only worked on the original Apple II or Apple ][+.
They refuse to boot on later models, often displaying an "M" error code. This
was due to overly aggressive copy protection; late in the boot process, there
is code that checksums the ROM and reboots if it's not recognized. The games
themselves would work fine if they were allowed to boot past this ROM check.

Other games fail on an enhanced Apple //e, due to subtle differences between
6502 and 65c02 processors. Still others fail on an Apple //c or IIgs, due to
changes in the boot PROM code. ProDOS fails to boot on clones like Franklin and
Pravetz. Then there are some _very_ early games that require a 13-sector drive.

Anti-M uses a modified boot PROM that can boot any disk, then controls the
game's bootloader long enough to bypass the ROM check and patch any 6502-
specific opcodes. The result: you can boot any Apple II disk on any Apple II.

## How do I use it?

Boot the Anti-M disk. When it prompts you to insert your original disk, do so,
then press `<RETURN>`. The game should boot normally.

## Which games are supported?

- Beer Run (Sirius)
- Bug Attack (Cavalier)
- Choplifter (Broderbund) (*)
- Computer Foosball (Sirius)
- David's Midnight Magic (Broderbund) (*)
- Dueling Digits (Broderbund)
- Eggs-It (Gebelli)
- Frogger (On-Line Systems) (*)
- Gamma Goblins (Sirius)
- Genetic Drift (Broderbund)
- Hard Hat Mack (Electronic Arts) (*)
- High Orbit (Gebelli)
- Horizon V (Gebelli)
- Jawbreaker ][ (On-Line Systems)
- Juggler (IDSI)
- Labyrinth (Broderbund)
- Lady Tut (Progame)
- Lazer Silk (Gebelli)
- Lunar Leepers (On-Line Systems)
- Neptune (Gebelli)
- Orbitron (Sirius)
- Pest Patrol (On-Line Systems)
- Phaser Fire (Gebelli)
- Quadrant 6112 (Sensible Software)
- Red Alert (Broderbund)
- Russki Duck (Gebelli)
- Seafox (Broderbund)
- Serpentine (Broderbund) (*)
- Sky Blazer (Broderbund)
- Space Eggs (Sirius)
- Space Quarks (Broderbund)
- Star Blazer (Broderbund)
- Star Thief (Cavalier)
- Trick Shot (IDSI)
- Zenith (Gebelli)
- all 13-sector disks (e.g. Epyx, Edu-Ware, many others)
- all ProDOS disks

(*) later re-released with different copy protection. Only the first release
requires Anti-M.

## Does Anti-M patch my original disk?

No! All patches are done in memory only. If you reboot your original disk
(without running Anti-M), it will fail as usual, because the ROM check or other
incompatible code is still there.

## Can I use Anti-M from a hard drive?

Yes! Copy the `ANTI.M.SYSTEM` file to anywhere on your ProDOS hard drive and
run it with your favorite launcher. Bonus feature: when launching Anti-M from
a hard drive, it will skip the prompt and immediately boot slot 6, drive 1.

## But wait, there's more!

Anti-M can also boot many games from drive 2, including all the games listed
above. If you launch Anti-M from slot 6 and it detects a disk in drive 2, it
will skip the prompt and immediately boot from drive 2. Otherwise, you can
press `2` at the prompt to boot from drive 2 instead of drive 1.

To disable auto-boot and show the prompt, even if Anti-M would normally skip
it, you can press either joystick button (open-apple or closed-apple key) while
launching Anti-M.

## History

v1.6 - 2019-11-09

- support Personal Software 13-sector disks ("MicroChess 2.0," "Checker King,"
  "Gammon Gambler")

v1.5 - 2019-06-11

- support "Lady Tut"

v1.4 - 2019-05-24

- support "Computer Foosball"
- fix a crash when booting early Spinnaker Software disks (e.g. "Alphabet Zoo,"
  "In Search of The Most Amazing Thing")
- fix booting ProDOS disks from drive 2

v1.3 - 2019-04-12

- support booting from drive 2
- fix booting on MAME

v1.2 - 2019-03-24

- support booting ProDOS on clones
- additional patches for "Star Thief"
- launch Anti-M program faster

v1.1 - 2019-03-16

- support booting 13-sector disks
- support booting disks on Apple //c and IIgs which would otherwise time out
  looking for a boot sector (SpiraDisc, some early EA games)
- bypass a peripheral scan in some games that would hang on some peripherals
  and crash others and require a hardware power cycle in order to reboot
  properly (SpiraDisc)
- support multiple versions of "David's Midnight Magic"
- remove "unsupported game" error, always continue booting
- bypass prompt if launched from hard drive (press the open- or closed-apple
  key on startup to show the prompt)
- minimum requirements lowered to 48K Apple ][ (still useful for booting
  13-sector disks)

v1.0 - 2019-03-11

- initial release
