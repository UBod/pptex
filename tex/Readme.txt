========================================================

   PPTeX Installation Instructions and Release Notes
   Version: 0.7 (2024/02/16)
   Author: Ulrich Bodenhofer (ulrich@bodenhofer.com)

========================================================


The ZIP file PPTeX-0.7-packages.zip includes the following:

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
version of TeXPower were not successful. The user is advised, therefore,
not to have any other version of TeXPower on his/her system except
Version 0.0.8f which is enclosed in the ZIP file pptex.zip.

More recent versions of LaTeX are no longer compatible with all packages
PPTeX depends on. This issue is currently unsolved. However, there is a
workaround. By including the following line as first line of the LaTeX
source document (even before \documentclass{}), the issue should be solved:

   \RequirePackage[2020-02-02]{latexrelease}

Credits:
========

Thanks to Peter Haslinger for providing a preliminary version of the
new SCCH layout.


Installing the files:
=====================

Unzip PPTeX-0.7-packages.zip and copy all the subfolders into a
folder where LaTeX searches for files by default (some texmf or
localtexmf directory).

Depending on the TeX distribution you use, it might be necessary to
refresh the filename database. If you use MikTeX, follow the following
steps:

1) Open the "MikTeX Settings" (2.5 or later) or "MikTeX options" (pre-2.5) dialog
2) Go to tab "General"
4) Press "Refresh FNDB"

If you want to use the new SCCH layout, you need to have the Verdana
TrueType font accessible to PDFLaTeX. See manual for instructions.


Testing the installation:
=========================

Your installation works if you can process one of the PPTeX demos
included in the ZIP file PPTeX-0.7-doc.zip in the doc\examples\pptex
subfolder.


Modification track:
===================

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
