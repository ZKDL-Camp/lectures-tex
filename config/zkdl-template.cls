\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{zkdl-template}[2025/09/05 ZKDL Template]

% --- Defining the basic article style ---
\providecommand\mtfntsize{10pt}
\ProcessOptions\relax
\LoadClass[a4paper,\mtfntsize]{extarticle}
\usepackage{titlepic} % For the image on the title page
\AtEndOfClass{\RequirePackage[tracking=smallcaps]{microtype}}

% --- Required packages ---

% --- Fonts and Encoding ---
\RequirePackage[T1]{fontenc}
\RequirePackage[utf8]{inputenc}
\RequirePackage[english]{babel}

% 1. Load the main math/text font package FIRST.
%    This sets the main font to XCharter and configures math to match.
\let\oldttdefault\ttdefault
\RequirePackage{libertine}
\let\ttdefault\oldttdefault

% 2. Load amsmath and amsthm AFTER newtxmath.
\RequirePackage{amsmath,amssymb,amsthm}
\RequirePackage{bm}
\RequirePackage{dsfont}
\RequirePackage[italicdiff]{physics}
\RequirePackage[makeroom]{cancel}
\RequirePackage{extarrows}
\RequirePackage{bbm}
\RequirePackage{stmaryrd} % For fancy double brackets

% --- Layout and Formatting ---
\RequirePackage[
    paperwidth=145mm,
    paperheight=215mm,
    top=5mm,
    bottom=16mm, 
    left=15mm, 
    right=15mm, 
    includehead,
    headheight=5mm,
    headsep=2mm,
    includefoot,
    footskip=8mm
]{geometry}
\RequirePackage{indentfirst}
\RequirePackage{multicol}
\RequirePackage[normalem]{ulem}
\RequirePackage{etoc}
\RequirePackage{framed}
\RequirePackage{blindtext}

% --- Graphics, Figures, and Tables ---
\RequirePackage{graphicx}
\RequirePackage{float}
\RequirePackage{wrapfig}
\RequirePackage[dvipsnames,table]{xcolor}
\RequirePackage{opencolor}
\RequirePackage{tabularx}
\RequirePackage{blkarray}
\RequirePackage{arydshln}
\RequirePackage{makecell}
\RequirePackage{subcaption}
\RequirePackage{titlesec}
\RequirePackage[labelfont=bf]{caption}
\setlength{\belowcaptionskip}{0mm}
\setlength{\textfloatsep}{1mm}
\counterwithin{figure}{section}

% --- Lists, Footnotes, and Utilities ---
\RequirePackage[inline,shortlabels]{enumitem}
\setlist{topsep=2pt,itemsep=2pt,parsep=0pt,partopsep=0pt}
\setlist[enumerate]{label=\textit{(\roman*)}, ref=(\roman*)}
\RequirePackage[bottom,multiple]{footmisc}
\RequirePackage{subfiles}
\RequirePackage{pifont}

% --- Hyperref and Cleverref ---
\RequirePackage{hyperref}
\hypersetup{pdflang=en}

% -- Hyperref coloring --
\definecolor{linkcol}{HTML}{2E7D46} % green — internal links / TOC / theorems
\definecolor{citecol}{HTML}{A6192E} % cherry red — citations
\definecolor{urlcol}{HTML}{1C5F9C}  % blue — URLs

\hypersetup{
    colorlinks=true,
    linkcolor=linkcol,
    citecolor=citecol,
    urlcolor=urlcol,
}

\RequirePackage[nameinlink]{cleveref}

