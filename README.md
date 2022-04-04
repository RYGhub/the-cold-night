# The Cold Night

_Keep the campfire lit to stop something terrible from awakening!_

![A campfire](media/OpenGraph.png)

## Ludum Dare 50: Jam entry

[![Overall: TBD](https://img.shields.io/badge/overall-TBD-lightgrey) 
![Fun: TBD](https://img.shields.io/badge/fun-TBD-lightgrey) 
![Innovation: TBD](https://img.shields.io/badge/innovation-TBD-lightgrey) 
![Theme: TBD](https://img.shields.io/badge/theme-TBD-lightgrey) 
![Graphics: TBD](https://img.shields.io/badge/graphics-TBD-lightgrey) 
![Audio: TBD](https://img.shields.io/badge/audio-TBD-lightgrey) 
![Humor: TBD](https://img.shields.io/badge/humor-TBD-lightgrey)
![Mood: TBD](https://img.shields.io/badge/mood-TBD-lightgrey)](YOUR-GAME-URL-HERE)

## Credits

### Game

- [@Steffo99](https://github.com/Steffo99)
- [@MaximLobovsky](https://github.com/MaximLobovsky)
- [@Cookie-CHR](https://github.com/Cookie-CHR)
- [@xZef23](https://github.com/xZef23)

### Tools

- [Godot Engine `3.4.4`](https://godotengine.org/)
- [Visual Studio Code](https://code.visualstudio.com/)
	- [`geequlim.godot-tools` extension](https://marketplace.visualstudio.com/items?itemName=geequlim.godot-tools)
	- [`ms-vsliveshare.vsliveshare` extension](https://marketplace.visualstudio.com/items?itemName=ms-vsliveshare.vsliveshare)
- [`Steffo99/template-godot-ld50` template](https://github.com/Steffo99/template-godot-ld50)
- [Git](https://git-scm.com/)
	- [Git Large File Storage extension](https://git-lfs.github.com/)
- [GitHub](https://github.com/)
	- [GitHub Actions](https://github.com/features/actions)
		- [`Steffo99/actions-semver` action](https://github.com/Steffo99/actions-semver)
		- [`abarichello/godot-ci` action](https://github.com/marketplace/actions/godot-ci)

### Assets

#### Source Serif Pro

<details>
<summary>
SIL OPEN FONT LICENSE Version 1.1
</summary>

```
Copyright 2014 Adobe Systems Incorporated (http://www.adobe.com/), with Reserved Font Name 'Source'. All Rights Reserved. Source is a trademark of Adobe Systems Incorporated in the United States and/or other countries.

This Font Software is licensed under the SIL Open Font License, Version 1.1.
This license is copied below, and is also available with a FAQ at:
http://scripts.sil.org/OFL


-----------------------------------------------------------
SIL OPEN FONT LICENSE Version 1.1 - 26 February 2007
-----------------------------------------------------------

PREAMBLE
The goals of the Open Font License (OFL) are to stimulate worldwide
development of collaborative font projects, to support the font creation
efforts of academic and linguistic communities, and to provide a free and
open framework in which fonts may be shared and improved in partnership
with others.

The OFL allows the licensed fonts to be used, studied, modified and
redistributed freely as long as they are not sold by themselves. The
fonts, including any derivative works, can be bundled, embedded, 
redistributed and/or sold with any software provided that any reserved
names are not used by derivative works. The fonts and derivatives,
however, cannot be released under any other type of license. The
requirement for fonts to remain under this license does not apply
to any document created using the fonts or their derivatives.

DEFINITIONS
"Font Software" refers to the set of files released by the Copyright
Holder(s) under this license and clearly marked as such. This may
include source files, build scripts and documentation.

"Reserved Font Name" refers to any names specified as such after the
copyright statement(s).

"Original Version" refers to the collection of Font Software components as
distributed by the Copyright Holder(s).

"Modified Version" refers to any derivative made by adding to, deleting,
or substituting -- in part or in whole -- any of the components of the
Original Version, by changing formats or by porting the Font Software to a
new environment.

"Author" refers to any designer, engineer, programmer, technical
writer or other person who contributed to the Font Software.

PERMISSION & CONDITIONS
Permission is hereby granted, free of charge, to any person obtaining
a copy of the Font Software, to use, study, copy, merge, embed, modify,
redistribute, and sell modified and unmodified copies of the Font
Software, subject to the following conditions:

1) Neither the Font Software nor any of its individual components,
in Original or Modified Versions, may be sold by itself.

2) Original or Modified Versions of the Font Software may be bundled,
redistributed and/or sold with any software, provided that each copy
contains the above copyright notice and this license. These can be
included either as stand-alone text files, human-readable headers or
in the appropriate machine-readable metadata fields within text or
binary files as long as those fields can be easily viewed by the user.

3) No Modified Version of the Font Software may use the Reserved Font
Name(s) unless explicit written permission is granted by the corresponding
Copyright Holder. This restriction only applies to the primary font name as
presented to the users.

4) The name(s) of the Copyright Holder(s) or the Author(s) of the Font
Software shall not be used to promote, endorse or advertise any
Modified Version, except to acknowledge the contribution(s) of the
Copyright Holder(s) and the Author(s) or with their explicit written
permission.

5) The Font Software, modified or unmodified, in part or in whole,
must be distributed entirely under this license, and must not be
distributed under any other license. The requirement for fonts to
remain under this license does not apply to any document created
using the Font Software.

TERMINATION
This license becomes null and void if any of the above conditions are
not met.

DISCLAIMER
THE FONT SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO ANY WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT
OF COPYRIGHT, PATENT, TRADEMARK, OR OTHER RIGHT. IN NO EVENT SHALL THE
COPYRIGHT HOLDER BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
INCLUDING ANY GENERAL, SPECIAL, INDIRECT, INCIDENTAL, OR CONSEQUENTIAL
DAMAGES, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
FROM, OUT OF THE USE OR INABILITY TO USE THE FONT SOFTWARE OR FROM
OTHER DEALINGS IN THE FONT SOFTWARE.
```

</details>

## Development

### Large file storage

This repository is configured with the [Git Large File Storage extension](https://git-lfs.github.com/).

#### Cloning

To clone this repository with all LFS files:

1. Ensure Git LFS is installed on your system

1. Clone the repository normally

1. Run:
	```console
	$ git lfs pull
	```

#### Committing

Before you commit a large binary file (such as an image, or an audio file):

1. Ensure the Git LFS hooks are installed:
	```console
	$ git lfs install
	```

1. Ensure the extension of the file you are committing [is tracked](.gitattributes):
	```console
	$ git lfs track "*.ext"
	```

1. Ensure the `.gitattributes` file itself is tracked:
	```console
	$ git add .gitattributes
	```

### Auto-build

To trigger an automatic export of the project:

1. Ensure GitHub Actions are enabled
1. Create a new GitHub Release

To download the resulting builds:

1. Visit the Actions tab
1. Click on the triggered workflow
1. Download the created artifacts from the bottom of the page

> Note that artifacts are visible only if you're logged in to a GitHub account!
