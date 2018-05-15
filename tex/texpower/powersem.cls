%-----------------------------------------------------------------------------------------------------------------
% File: powersem.cls
%
% Make seminar ready for the Third Millennium ;-)
% This class loads seminar and tries to fix some problems which occur when trying to create dynamic presentations with
% the texpower package. 
%
% Some new features helpful for dynamic presentations are also added.
%
% This class is part of the TeXPower bundle, to be found at
% 
% http://ls1-www.cs.uni-dortmund.de/~lehmke/texpower/
%
% The TeXPower bundle also contains a package fixseminar.sty which applies some more fixes, in particular for
% hyperref. These can not be applied here because they have to be made after hyperref is loaded.
% 
%-----------------------------------------------------------------------------------------------------------------
% Autor: Stephan Lehmke <Stephan.Lehmke@cs.uni-dortmund.de>
%
% v0.1 Oct 18, 1999 First version. So far it doesn't do much more than load seminar.
%
% v0.2 Mar 28, 2000 Force seminar to treat \paperwidth and \paperheight in a sensible manner.
%
% v0.3 May 10, 2000 Added option `calcdimensions'.
%
% v0.4 Jun 16, 2000 Now separates text from footnotes when option `display' is given.
%
% v0.5 Jun 26, 2000 \@colht is ignored by seminar, which is bad. Added a patch to \set@slidesize.
%                   calcdimensions now handles slide frames.
%
% v0.5a Jul 03, 2000 The footnote patch with option display effectively disabled setting \centerslidestrue. Fixed.
%

\def\fileversion{0.5a}
\def\filedate{2000/07/03}

\NeedsTeXFormat{LaTeX2e}

\ProvidesClass%
{powersem}%
[\filedate\space Create online Presentations with seminar. v\fileversion]

%--------------------------------------------------------------------------------------------------------------

\RequirePackage{ifthen}

%--------------------------------------------------------------------------------------------------------------
% The display option is understood by all relevant classes and packages from the TeXPower bundle. It means that
% `dynamic' features are to be turned on.
% There is a boolean register display (as defined in ifthen.sty) which is set by this option and can be used to
% differentiate between slides for display and slides for printout.
% Notes are disabled automatically.

\newboolean{display}
\DeclareOption{display}{\setboolean{display}{true}\PassOptionsToClass{slidesonly}{seminar}}


%--------------------------------------------------------------------------------------------------------------
% The KOMA option tells powersem to load scrartcl (from the KOMA suite of document classes) instead of article.

\newboolean{KOMA@PS}
\DeclareOption{KOMA}{\setboolean{KOMA@PS}{true}}


%--------------------------------------------------------------------------------------------------------------
% We need to redefine the a4paper option which is broken in seminar.cls

\DeclareOption{a4paper}{\PassOptionsToClass{a4}{seminar}}

%--------------------------------------------------------------------------------------------------------------
% The calcdimensions option tells powersem to automatically calculate slidewidth and slideheight from paper dimensions
% and margins.

\newboolean{calcdim@PS}
\DeclareOption{calcdimensions}{\setboolean{calcdim@PS}{true}}


%--------------------------------------------------------------------------------------------------------------

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{seminar}}

\ProcessOptions


%--------------------------------------------------------------------------------------------------------------
% Now we need to hack a little to make seminar load scrartcl instead of article (if the option KOMA was given).

\ifthenelse{\boolean{KOMA@PS}}
{%
  \def\article@PS{article}

% Make \PassOptionsToClass and \LoadClass use scrartcl...

  \let\oldPOTC@PS=\PassOptionsToClass
  \def\PassOptionsToClass#1#2{\edef\cls@PS{#2}\ifx\article@PS\cls@PS\oldPOTC@PS{#1}{scrartcl}\else\oldPOTC@PS{#1}{#2}\fi}
 } 
{}

% Furthermore, seminar redefines \paperheight and \paperwidth, saving their value in \sem@paperheight and
% \sem@paperwidth. We undo this so the paper dimension calculation of typearea can be used.

\let\oldLC@PS=\LoadClass
\renewcommand{\LoadClass}[2][]%
{%
  \edef\cls@PS{#2}%
  \ifx\article@PS\cls@PS
    \let\paperheight\sem@paperheight\let\paperwidth\sem@paperwidth
    \ifthenelse{\boolean{KOMA@PS}}{\oldLC@PS[#1]{scrartcl}}{\oldLC@PS[#2]{article}}
    \portraittrue
   \else
    \oldLC@PS{#2}%
  \fi
  }%


%--------------------------------------------------------------------------------------------------------------
% Finally, the seminar class and some bug fixes are loaded.

\LoadClass{seminar}

\input{seminar.bug}
\input{seminar.bg2}

\expandafter\def\expandafter\set@slidesize\expandafter
{\set@slidesize\@colht\vsize}


%--------------------------------------------------------------------------------------------------------------
% When producing slides to be displayed interactively, we must make absolutely sure that interactive building of slides
% doesn't move text which has already been set. So slides are not to be centered. 

\ifthenelse{\boolean{display}}
{%
  \centerslidesfalse
  \def\@makeslide{%
    \ifcenterslides
      \setbox\@slidebox\vbox{%
        \@begindvi % added 1997/04/15 SPQR
        \unvbox\@cclv
        \ifvoid\slide@footins\else
          \vskip\skip\slide@footins
          \footnoterule
          \unvbox\slide@footins
        \fi
        \vskip\z@}
     \else
      \setbox\@slidebox\vbox to \slide@vsize{%
        \@begindvi % added 1997/04/15 SPQR
        \unvbox\@cclv
        \ifvoid\slide@footins\else
          \vfil\vskip\skip\slide@footins
          \footnoterule
          \unvbox\slide@footins
        \fi
        \vskip\z@}%
    \fi
    }%
  }
{}

%--------------------------------------------------------------------------------------------------------------
% If powersem is asked to calculate the slide dimensions...

\def\relax@PS{\relax}

\ifthenelse{\boolean{calcdim@PS}}
{%
  \AtBeginDocument
  {%
    \setlength{\slidewidth}{\paperwidth}%
    \advance\slidewidth by -\slideleftmargin\relax
    \advance\slidewidth by -\sliderightmargin\relax
    \ifx\theslideframe\relax@PS
     \else
      \advance\slidewidth by -2\slideframewidth\relax
      \advance\slidewidth by -2\slideframesep\relax
    \fi
    \setlength{\slideheight}{\paperheight}%
    \advance\slideheight by -\slidetopmargin\relax
    \advance\slideheight by -\slidebottommargin\relax
    \ifx\theslideframe\relax@PS
     \else
      \advance\slideheight by -2\slideframewidth\relax
      \advance\slideheight by -2\slideframesep\relax
    \fi
    }%
  }
{}


% Local Variables: 
% fill-column: 120
% TeX-master: t
% End: 


%%
%% End of file `powersem.cls'.