% --- Table of contents must display hidden sections ---
\makeatletter
\let\old@section\section
\RenewDocumentCommand{\section}{s o m}{%
  \IfBooleanTF{#1}{%
    \old@section*{#3}%
    \phantomsection
    \addcontentsline{toc}{section}{#3}%
    \markboth{#3}{#3}% Updates footer mark ONLY for sections
  }{%
    \IfValueTF{#2}{\old@section[#2]{#3}}{\old@section{#3}}%
  }%
}

\let\old@subsection\subsection
\RenewDocumentCommand{\subsection}{s o m}{%
  \IfBooleanTF{#1}{%
    \old@subsection*{#3}%
    \phantomsection
    \addcontentsline{toc}{subsection}{#3}%
  }{%
    \IfValueTF{#2}{\old@subsection[#2]{#3}}{\old@subsection{#3}}%
  }%
}

\let\old@subsubsection\subsubsection
\RenewDocumentCommand{\subsubsection}{s o m}{%
  \IfBooleanTF{#1}{%
    \old@subsubsection*{#3}%
    \phantomsection
    \addcontentsline{toc}{subsubsection}{#3}%
  }{%
    \IfValueTF{#2}{\old@subsubsection[#2]{#3}}{\old@subsubsection{#3}}%
  }%
}
\makeatother

% Ensure the ToC depth includes subsubsections (level 3)
\setcounter{tocdepth}{3}

% --- Tikz settings ---
\RequirePackage {
    tikz,
    tikz-3dplot,
    tikz-cd,
    tkz-tab,
    tkz-euclide,
    pgf,
    pgfplots
}
\usetikzlibrary{positioning,backgrounds,tikzmark}

% --- Matrix magical command (wrapped with makeatletter) ---
\makeatletter
\renewcommand*\env@matrix[1][*\c@MaxMatrixCols c]{%
\hskip -\arraycolsep
\let\@ifnextchar\new@ifnextchar
\array{#1}}
\makeatother

% --- Ticks and crosses ---
\newcommand{\cmark}{\textcolor{green!65!black}{\ding{51}}}%
\newcommand{\xmark}{\textcolor{red!80!black}{\ding{55}}}%

% --- Code Block Settings ---
\RequirePackage{listings}
\definecolor{dkgreen}{rgb}{0,0.5,0}
\definecolor{gray}{rgb}{0.5,0.5,0.5}
\definecolor{mauve}{rgb}{0.58,0,0.82}
\lstset{
    numbers=none,
    aboveskip=3mm,
    belowskip=3mm,
    showstringspaces=false,
    columns=fixed,
    basicstyle={\ttfamily\small},
    numberstyle=\footnotesize\color{gray},
    keywordstyle=\bfseries\color{blue!80!black},
    commentstyle=\color{dkgreen},
    stringstyle=\color{mauve},
    breaklines=true,
    breakatwhitespace=true,
    tabsize=2,
    extendedchars=false,
    postbreak=\mbox{\hspace{-1.4em}\textcolor{purple}{$\hookrightarrow$}\space},
    escapeinside={<@}{@>}
}

% --- Linter settings (Combined for tidiness)---
\RequirePackage{config/listlings/listings-rust}
\RequirePackage{config/listlings/listings-circom}
\RequirePackage{config/listlings/listings-json}
\RequirePackage{config/listlings/listings-ts}

\newcommand{\remind}[1]{\textcolor{red}{\textbf{#1}}} % To remind me of unfinished work to fix later
\newcommand{\hide}[1]{} % To hide large blocks of code without using % symbols

% --- Minted settings ---
\RequirePackage{minted}
% Style for minted
\setminted{
  fontfamily=cmtt,
  frame=lines,      % Adding a frame for style
  fontsize=\footnotesize   % Using a slightly smaller font for code
}
\usemintedstyle{colorful}

% --- Section numbering format: "Section 11: Title" instead of bare "11" ---
% Only \section gets the "Section N:" prefix; \subsection, \subsubsection, etc.
% keep the normal numeric format (e.g. "11.2") via the \@ifundefined fallback.
\makeatletter
\def\@seccntformat#1{%
  \@ifundefined{#1cntformat}
    {\csname the#1\endcsname\quad}%
    {\csname #1cntformat\endcsname}%
}
\newcommand{\sectioncntformat}{{\Huge\thesection}\hspace{5px}\ }
\makeatother

% --- Headers and Footers ---
\RequirePackage{fancyhdr}
\pagestyle{fancy}
\fancyhf{}
\lhead{}
\rhead{}

% Capture the current section (number + title) so it can appear in the footer,
% matching the "Section N: Title" format used in the body headings
\makeatletter
\@ifundefined{sectionmark}
  {\newcommand{\sectionmark}[1]{\markboth{Section~\thesection: #1}{Section~\thesection: #1}}}
  {\renewcommand{\sectionmark}[1]{\markboth{Section~\thesection: #1}{Section~\thesection: #1}}}
\makeatother

% Book-style footer: page number on the outer edge, running section title
% toward the spine, with a thin hairline separating it from the body text
\fancyfoot[L]{%
  \footerfont
  \ifodd\value{page}
    \itshape\nouppercase{\leftmark}%
  \else
    \thepage%
  \fi
}
\fancyfoot[R]{%
  \footerfont
  \ifodd\value{page}
    \thepage%
  \else
    \itshape\nouppercase{\leftmark}%
  \fi
}
\renewcommand{\headrulewidth}{0.0mm}
\renewcommand{\footrulewidth}{0.3pt}

% --- Shortcuts ---

% --- Sample random command ---
\newcommand\leftarrowS{\leftarrow\joinrel\smalldollar}
\newcommand\rightarrowS{\smalldollar\joinrel\rightarrow}

\makeatletter
\newcommand{\smalldollar}{\mathrel{\mathpalette\small@dollar\relax}}
\newcommand{\small@dollar}[2]{%
  \vcenter{\hbox{%
    $#1\textnormal{\fontsize{0.7\dimexpr\f@size pt}{0}\selectfont\$}$%
  }}%
}
\makeatother

\newcommand{\F}{\mathbb{F}}
\newcommand{\ep}{\varepsilon}
\newcommand{\vp}{\varphi}
\newcommand{\lam}{\lambda}
\newcommand{\Lam}{\Lambda}
\renewcommand{\ip}[1]{\ensuremath{\left\langle#1\right\rangle}}
\newcommand{\floor}[1]{\ensuremath{\left\lfloor#1\right\rfloor}}
\newcommand{\ceil}[1]{\ensuremath{\left\lceil#1\right\rceil}}
\newcommand{\limk}{\lim_{k\to\infty}}
\newcommand{\limm}{\lim_{m\to\infty}}
\newcommand{\limn}{\lim_{n\to\infty}}
\newcommand{\limx}[1][a]{\lim_{x\to#1}}
\newcommand{\liminfm}{\liminf_{m\to\infty}}
\newcommand{\limsupm}{\limsup_{m\to\infty}}
\newcommand{\liminfn}{\liminf_{n\to\infty}}
\newcommand{\limsupn}{\limsup_{n\to\infty}}
\newcommand{\sumkn}{\sum_{k=1}^n}
\newcommand{\sumk}[1][1]{\sum_{k=#1}^\infty}
\newcommand{\summ}[1][1]{\sum_{m=#1}^\infty}
\newcommand{\sumn}[1][1]{\sum_{n=#1}^\infty}
\newcommand{\emp}{\varnothing}
\newcommand{\exc}{\backslash}
\newcommand{\sub}{\subseteq}
\newcommand{\sups}{\supseteq}
\newcommand{\capp}{\bigcap}
\newcommand{\cupp}{\bigcup}
\newcommand{\kupp}{\bigsqcup}
\newcommand{\cappkn}{\bigcap_{k=1}^n}
\newcommand{\cuppkn}{\bigcup_{k=1}^n}
\newcommand{\kuppkn}{\bigsqcup_{k=1}^n}
\newcommand{\cappk}[1][1]{\bigcap_{k=#1}^\infty}
\newcommand{\cuppk}[1][1]{\bigcup_{k=#1}^\infty}
\newcommand{\cappm}[1][1]{\bigcap_{m=#1}^\infty}
\newcommand{\cuppm}[1][1]{\bigcup_{m=#1}^\infty}
\newcommand{\cappn}[1][1]{\bigcap_{n=#1}^\infty}
\newcommand{\cuppn}[1][1]{\bigcup_{n=#1}^\infty}
\newcommand{\kuppk}[1][1]{\bigsqcup_{k=#1}^\infty}
\newcommand{\kuppm}[1][1]{\bigsqcup_{m=#1}^\infty}
\newcommand{\kuppn}[1][1]{\bigsqcup_{n=#1}^\infty}
\newcommand{\cappa}{\bigcap_{\alpha\in I}}
\newcommand{\cuppa}{\bigcup_{\alpha\in I}}
\newcommand{\kuppa}{\bigsqcup_{\alpha\in I}}
\newcommand{\Rx}{\overline{\mathbb{R}}}
\newcommand{\dx}{\,dx}
\newcommand{\dy}{\,dy}
\newcommand{\dt}{\,dt}
\newcommand{\lcm}{\text{lcm}}
\newcommand{\dax}{\,d\alpha(x)}
\newcommand{\dbx}{\,d\beta(x)}
\DeclareMathOperator{\glb}{\text{glb}}
\DeclareMathOperator{\lub}{\text{lub}}
\newcommand{\xh}{\widehat{x}}
\newcommand{\yh}{\widehat{y}}
\newcommand{\zh}{\widehat{z}}
\newcommand{\<}{\langle}
\renewcommand{\>}{\rangle}
\renewcommand{\iff}{\Leftrightarrow}
\renewcommand{\gcd}{\text{gcd}}
\DeclareMathOperator{\im}{\text{im}}
\let\spn\relax\let\Re\relax\let\Im\relax
\DeclareMathOperator{\spn}{\text{span}}
\DeclareMathOperator{\Re}{\text{Re}}
\DeclareMathOperator{\Im}{\text{Im}}
\DeclareMathOperator{\diag}{\text{diag}}

\newcommand{\Circ}{\textit{\texttt{C}}}

% --- Theorem environments ---

% Filled box (colored background)
% --- Box styles using tcolorbox ---
\RequirePackage{etoolbox}
\RequirePackage[most]{tcolorbox}
\RequirePackage{fontawesome5} % For nice icons

\newcommand{\niceboxfilled}[3]{% #1 env, #2 back color, #3 border color
  \tcolorboxenvironment{#1}{%
    breakable, boxrule=0pt, boxsep=0pt,
    colback={#2}, left=8pt, right=8pt,
    enhanced jigsaw, borderline west={2.5pt}{0pt}{#3},
    sharp corners, before skip=10pt, after skip=10pt,
    drop fuzzy shadow={black!15}%
  }%
}

% Plain box (border only, no fill)
\newcommand{\niceboxplain}[2]{% #1 env, #2 border color
  \tcolorboxenvironment{#1}{%
    breakable, boxrule=0pt, boxsep=0pt, blanker,
    borderline west={2.5pt}{0pt}{#2}, left=8pt, right=8pt,
    sharp corners, before skip=10pt, after skip=10pt%
  }%
}

\newtheoremstyle{mystyle}{}{}{}{}{\bfseries}{.}{ }{}
\newtheoremstyle{cstyle}{}{}{}{}{\bfseries}{.}{ }{\thmnote{#3}}
\makeatletter
\renewenvironment{proof}[1][\proofname] {\par\pushQED{\qed}{\normalfont\bfseries\topsep6\p@\@plus6\p@\relax #1\@addpunct{.} }}{\popQED\endtrivlist\@endpefalse}
\makeatother

\theoremstyle{mystyle}
\newtheorem{definition}{Definition}[section]
\newtheorem{proposition}{Proposition}[section]
\newtheorem{theorem}{Theorem}[section]
\newtheorem{lemma}{Lemma}[section]
\newtheorem{corollary}{Corollary}[section]

% Environments with inline icons embedded in their title
\newtheorem*{remark}{{\small\textcolor{oc-green-7}{\faCommentDots}}\ Remark}
\newtheorem*{remarks}{{\small\textcolor{oc-green-7}{\faCommentDots}}\ Remarks}
\newtheorem{example}{Example}[section]
\newtheorem{examples}{Examples}[section]

\newtheorem{intuition}{{\small\textcolor{oc-yellow-7}{\faLightbulb}}\ Intuition}[section]
\newtheorem{intuitions}{{\small\textcolor{oc-yellow-7}{\faLightbulb}}\ Intuitions}[section]

% For a range of exercises
\newenvironment{exbox}[1]{%
  \par\noindent{\bfseries{\small\textcolor{oc-pink-7}{\faPencil*}}\ #1}\par\nobreak\smallskip\noindent\ignorespaces
}{\par}

\theoremstyle{definition}
\newtheorem*{exercise}{{\small\textcolor{oc-pink-7}{\faPencil*}}\ Exercise}

\theoremstyle{cstyle}
\newtheorem*{cthm}{}

% --- Map shared counter environments to their proper cleveref types ---
\crefname{definition}{definition}{definitions}
\Crefname{definition}{Definition}{Definitions}
\crefname{theorem}{theorem}{theorems}
\Crefname{theorem}{Theorem}{Theorems}
\crefname{lemma}{lemma}{lemmas}
\Crefname{lemma}{Lemma}{Lemmas}
\crefname{corollary}{corollary}{corollaries}
\Crefname{corollary}{Corollary}{Corollaries}
\crefname{proposition}{proposition}{propositions}
\Crefname{proposition}{Proposition}{Propositions}
\crefalias{example}{example}
\crefalias{examples}{example}
\crefname{intuition}{intuition}{intuitions}
\Crefname{intuition}{Intuition}{Intuitions}

% Load custom environment 
\input{config/x-environments.cls}

% --Warning environment--
\newtheoremstyle{warn}{}{}{}{}{\normalfont}{}{ }{}
\theoremstyle{warn}
\newtheorem*{warning}{\warningsign{0.2}\relax}

% Symbol for the warning environment
\newcommand{\warningsign}[1]{\tikz[scale=#1,every node/.style={transform shape}]{\draw[-,line width={#1*0.8mm},red,fill=yellow,rounded corners={#1*2.5mm}] (0,0)--(1,{-sqrt(3)})--(-1,{-sqrt(3)})--cycle;
\node at (0,-1) {\fontsize{48}{60}\selectfont\bfseries!};}}

% Filling boxes for theorems/lemmas
\niceboxfilled{definition}{oc-indigo-1}{oc-indigo-7}
\niceboxfilled{theorem}{oc-indigo-1}{oc-indigo-7}
\niceboxfilled{proposition}{oc-orange-1}{oc-orange-7}
\niceboxfilled{lemma}{oc-blue-1}{oc-blue-7}
\niceboxfilled{corollary}{oc-violet-1}{oc-violet-7}
\niceboxfilled{cthm}{oc-gray-1}{oc-gray-7}
\niceboxfilled{example}{oc-gray-1}{oc-gray-7}

\niceboxplain{examples}{Black}
\niceboxplain{remark}{oc-green-7}
\niceboxplain{remarks}{oc-green-7}
\niceboxplain{exercise}{oc-pink-7}
\niceboxplain{exbox}{oc-pink-7}
\niceboxplain{intuition}{oc-yellow-7}

% \tcolorboxenvironment{definition}{   breakable, boxrule=0pt, boxsep=0pt, colback={oc-indigo-1},left=8pt,right=8pt,enhanced jigsaw, borderline west={2pt}{0pt}{oc-indigo-7},sharp corners,before skip=10pt,after skip=10pt}
% \tcolorboxenvironment{proposition}{  breakable, boxrule=0pt, boxsep=0pt, colback={oc-orange-1},left=8pt,right=8pt,enhanced jigsaw, borderline west={2pt}{0pt}{oc-orange-7},sharp corners,before skip=10pt,after skip=10pt}
% \tcolorboxenvironment{theorem}{      breakable, boxrule=0pt, boxsep=0pt, colback={oc-indigo-1},left=8pt,right=8pt,enhanced jigsaw, borderline west={2pt}{0pt}{oc-indigo-7},sharp corners,before skip=10pt,after skip=10pt}
% \tcolorboxenvironment{lemma}{        breakable, boxrule=0pt, boxsep=0pt, colback={oc-blue-1},left=8pt,right=8pt,enhanced jigsaw, borderline west={2pt}{0pt}{oc-blue-7},sharp corners,before skip=10pt,after skip=10pt}
% \tcolorboxenvironment{corollary}{    breakable, boxrule=0pt, boxsep=0pt, colback={oc-violet-1},left=8pt,right=8pt,enhanced jigsaw, borderline west={2pt}{0pt}{oc-violet-7},sharp corners,before skip=10pt,after skip=10pt}
% \tcolorboxenvironment{remark}{       breakable, boxrule=0pt, boxsep=0pt, blanker,borderline west={2pt}{0pt}{oc-green-7},left=8pt,right=8pt,before skip=10pt,after skip=10pt}
% \tcolorboxenvironment{remarks}{      breakable, boxrule=0pt, boxsep=0pt, blanker,borderline west={2pt}{0pt}{oc-green-7},left=8pt,right=8pt,before skip=10pt,after skip=10pt}
% \tcolorboxenvironment{example}{      breakable, boxrule=0pt, boxsep=0pt, colback={oc-gray-1},left=8pt,right=8pt,enhanced jigsaw, borderline west={2pt}{0pt}{oc-gray-7},sharp corners,before skip=10pt,after skip=10pt}
% \tcolorboxenvironment{examples}{     breakable, boxrule=0pt, boxsep=0pt, blanker,borderline west={2pt}{0pt}{Black},left=8pt,right=8pt,sharp corners,before skip=10pt,after skip=10pt}
% \tcolorboxenvironment{cthm}{         breakable, boxrule=0pt, boxsep=0pt, colback={oc-gray-1},left=8pt,right=8pt,enhanced jigsaw, borderline west={2pt}{0pt}{oc-gray-7},sharp corners,before skip=10pt,after skip=10pt}
% \tcolorboxenvironment{exercise}{     breakable, boxrule=0pt, boxsep=0pt, blanker,borderline west={2pt}{0pt}{oc-pink-7},left=8pt,right=8pt,before skip=10pt,after skip=10pt}
% \tcolorboxenvironment{exbox}{        breakable, boxrule=0pt, boxsep=0pt, blanker,borderline west={2pt}{0pt}{oc-pink-7},left=8pt,right=8pt,before skip=10pt,after skip=10pt}

% --- Algorithm packages ---
\RequirePackage[titlenumbered,linesnumbered,ruled]{algorithm2e}
\SetKwInOut{Input}{Input}
\SetKwInOut{Output}{Output}
\SetKwInOut{Return}{Return}
\SetKwComment{Comment}{/* }{ */}
\newcommand\mycommentstyle[1]{\footnotesize\ttfamily\textcolor{red!70!black}{#1}}
\SetCommentSty{mycommentstyle}

% --- Cleverref Custom Names ---
\crefname{algocf}{alg.}{algs.}
\Crefname{algocf}{Algorithm}{Algorithms}
\crefname{example}{ex.}{exs.}
\Crefname{example}{Example}{Examples}

% --- Custom environments ---
\newenvironment{talign}{\let\displaystyle\textstyle\align}{\endalign}
\newenvironment{talign*}{\let\displaystyle\textstyle\csname align*\endcsname}{\endalign}

% --- Section Formatting ---
% \usepackage[explicit]{titlesec}
% \titleformat{\section}[block]
%   {\fontsize{12}{14}\bfseries}
%   {\thesection}{1em}{#1}
% \titleformat{\subsection}[block]
%   {\fontsize{11}{13}\bfseries}
%   {\thesubsection}{1em}{#1}
% \titleformat{\subsubsection}[block]
%   {\fontsize{10}{11}\bfseries}
%   {\thesubsubsection}{1em}{#1}
% \titlespacing*{\section}{0pt}{5pt}{5pt}
% \titlespacing*{\subsection}{0pt}{5pt}{5pt}
% \titlespacing*{\subsubsection}{0pt}{5pt}{5pt}

\newcommand{\watermarkfont}{\color{black50}\normalfont\fontsize{10}{12}\selectfont}
\newcommand{\headerfont}{\normalfont\sffamily\fontsize{8}{10}\selectfont}
% \newcommand{\titlefont}{\color{black}\normalfont\bfseries\fontsize{18}{20}\selectfont} 
\newcommand{\titlefont}{\color{black}\normalfont\bfseries\fontsize{16}{20}\selectfont} 

\newcommand{\datesfont}{\normalfont\sffamily\itshape\fontsize{8}{10}\selectfont}
\newcommand\urlheaderfont{\color{blue}\fontsize{8}{10}\selectfont}
\newcommand{\absfont}{\linespread{1.2}\fontsize{11}{12}\selectfont}
\newcommand{\keywordstitlefont}{\bfseries\linespread{1.2}\fontsize{8}{10}\selectfont}
\newcommand{\keywordsfont}{\itshape\linespread{1.2}\fontsize{11}{12}\selectfont}
\newcommand{\copyrightfont}{\normalfont\fontsize{7}{9}\selectfont}
% \newcommand{\footerfont}{\color{black}\normalfont\fontsize{10}{10}\selectfont}
\newcommand{\footerfont}{\color{black}\normalfont\fontsize{9}{11}\selectfont}
\newcommand{\subjectfont}{\color{white}\bfseries\fontsize{10}{12}\selectfont}
\newcommand{\headingfont}{\color{black}\bfseries\fontsize{13}{14}\selectfont}

% --- Part pages: "Part I: Title" on one line, centered, with a rule below ---
\titleformat{\part}[block]
  {\centering\headingfont}
  {\partname~\thepart:}
  {0.5em}
  {}
  [\vspace{4pt}\titlerule]
\titlespacing*{\part}{0pt}{0pt}{4ex}

\let\oldsection\section
\renewcommand{\section}{\clearpage\oldsection}
\let\oldpart\part
\renewcommand{\part}[1]{\clearpage\oldpart{#1}}

% --- Final Document Settings ---
\newcommand{\Disp}{\displaystyle}
\newcommand{\qe}{\hfill\(\bigtriangledown\)}
\DeclareMathAlphabet\mathbfcal{OMS}{cmsy}{b}{n}
\setlength{\parindent}{0.2in}
\setlength{\parskip}{0pt}
\setlength{\columnseprule}{0pt}

% --- Nice comments ---
\newcommand{\commentgray}[1]{%
  \hspace{3px}%
  {\textcolor{gray!70!black}{\small\textit{// #1}}}%
}

% --- Nice algorithmic enumerate lists ---
\newlist{algoen}{enumerate}{1}
\setlist[algoen]{
    label=\textcolor{gray!90!black}{\arabic*:},
    %font=\small,
    align=right,
    widest=0,
    labelsep=0.75em,
    leftmargin=2.0em,
    labelindent=0.5em,
    nosep
}