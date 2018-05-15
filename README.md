# PPTeX - Yet Another LaTeX Package for Slide Presentations

In 2000, the author developed a LaTeX document class for his former employer,
[Software Competence Center Hagenber](http://www.scch.at/), with the aim to emulate the corporate
design of this institution's PowerPoint template. The given package pptex.cls is a new version
and generalization of this package (that was called scch-slides.cls then). The main difference
between the former class scch-slides.cls and pptex.cls is that different layouts, including
the SCCH layout, are possible. The set of available layouts is extensible. Moreover, pptex.cls
now supports a 4:3 page/slide format of 10×7.5in by default (the same as MS PowerPoint),
whereas scch-slides.cls was only able to use A4 format.

The basic philosophy of PPTeX is borrowed from MS PowerPoint (and this is also where the name
stems from), i.e. to provide the user a drawing canvas where content can be placed in boxes
at more or less arbitrary positions (but with some pre-defined layout of course). That is also
the main point in which PPTeX differs from the other LaTeX classes for producing slide presentations
like [prosper](http://prosper.sourceforge.net/), [Beamer](http://latex-beamer.sourceforge.net/),
[TeXpower](http://texpower.sourceforge.net/), etc. PPTeX uses Version 0.0.8f of Stephan Lehmke's
[TeXpower](http://texpower.sourceforge.net/) package for animations.

## License issues

All files included in this distribution that were written by Ulrich
Bodenhofer are completely free. They may be downloaded, used, copied,
distributed, modified, without any restrictions and without the prior
acceptance of the author.

However, for installation convenience, this distribution also contains material from other
authors, in particular, Version 0.0.8f of Stephan Lehmke's
[TeXpower](http://texpower.sourceforge.net/) package. For these files, license restrictions
may apply. Please check the headers of these files for further information.

## Compatibility issues

PPTeX has been developed using Version 0.0.8f of Stephan Lehmke's
[TeXpower](http://texpower.sourceforge.net/) package. Attempts to port PPTeX to a more recent
version of [TeXpower](http://texpower.sourceforge.net/) were not successful. The user is advised,
therefore, not to have any other version of [TeXpower](http://texpower.sourceforge.net/)
on his/her system except Version 0.0.8f which is enclosed in this distribution.

## Installation

* Download and unzip the latest version of PPTeX-X.X-packages.zip from the tex/ directory.
* Copy all the subfolders into a folder where LaTeX searches for files by default (some texmf or
  localtexmf directory).
* Depending on your TeX/LaTeX system, you probably have to update your filename database.

Your installation was most probably successful if you can process one of the demos included
in the doc/examples/pptex subfolder. If you intend to use the SCCH layout, you have to make sure
that the Verdana TrueType font is available to TeX. If you intend to use the new JKU layout, you
have to make sure that the ArialBlack TrueType font is available to TeX. For detailed instructions
how to make these fonts available to LaTeX, see the appendix of the PPTeX user manual (see docs/manual/PPTeX).