%
%
% document class for slide presentations
%
% last revision 2006-08-09 by Ulrich Bodenhofer
%
%
\NeedsTeXFormat{LaTeX2e}[1995/12/01]

\ProvidesClass{pptex}[2007/06/16]

\ifx\pdfoutput\undefined
\ClassError{pptex}{This document class only works with
PDFLaTeX}{Process this document with PDFLaTeX}
\else
\relax
\fi

\PassOptionsToPackage{whitebackground}{texpower}
\PassOptionsToClass{landscape}{article}
%
% custom options
%
\newif\ifstartblank
\startblankfalse

\newif\ifoldpptex
\oldpptexfalse

\newif\iffullscreen
\fullscreentrue

\DeclareOption{display}{\PassOptionsToPackage{display}{texpower}\fullscreentrue}
\DeclareOption{printout}{\PassOptionsToPackage{printout}{texpower}\fullscreenfalse}
\DeclareOption{startblank}{\startblanktrue}
\DeclareOption{a4paper}{\oldpptextrue}
\DeclareOption{endblank}{\AtEndDocument{\begin{slide}
\blackslide\end{slide}}}

%
% load driver and suppress all other options
%
\newif\ifdriverdeclared
\driverdeclaredfalse

\newif\ifoldpptex
\oldpptexfalse

\DeclareOption*{\ifdriverdeclared
\ClassError{pptex}{You have already loaded driver '\PPTeX@drivername'. Only one driver can be loaded.}{Remove the '\CurrentOption' option}
\else
\ifoldpptex
\IfFileExists{\CurrentOption.drvo}{%
\let\PPTeX@drivername=\CurrentOption%
\typeout{===================================================}%
\typeout{Driver selected: '\PPTeX@drivername'}%
\typeout{===================================================}\driverdeclaredtrue}%
{\ClassError{pptex}{The driver file \PPTeX@drivername.drvo does not exist or could not be found.}{Choose a different driver.}}
\else
\IfFileExists{\CurrentOption.drv}{%
\let\PPTeX@drivername=\CurrentOption%
\typeout{===================================================}%
\typeout{Driver selected: '\PPTeX@drivername'}%
\typeout{===================================================}\driverdeclaredtrue}%
{\ClassError{pptex}{The driver file \PPTeX@drivername.drv does not exist or could not be found.}{Choose a different driver.}}
\fi
\fi}

%
% process options
%
\ProcessOptions\relax

\ifdriverdeclared
\relax
\else
\ClassError{pptex}{No driver was loaded, exiting}{Choose a valid driver}
\bye
\fi

%
% load class powersem
%
\LoadClass[a4paper,KOMA,smallheadings,calcdimensions,display]{powersem}

%
% load various packages
%
\usepackage{url}

\usepackage[latin1]{inputenc}

\usepackage[T1]{fontenc}

\usepackage{fixseminar}

\usepackage{texpower}

\usepackage{soul}

\usepackage{hyperref}

%
% page settings
%
\slideframe{none}
\pagestyle{empty}

\ifoldpptex
\setlength{\slidewidth}{29.7cm}
\setlength{\slideheight}{21cm}
\setlength{\paperwidth}{29.7cm}
\setlength{\paperheight}{21cm}
\setlength{\pdfpagewidth}{29.7cm}
\setlength{\pdfpageheight}{21cm}
\def\PPTEX@WIDTH{29.7}
\def\PPTEX@HEIGHT{21}
\slidesmag{5}
\else
\setlength{\slidewidth}{25.4cm}
\setlength{\slideheight}{19.05cm}
\setlength{\paperwidth}{25.4cm}
\setlength{\paperheight}{19.05cm}
\setlength{\pdfpagewidth}{25.4cm}
\setlength{\pdfpageheight}{19.05cm}
\def\PPTEX@WIDTH{25.4}
\def\PPTEX@HEIGHT{19.05}
\slidesmag{4}
\fi

\usepackage[pdftex]{graphicx}
\DeclareGraphicsExtensions{.png,.pdf,.jpg}

%
% page setup
%
\renewcommand{\slidetopmargin}{-1.12mm}
\renewcommand{\slidebottommargin}{0mm}

\renewcommand{\slideleftmargin}{0mm}
\renewcommand{\sliderightmargin}{0mm}

% One more Text emphasis command...

\let\name=\textsc

%
% start with blank page
%
\ifstartblank
\AtBeginDocument{\begin{slide}
\blackslide\addtocounter{slide}{-1}
\end{slide}}
\else
\relax
\fi

%
% definition of slide environments
%
\def\PPTeX@footline{}
\def\PPTeX@background{}

\newcommand{\setfootline}[1]{\def\PPTeX@footline{#1}}
\newcommand{\setbackground}[1]{\def\PPTeX@background{#1}}

\definecolor{PPTeXBlack}{rgb}{0.0,0.0,0.0}

\newcommand{\black}{\color{PPTeXBlack}}

\newcommand{\blackslide}{%
\setslidelength{\unitlength}{1cm}
\begin{picture}(\PPTEX@WIDTH,\PPTEX@HEIGHT)
\put(0,0){\makebox(0,0)[lb]{\color{black}\rule{\PPTEX@WIDTH\semcm}{\PPTEX@HEIGHT\semcm}}}
\end{picture}}

\newcommand{\clearbox}[3][lt]{%
\put(#2){\makebox(0,0)[#1]{#3}}}

\newcommand{\textbox}[4][lt]{%
\put(#2){\makebox(0,0)[#1]{\begin{minipage}{#3\semcm} #4 \end{minipage}}}}

\newcommand{\itembox}[4][lt]{%
\put(#2){\makebox(0,0)[#1]{\begin{minipage}{#3\semcm}
\begin{itemize}
#4
\end{itemize}
\end{minipage}}}}

\newcommand{\splitbox}[3][t]{%
\ifx#1c
\begin{minipage}{0.47\columnwidth}
#2
\end{minipage}\hfill
\begin{minipage}{0.47\columnwidth}
#3
\end{minipage}
\else
\begin{minipage}[#1]{0.47\columnwidth}
#2
\end{minipage}\hfill
\begin{minipage}[#1]{0.47\columnwidth}
#3
\end{minipage}
\fi}

\newcommand{\enumbox}[4][lt]{%
\put(#2){\makebox(0,0)[#1]{\begin{minipage}{#3\semcm}
\begin{enumerate}
#4
\end{enumerate}
\end{minipage}}}}

%
% load driver
%
\ifoldpptex
\input{\PPTeX@drivername.drvo}
\else
\input{\PPTeX@drivername.drv}
\fi

\def\simpleslide{\csname\PPTeX@drivername slide\endcsname}
\def\titleslide{\csname\PPTeX@drivername titleslide\endcsname}
\def\simpletextslide{\csname\PPTeX@drivername simpletextslide\endcsname}

\expandafter\def\csname\PPTeX@drivername clearbox\endcsname{\clearbox}
\expandafter\def\csname\PPTeX@drivername textbox\endcsname{\textbox}
\expandafter\def\csname\PPTeX@drivername itembox\endcsname{\itembox}
\expandafter\def\csname\PPTeX@drivername enumbox\endcsname{\enumbox}

\endinput
%
% end of pptex.cls
%
