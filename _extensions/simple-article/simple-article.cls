%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Simple Article LaTeX Class
%
% Version 2.2 (15/10/2019)
%
% The following class options are specific to simple-article:
%
%    narrowmargins: use narrow margins; especially usefule for twocolumn articles.
%    normalnumbers: use normal numbers for sectoning (default are roman numbers).
%    lucida:        use Lucida fonts (default are TeX Gyre Pagella/Palatino; requires Lua/XeLaTeX).
%    phfthm:        provide the phfthm theorem and proof environments.
%
% All other options are passed on the base class which is extarticle. Useful
% ones are:
%
%    9pt,hidelinks,twoside,twocolumn
%
% This template is based on work available at http://www.LaTeXTemplates.com.
%
% Author:
% Christian Marquardt (christian@marquardt.sc)
%
% License:
% CC BY-NC-SA 3.0 (http://creativecommons.org/licenses/by-nc-sa/3.0/)
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%----------------------------------------------------------------------------------------
%	CLASS DEFINITION
%----------------------------------------------------------------------------------------

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{simple-article}[2019/10/15 Simple Article LaTeX Class v2.2]

\newif\if@narrowmargins\@narrowmarginsfalse
\DeclareOption{narrowmargins}{\@narrowmarginstrue}

\newif\if@normalnumbers\@normalnumbersfalse
\DeclareOption{normalnumbers}{\@normalnumberstrue}

\newif\if@lucida\@lucidafalse
\DeclareOption{lucida}{\@lucidatrue}

\newif\if@phfthm\@phfthmfalse
\DeclareOption{phfthm}{\@phfthmtrue}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{extarticle}}
\ProcessOptions\relax % Process class options

\LoadClass[a4paper]{extarticle} % Load the primary class with set options

%----------------------------------------------------------------------------------------
%	REQUIRED PACKAGES
%----------------------------------------------------------------------------------------

\usepackage{ifluatex}
\usepackage{ifxetex}

\newif\if@unicode\@unicodefalse
\ifluatex\@unicodetrue\fi
\ifxetex\@unicodetrue\fi

\if@unicode

  %% For LuaLaTeX or XeLaTeX

   %% When using unicode-math, this must come first
   \if@phfthm
      \usepackage{phfthm}
   \fi
   \usepackage{amsmath}
   \usepackage{mathtools}

   \usepackage{fontspec}
   \usepackage[math-style=ISO,bold-style=ISO]{unicode-math}

   \if@lucida
      \defaultfontfeatures{Scale=.92}
      \setmainfont{LucidaBrightOT}
      \setmathfont{LucidaBrightMathOT}
   \else
      \setmainfont{TeX Gyre Pagella}
      \setmathfont{TeX Gyre Pagella Math}
   \fi

\else

  %% For pdfLaTeX:
   \usepackage[slantedGreek]{mathpazo} % Use the Palatino font
   \usepackage[T1]{fontenc} % Use 8-bit encoding that has 256 glyphs

   %% When using unicode-math, this must come first
   \if@phfthm
      \usepackage{phfthm}
   \fi
   \usepackage{amsmath}
   \usepackage{mathtools}

\fi

\linespread{1.05} % Line spacing - Palatino needs more space between lines
\ifluatex\usepackage{luatexbase}\fi % Workaround for https://tex.stackexchange.com/questions/476740/microtype-error-with-lualatex-attempt-to-call-field-warning-a-nil-value
\usepackage{microtype} % Slightly tweak font spacing for aesthetics

\usepackage[UKenglish]{babel} % Language hyphenation and typographical rules
\usepackage[en-GB]{datetime2}
%\DTMlangsetup[en-GB]{ord=raise,monthyearsep={,\space}}
\DTMlangsetup[en-GB]{ord=omit}

%\usepackage[a4paper,hmarginratio=1:1,top=32mm,columnsep=20pt]{geometry} % Document margins
\if@narrowmargins
   \usepackage[a4paper,left=2cm,right=1.5cm,top=2.5cm,bottom=2.5cm]{geometry} % Document margins
\else
   \usepackage[a4paper,left=3cm,right=2cm,top=2.5cm,bottom=2.5cm]{geometry} % Document margins
\fi

\usepackage[hang,small,labelfont=bf,up,textfont=it,up]{caption} % Custom captions under/above floats in tables or figures
\usepackage{booktabs} % Better looking tables

\usepackage{lettrine} % The lettrine is the first enlarged letter at the beginning of the text

\usepackage{enumitem} % Customized lists
\setlist[itemize]{noitemsep} % Make itemize lists more compact

%----------------------------------------------------------------------------------------
%	FURTHER DOCUMENT LAYOUT SPECIFICATIONS
%----------------------------------------------------------------------------------------

\usepackage{abstract} % Allows abstract customization
\renewcommand{\abstractnamefont}{\normalfont\bfseries} % Set the "Abstract" text to bold
\renewcommand{\abstracttextfont}{\normalfont\small\itshape} % Set the abstract itself to small italic text

\usepackage{titlesec} % Allows customization of titles
\if@normalnumbers
   \renewcommand\thesection{\arabic{section}} % Arabic numerals for the sections
   \renewcommand\thesubsection{\arabic{section}.\arabic{subsection}} % Arabic numerals for subsections
\else
   \renewcommand\thesection{\Roman{section}} % Roman numerals for the sections
   \renewcommand\thesubsection{\roman{subsection}} % Roman numerals for subsections
\fi

\renewcommand\appendix{\par
  \setcounter{section}{0}%
  \setcounter{subsection}{0}%
  \if@normalnumbers
     \renewcommand\thesection{\Alph{section}} % Arabic numerals for the sections
     \renewcommand\thesubsection{\Alph{section}.\arabic{subsection}} % Arabic numerals for subsections
  \else
     \renewcommand\thesection{\Alph{section}} % Roman numerals for the sections
     \renewcommand\thesubsection{\roman{subsection}} % Roman numerals for subsections
  \fi
  }

\titleformat{\section}[block]{\large\scshape\centering}{\thesection.}{1em}{} % Change the look of the section titles
\titleformat{\subsection}[block]{\large}{\thesubsection.}{1em}{} % Change the look of the section titles

\usepackage{fancyhdr} % Headers and footers
\pagestyle{fancy} % All pages have headers and footers
\fancyhead{} % Blank out the default header
\fancyfoot{} % Blank out the default footer
\fancyfoot[RO,LE]{\thepage} % Custom footer text

\usepackage{titling} % Customizing the title section

\usepackage[usenames,dvipsnames]{xcolor}
\definecolor{color1}{RGB}{0,0,90} % Color for links and references
\definecolor{color2}{RGB}{0,20,20} % Color for urls

\usepackage{hyperref} % For hyperlinks in the PDF
\hypersetup{hidelinks,colorlinks,breaklinks=true,urlcolor=color2,citecolor=color1,linkcolor=color1,bookmarksopen=false,pdftitle={Title},pdfauthor={Author}}

%----------------------------------------------------------------------------------------
%	TITLE SECTION
%----------------------------------------------------------------------------------------

\setlength{\droptitle}{-4\baselineskip} % Move the title up

\pretitle{\begin{center}\huge\bfseries} % Article title formatting
\posttitle{\end{center}} % Article title closing formatting

%----------------------------------------------------------------------------------------

\endinput
