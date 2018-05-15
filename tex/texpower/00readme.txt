======================================================================

			   TeXPower bundle
	   Creating dynamic online presentations with LaTeX

			  pre-alpha version
	    This readme file last changed on Jun 23, 2000

  Author: Stephan Lehmke <mailto:Stephan.Lehmke@cs.uni-dortmund.de>

======================================================================

This bundle contains style and class files I have written for creating
dynamic online presentations with LaTeX. 

I am releasing a pre-alpha version of the code, mainly for getting
feedback on the implementation. 

======================================================================
+++ NEWSFLASH +++ NEWSFLASH +++ NEWSFLASH +++ NEWSFLASH +++ NEWSFLASH  

There is now a mailing list texpower@ls6.cs.uni-dortmund.de. To
subscribe, send an email with SUBJECT "subscribe" to

texpower-request@ls6.cs.uni-dortmund.de

<mailto:texpower-request@ls6.cs.uni-dortmund.de?subject=subscribe>

Until the first alpha release, you are requested to keep all
discussion about TeXPower to this mailing list.

The mailing list is publicly archived at

http://www.mail-archive.com/texpower@ls6.cs.uni-dortmund.de/

+++ NEWSFLASH +++ NEWSFLASH +++ NEWSFLASH +++ NEWSFLASH +++ NEWSFLASH  
======================================================================

======================================================================

Contents:
=========

So far, the bundle contains the following files and directories:


00readme.txt

	This file.


0changes.txt

	Change history.


