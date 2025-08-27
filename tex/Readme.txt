========================================================

   PPTeX Installation Instructions and Release Notes
   Version: 0.8 (2025/08/27)
   Author: Ulrich Bodenhofer (ulrich@bodenhofer.com)

========================================================


The ZIP file PPTeX-0.8-packages.zip includes the following:

1. pptex.cls
2. Pre-defined layouts:
   - JKU (new 2015 CD)
   - Previous, mainly deprecated, layouts scch, scchold,
     jkuold, bioinf, uda, udaold that may serve as examples and
     templates for defining new layouts
3. font definition files t1tarb.fd and t1tvrd.fd (font definitions
   for Arial Black and Verdana as used by JKU and SCCH layouts)
4. Documentation and examples


License issues:
===============

All files included in this distribution that were written by Ulrich
Bodenhofer are completely free. They may be downloaded, used, copied,
distributed, modified, without any restrictions and without the prior
acceptance of the author.

However, this distribution also contains material from other authors,
in particular, version 0.0.8f of Stephan Lehmke's TeXPower package.
For these files, license restrictions may apply. Please check the
headers of these files for further information.


Compatibility issues:
=====================

PPTex has been developed using Version 0.0.8f of Stephan Lehmke's
TeXPower package. Recent attempts to port PPTeX to the recent 0.2
version of TeXPower were not successful (it generally works, but annoying
blank pages may be inserted between animated pages). The user is advised,
therefore, not to have any other version of TeXPower on his/her system except
Version 0.0.8f which is enclosed in this very ZIP file or at least
to make sure that the files in the enclosed texpower/ folder have priority
over any other installation of TeXPower on his/her system.

Previously, it was recommended to use the following in order to avoid
troubles on newer LaTeX systems:

   \RequirePackage[2020-02-02]{latexrelease}

This is no longer necessary and may lead to errors. Instead, make sure
the the packages that TeXPower depends on are installed and up-to-date:

   seminar
   koma-script
   soul

Older versions of these packages have previously been included in the
PPTeX release, but have been removed with version 0.8.


Credits:
========

Thanks to Peter Haslinger for providing a preliminary version of the
new SCCH layout.


Installing the files:
=====================

Unzip PPTeX-0.8-packages.zip and copy all the subfolders into a
folder where LaTeX searches for files by default (some texmf or
localtexmf directory).

Depending on the TeX distribution you use, it might be necessary to
refresh the filename database.

If you want to use the new SCCH layout, you need to have the Verdana
TrueType font accessible to PDFLaTeX. See manual for instructions.


Testing the installation:
=========================

Your installation works if you can process one of the PPTeX demos
included in the ZIP file PPTeX-0.8-doc.zip in the doc\examples\pptex
subfolder.


Modification track:
===================

2025-08-27: Release 0.8: some fixes to make PPTeX compatible with the latest
            LaTeX release
2024-02-16: Release 0.7 with additional layouts: FH OOe, HTL Leonding,
            and UB (author)
2016-02-29: Release 0.6 with new JKU layout and further
            minor adaptations
2007-08-10: Release 0.5 with new SCCH layout(s) and further
            minor adaptations
2007-07-12: Release 0.4 with slightly adapted BioInf layout
2006-10-31: Release 0.3 with new BioInf logo
2006-09-08: Release 0.2 with new UDA layout
2006-08-02: First official release 0.1
2006-06-26: Pre-release


Please report bugs to ulrich@bodenhofer.com
