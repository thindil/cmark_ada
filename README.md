At this moment, a very thin Ada binding for the CommonMark parsing and
rendering library: https://github.com/commonmark/cmark

## Usage

### As library

#### Build from sources

To build you need:

* compiler - GCC with enabled Ada support or (best option) GNAT from:

  https://www.adacore.com/download/

* gprbuild - it is included in GNAT and should be available in most Linux
  distributions too.

Navigate to the main directory(where this file is) to compile:

* Easiest way to compile game is use Gnat Programming Studio included in GNAT.
  Just run GPS, select *cmark_ada.gpr* as a project file and select option
  `Build All`.

* If you prefer using console: in main source code directory type `gprbuild`
  for debug mode build or for release mode: `gprbuild -XMode=release`. If you
  want to build dynamic library, add option `-XType=dynamic`. Possible types
  of library are: static (default), dynamic (relocatable), static-pic.

#### Install

To install library, use `gprinstall` command with parameters `-XMode` and
`-XType` that same what was used during compilation. For default compilation
(static, debug) it will be `gprinstall -P cmark_ada.gpr -p`.

#### Usage in projects

At beginning of your project file (*.gpr*) add line:

`with "cmark_ada";`

#### Uninstalling

To uninstall library, use command `gprinstall` with parameters `-XMode` and
`-XType` that same what was used during compilation and parameter
`--uninstall`. For default compilation it will be
`gprinstall -P cmark_ada.gpr --uninstall`

### As code

Just add files in `src` directory to your code.

That's probably all for now, if you find any bug, have question or
proposition, feel free to open issue.

Bartek thindil Jasicki