texpower.sty

	Implements some commands for presentation effects. This
	includes setting page transitions (thanks to Marc van Dongen
	for the code), color highlighting and displaying pages `step
	by step'.

	It can be used as an alternative to PPower4 
	http://www-sp.iti.informatik.tu-darmstadt.de/software/ppower4/
	for those who can't use pdfLaTeX (for instance, because
	they're using PSTricks).

	The code should work with all ways of PDF creation.

	The package is based on Klaus Gunterman's texpause.sty from
	the PPower4 bundle, to whom I'm indepted for allowing me to
	include his code.


tpoptions.cfg
tpsettings.cfg

	Configuration files for texpower.sty.


powersem.cls

	A wrapper for seminar which sets up everything for dynamic
	presentations. For this pre-alpha version, it doesn't do much
	more than load seminar.cls and some bug fixes.

	\documentclass{powersem} should be used as a replacement for
	\documentclass{seminar}. powersem loads seminar and passes all
	options to seminar.


fixseminar.sty

	Unfortunately, there are some fixes to seminar which can not
	be applied in powersem.cls because they have to be applied
	after hyperref is loaded (if this package should be loaded). 

	The package fixseminar applies these fixes, so this package
	should be loaded after hyperref (if hyperref is loaded at all,
	otherwise fixseminar can be loaded anywhere in the preamble). 


doc (directory)

	Contains several tex and pdf files which provide examples and
	(preliminary) documentation for texpower.

	The following files are input by other files. Don't compile
	them:

	__TP.cfg	Configuration file. You can set e.g. the base
			url here.

	__TPpbla.tex	Preamble files.
	__TPpblb.tex
	__TPpble.tex

			Code for examples:

	__TPbckwrd.tex	Backwards
	__TPdiv.tex	Divisibility
	__TPhlit.tex	Highlight
	__TPpic.tex	Picture
	__TPlpic.tex	  LaTeX ~
	__TPppic.tex	  PSTricks ~
	__TPmath.tex	Math
	__TPpar.tex	Paragraph
	__TPtab.tex	Tabular

	__TPdoc.tex	Documentation

	__TPFAQ.tex	FAQ List

	yoda.eps	Pictures to be included by backwards example.
	yoda.pdf

	unihaken-color.pdf	Logo to be included by pdfscreen demo.


	Each of the following files represents one example for TeXPower:

	bckwrdexample.pdf
	bckwrdexample.tex
	divexample.pdf
	divexample.tex
	hilitexample.pdf
	hilitexample.tex
	mathexample.pdf
	mathexample.tex
	parexample.pdf
	parexample.tex
	picexample.pdf
	picexample.tex
	tabexample.pdf
	tabexample.tex


	The following files represent the `full' demo and
	(preliminary) manual for texpower.

	fulldemo.pdf
	fulldemo.tex


	The following files represent only the (preliminary) manual
	for texpower, prepared for printout.

	manual.pdf
	manual.tex


	The following files represent `simple' demos for texpower, in
	connection with different document classes. They are the best
	starting place for your own experiments. You can make your own
	dynamic presentations by modifying one of these demos to your
	convenience.

	foilsdemo.pdf	foils class
	foilsdemo.tex

	pdfscrdemo.pdf	article class with pdfscreen package
	pdfscrdemo.tex

	pdfslidemo.pdf	article class with pdfslide package
	pdfslidemo.tex

	pp4sldemo.pdf	foils class with pp4slide package
	pp4sldemo.tex

	seminardemo.pdf	seminar class
	seminardemo.tex

	simpledemo.pdf	article class
	simpledemo.tex

	slidesdemo.pdf	slides class
	slidesdemo.tex

	ifmslidemo.pdf	powersem class with ifmslide package
	ifmslidemo.tex


	The following files represent the FAQ list for the TeXPower
	bundle. 

	FAQ-printout.pdf	Printout version.
	FAQ-printout.tex

	FAQ-display.pdf		Screen version.
	FAQ-display.tex


	--------------------------------------------------------------
	All the files in this directory are tested with the following
	configurations (with teTeX 1.0 as of mar 2000 + newly
	installed hyperref 6.70a as of mar 2000):

	pdfLaTeX

	LaTeX + dvips (5.86d) + distiller (3.0)
	(pdfscrdemo and pdfslidemo require pdflatex)

	LaTeX + dvips (5.86d) + ps2pdf (GS 6.01) 
	(with config.landscapeplus from the contrib directory;
	pdfscrdemo and pdfslidemo require pdflatex)
	
	It should work with other ways of creating PDF. 

	I'd be interested in other people's experiences as I've no
	access to VTeX, dvipdfm and such.
	--------------------------------------------------------------

	NOTE: When compiling picexample or fulldemo
	with pdflatex, you'll get a different picture example (using
	only LaTeX's picture environment) than when compiling with
	latex (using PSTricks).

	For this pre-alpha release, the recommended way of working
	with texpower is looking at the demos and doing your own thing
	by analogy. simpledemo.tex and relatives are especially
	recommended as a starting point.


texpower-demo-distill.pdf

	Placeholder for the former full demo file. Contains just an
	url pointing to the doc tree.


Makefile

	Doesn't much that is useful to the end user at the
	Moment. 

	make install will try to put texpower where your TeX system
	can find it.


texpower.zip

	A zip archive containing all files and directories mentioned
	above.

texpower-doc.zip

	A zip archive containing the contents of the doc directory.

texpower-src.zip

	A zip archive containing the files mentioned above, apart from
	the contents of the doc directory.


contrib (directory)

	Contains some additions to the TeXPower bundle contributed by
	other people.


	config.landscapeplus
	
	dvips configuration file which provides new paper sizes
	letterl and a4l for landscape documents in the respective
	sizes. Use by passing the option

	-Plandscapeplus

	to dvips (you can have as many -P options as you like).

	Using this will avoid turned and cropped pages with
	ghostscript's ps2pdf.

	Contributed by Berthold Crysmann <crysmann@dfki.de>.


gallery (directory)

	Contains some demos and examples of `real life' presentations
	created with TeXPower by other people.


	DeLegeLata.pdf

	A presentation (in german) created by Heiner Richter
	<heiner.richter@netcologne.de>.


	MPostDemo.pdf

	A demo for incremental MetaPost graphics created by Thorsten
	Ohl <ohl@hep.tu-darmstadt.de>.


	MethodOfLines.pdf

	A presentation created by Wilfrid Pascher
	<Wilfrid.Pascher@FernUni-Hagen.de>.


	Pappus.pdf

	A presentation created by Ross Moore <ross@ics.mq.edu.au>
	where TeXPower and Xy-pic are combined.

	Pappus.zip

	Pappus.pdf zipped together with sources and required logos.


	ShortVectors.pdf

	A presentation created by Friedrich Eisenbrand
	<eisen@mpi-sb.mpg.de>. 


old (directory)

	Contains the zip archives of some former versions of the
	TeXPower bundle.



======================================================================
+++ NEWSFLASH +++ NEWSFLASH +++ NEWSFLASH +++ NEWSFLASH +++ NEWSFLASH  

There is now a mailing list texpower@ls6.cs.uni-dortmund.de. To
subscribe, send an email with SUBJECT "subscribe" to

texpower-request@ls6.cs.uni-dortmund.de

<mailto:texpower-request@ls6.cs.uni-dortmund.de?subject=subscribe>

Until the first alpha release, you are requested to keep all
discussion about TeXPower to this mailing list.

The mailing list is publicly archived at

http://www.mail-archive.com/texpower@ls6.cs.uni-dortmund.de/

+++ NEWSFLASH +++ NEWSFLASH +++ NEWSFLASH +++ NEWSFLASH +++ NEWSFLASH  
======================================================================



======================================================================

Disclaimer:
===========

Beware. This is work in progress. Use only if you know what you're
doing. 
During the subsequent error correction and extension of the
functionality, the syntax and implementation of the macros are liable
to change. 

So far, the files themselves contain only scarce inline documentation,
as the code is too much of a moving target to make rigorous
documentation a sensible endeavour. As soon as this bundle is ready
for beta release, I will make fully documented dtx files.



======================================================================

Known and open problems:
========================

The \stepwise command (which is the main part of texpower.sty so far;
see fulldemo.pdf for some examples and documentation) is
rather fragile and doesn't harmonize with some of the more
sophisticated TeX structures. The following are the main problems
known to me at the moment:

* math formatting.

  a) Everything is done several times. As \stepwise has to do a lot of
     accounting to keep track of what's going on, this can really mess
     things up.

     AMSLaTeX's measuring pass for aligned equations is taken care of
     explicitly, so I expect no problems from this side.

     \mathchoice is another matter. Currently, I'm using a kluge which
     works for the examples in fulldemo.tex, but I expect it to cause
     trouble.
     If there's any expert who could look into the code and suggest
     something better, I'd be forever grateful.

     I don't know if there's anything else which causes things to be
     typeset several times. If there is, it has to be hacked.

  b) To leave the proper amount of blank space, \stepwise currently
     uses \phantom. This can cause problems with math spacing.

     The widths of \phantom{a+}b and a+b are different.

     As a consequence, math spacing often has to be corretced manually
     when `stepping through' formulae.

     Maybe this could be remedied by using colors instead, but that in
     turn wouldn't work with structured backgrounds (or is there a
     color `transparent'?).

     I'd be thankful for hints on alternatives.


* File access, labels and hyperlinks.

  As \stepwise executes everything several times, commands changing
  counters globally or accessing files are a problem. Labels and
  hyperlinks are redefined several times.

  Counters are taken care of by \stepwise. 

  Commands accessing toc files and such (like \section) are taken care
  of by the whatsit suppression mechanism (see below).

  I don't know what can be done about labels and links. They work sort
  of (giving a lot of warnings though), but I'm at a loss as what the
  `correct' behaviour is.


* duplication of specials

  Some drivers, like dvips and textures, use a color stack which is
  controlled by \special items included in the dvi file.  When page
  contents are duplicated, then these specials are also duplicated,
  which can seriously mess up the color stack.  

  texpower implements a `color stack correction' method by maintaining
  a stack of color corrections, which should counteract this effect.  

  Owing to potential performance problems, this method is turned off
  by default. If you should experience strange color switches in your
  document, turn it on with the option fixcolorstack.  

  Expect problems with color stack correction if an automatic page
  break should occur in a `colorful' document, as the driver's color
  stack and texpower' color correction stack are likely to be
  unrelated then. Remedy remaining problems by inserting explicit page
  breaks.


* catcode mongery.

  As the argument of \stepwise is read as a normal macro argument,
  constructs involving catcode changes (like \verb or language
  switches) won't work in the argument of \stepwise.

  Owing to a great suggestion by Ross Moore, I hope to remedy this at
  least to some extent until the alpha release.



======================================================================

Further development:
====================

Until the first alpha release (which should appear Real Soon Now),
I'll try to

* Fix bugs (but I need bug reports).

* Complete the documentation.

* Extend the functionality.

The following are on my agenda at the moment:

* Add support for structured backgrounds.

* Respect catcode changes in the argument of \stepwise.

* Remove remaining quirks and problems in connection with file access,
  labels/hyperlinks and duplication of page contents.

From then until the beta release (which can go on CTAN), I'm planning
to do mainly bug fixes and write the dtx files.


See the file 0changes.txt for recent changes.



======================================================================

License:
========

After beta release, the TeXPower bundle will be placed under the LaTeX
Project Public License (see macros/latex/base/lppl.txt on CTAN).

For the time being, I am interested in restricting redistribution of
the files, to reduce problems with non-backward compatible syntax
changes.

Therefore, for the time being, it is allowed to download the files
from this directory and use them for any purpose whatsoever, as long
as no further copies are made from them.

It is allowed to extract and modify the code contained in the files,
as long as 

a) Proper credit is given.

b) Modified files are not given the filename of the original file.
   This doesn't apply to trivial changes like commenting out (buggy)
   parts of the code, setting switches or tracing commands.
   The files __TPpbl?.tex and *.cfg which are mainly for
   configuration purposes are explicitly released from this
   condition. 

It is strictly forbidden, however, to redistribute the files contained
in this directory in any form whatsoever. Whomever wants to use this
bundle, should download the current version from here.

