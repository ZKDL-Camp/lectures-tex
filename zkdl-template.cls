\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{zkdl-template}[2024/07/09 ZKDL Template]

% --- Defining the basic article style ---
\providecommand\mtfntsize{10pt}
\ProcessOptions\relax
\LoadClass[a4paper,\mtfntsize]{extarticle}
\usepackage{titlepic} % For the image on the title page

% --- Required packages ---
\RequirePackage[T1,T2A]{fontenc}
\RequirePackage[utf8]{inputenc}
\RequirePackage[english]{babel}
\RequirePackage{cmbright}
\RequirePackage{blkarray}
\RequirePackage{graphicx}
\RequirePackage{framed}
\RequirePackage{dsfont}
\RequirePackage{extarrows}
\RequirePackage[normalem]{ulem}
\RequirePackage{indentfirst}
\RequirePackage{float}
\RequirePackage{subfiles}
\RequirePackage{amsmath,amsthm,amssymb,amsfonts}
\RequirePackage[italicdiff]{physics}
\RequirePackage{wrapfig}
\RequirePackage[inline,shortlabels]{enumitem}
\setlist{topsep=2pt,itemsep=2pt,parsep=0pt,partopsep=0pt}
\RequirePackage[dvipsnames,table]{xcolor}
\RequirePackage[utf8]{inputenc}
\RequirePackage[
    paperwidth=148mm,
    paperheight=210mm,
    top=5mm,
    bottom=12mm, 
    left=15mm, 
    right=15mm, 
    includehead,
    headheight=5mm,
    headsep=2mm,
    includefoot,
    footskip=8mm
]{geometry}
\RequirePackage[most]{tcolorbox}
\RequirePackage{multicol}
\RequirePackage{bm}
\RequirePackage[bottom,multiple]{footmisc} % ensures footnotes are at the bottom of the page, and separates footnotes by a comma if they are adjacent
\RequirePackage[makeroom]{cancel}

\RequirePackage{microtype} % Improves the spacing between words and letters
% \linespread{0.95}  % Tightens the lines by about 5%

% --- Configuring Figure settings ---
\usepackage[labelfont=bf]{caption} 
% \captionsetup[figure]{margin=10pt} % Set caption margin for figures
\setlength{\belowcaptionskip}{0mm}  % Set space after the caption (adjust the value as needed)
\setlength{\textfloatsep}{1mm}      % Space between float and text (affects figures/tables)
\counterwithin{figure}{section}

% --- Hyperref settings ---
\RequirePackage{hyperref}
\hypersetup{pdflang=en}
    \hypersetup{colorlinks=true,
      citecolor=blue!80,
      linkcolor=black!70!red}
\RequirePackage[nameinlink]{cleveref} % nameinlink ensures that the entire element is clickable in the pdf, not just the number

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
\usetikzlibrary{positioning}
\usetikzlibrary{backgrounds}
\usetikzlibrary{tikzmark}

% --- Matrix magical command
\renewcommand*\env@matrix[1][*\c@MaxMatrixCols c]{%
\hskip -\arraycolsep
\let\@ifnextchar\new@ifnextchar
\array{#1}}

% --- Ticks and crosses ---
\usepackage{pifont} % http://ctan.org/pkg/pifont
\newcommand{\cmark}{\textcolor{green!65!black}{\ding{51}}}%
\newcommand{\xmark}{\textcolor{red!80!black}{\ding{55}}}%

%% Code Block Settings
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
% --- Linter settings ---
\RequirePackage{listings, listings-rust}
\RequirePackage{listings, listings-circom}
\RequirePackage{listings, listings-json}
\RequirePackage{listings, listings-ts}

\newcommand{\remind}[1]{\textcolor{red}{\textbf{#1}}} % To remind me of unfinished work to fix later
\newcommand{\hide}[1]{} % To hide large blocks of code without using % symbols

% --- Footers ---
\RequirePackage{fancyhdr}
\lhead{}
\rhead{}
% \chead{\fontsize{8}{10}\selectfont\leftmark}
\cfoot{\thepage}
\renewcommand{\headrulewidth}{0.0mm}
\renewcommand{\footrulewidth}{0.0mm}

% --- Shortcuts ---
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

% --- Theorem keywords ---
\newtheoremstyle{mystyle}{}{}{}{}{\sffamily\bfseries}{.}{ }{}
\newtheoremstyle{cstyle}{}{}{}{}{\sffamily\bfseries}{.}{ }{\thmnote{#3}}
\makeatletter
\renewenvironment{proof}[1][\proofname] {\par\pushQED{\qed}{\normalfont\sffamily\bfseries\topsep6\p@\@plus6\p@\relax #1\@addpunct{.} }}{\popQED\endtrivlist\@endpefalse}
\makeatother
%\newcommand{\coolqed}[1]{\includegraphics[width=#1cm]{sunglasses_emoji.png}} %Defines the new QED symbol
%\renewcommand{\qedsymbol}{\coolqed{0.32}} %Implements the new QED symbol
\theoremstyle{mystyle}{\newtheorem{definition}{Definition}[section]}
\theoremstyle{mystyle}{\newtheorem{proposition}[definition]{Proposition}}
\theoremstyle{mystyle}{\newtheorem{theorem}[definition]{Theorem}}
\theoremstyle{mystyle}{\newtheorem{lemma}[definition]{Lemma}}
\theoremstyle{mystyle}{\newtheorem{corollary}[definition]{Corollary}}
\theoremstyle{mystyle}{\newtheorem*{remark}{Remark}}
\theoremstyle{mystyle}{\newtheorem*{remarks}{Remarks}}
\theoremstyle{mystyle}{\newtheorem*{example}{Example}}
\theoremstyle{mystyle}{\newtheorem*{examples}{Examples}}
\theoremstyle{definition}{\newtheorem*{exercise}{Exercise}}
\theoremstyle{cstyle}{\newtheorem*{cthm}{}}

% --Warning environment--
\newtheoremstyle{warn}{}{}{}{}{\normalfont}{}{ }{}
\theoremstyle{warn}
\newtheorem*{warning}{\warningsign{0.2}\relax}

% Symbol for the warning environment, designed to be easily scalable
\newcommand{\warningsign}[1]{\tikz[scale=#1,every node/.style={transform shape}]{\draw[-,line width={#1*0.8mm},red,fill=yellow,rounded corners={#1*2.5mm}] (0,0)--(1,{-sqrt(3)})--(-1,{-sqrt(3)})--cycle;
\node at (0,-1) {\fontsize{48}{60}\selectfont\bfseries!};}}

% --- Box styles ---
\tcolorboxenvironment{definition}{   breakable, boxrule=0pt, boxsep=0pt, colback={blue!10},left=8pt,right=8pt,enhanced jigsaw, borderline west={2pt}{0pt}{blue},sharp corners,before skip=10pt,after skip=10pt}
\tcolorboxenvironment{proposition}{  breakable, boxrule=0pt, boxsep=0pt, colback={Orange!10},left=8pt,right=8pt,enhanced jigsaw, borderline west={2pt}{0pt}{Orange},sharp corners,before skip=10pt,after skip=10pt}
\tcolorboxenvironment{theorem}{      breakable, boxrule=0pt, boxsep=0pt, colback={blue!10},left=8pt,right=8pt,enhanced jigsaw, borderline west={2pt}{0pt}{blue},sharp corners,before skip=10pt,after skip=10pt}
\tcolorboxenvironment{lemma}{        breakable, boxrule=0pt, boxsep=0pt, colback={Cyan!10},left=8pt,right=8pt,enhanced jigsaw, borderline west={2pt}{0pt}{Cyan},sharp corners,before skip=10pt,after skip=10pt}
\tcolorboxenvironment{corollary}{    breakable, boxrule=0pt, boxsep=0pt, colback={violet!10},left=8pt,right=8pt,enhanced jigsaw, borderline west={2pt}{0pt}{violet},sharp corners,before skip=10pt,after skip=10pt}
\tcolorboxenvironment{proof}{        breakable, boxrule=0pt, boxsep=0pt, blanker,borderline west={2pt}{0pt}{CadetBlue!80!white},left=8pt,right=8pt,sharp corners,before skip=10pt,after skip=10pt}
\tcolorboxenvironment{remark}{       breakable, boxrule=0pt, boxsep=0pt, blanker,borderline west={2pt}{0pt}{Green},left=8pt,right=8pt,before skip=10pt,after skip=10pt}
\tcolorboxenvironment{remarks}{      breakable, boxrule=0pt, boxsep=0pt, blanker,borderline west={2pt}{0pt}{Green},left=8pt,right=8pt,before skip=10pt,after skip=10pt}
\tcolorboxenvironment{example}{      breakable, boxrule=0pt, boxsep=0pt, colback={Gray!10},left=8pt,right=8pt,enhanced jigsaw, borderline west={2pt}{0pt}{Gray},sharp corners,before skip=10pt,after skip=10pt}
\tcolorboxenvironment{examples}{     breakable, boxrule=0pt, boxsep=0pt, blanker,borderline west={2pt}{0pt}{Black},left=8pt,right=8pt,sharp corners,before skip=10pt,after skip=10pt}
\tcolorboxenvironment{cthm}{         breakable, boxrule=0pt, boxsep=0pt, colback={gray!10},left=8pt,right=8pt,enhanced jigsaw, borderline west={2pt}{0pt}{gray},sharp corners,before skip=10pt,after skip=10pt}

% --- Algorithm packages ---
\RequirePackage[
    titlenumbered,
    linesnumbered,
    ruled
]{algorithm2e}
\SetKwInOut{Input}{Input}
\SetKwInOut{Output}{Output}
\SetKwInOut{Return}{Return}

\SetKwComment{Comment}{/* }{ */}
\newcommand\mycommentstyle[1]{\footnotesize\ttfamily\textcolor{red!70!black}{#1}}
\SetCommentSty{mycommentstyle}

% For cleverref to display the algorithms properly
\crefname{algocf}{alg.}{algs.}
\Crefname{algocf}{Algorithm}{Algorithms}

% align and align* environments with inline size
\newenvironment{talign}{\let\displaystyle\textstyle\align}{\endalign}
\newenvironment{talign*}{\let\displaystyle\textstyle\csname align*\endcsname}{\endalign}

\usepackage[explicit]{titlesec}

% Format for section (14pt)
\titleformat{\section}[block]
  {\fontsize{14}{16}\sffamily\bfseries}
  {\thesection}{1em}{#1}

% Format for subsection (12pt)
\titleformat{\subsection}[block]
  {\fontsize{13}{14}\sffamily\bfseries}
  {\thesubsection}{1em}{#1}

% Format for subsubsection (11pt)
\titleformat{\subsubsection}[block]
  {\fontsize{11}{12}\sffamily\bfseries}
  {\thesubsubsection}{1em}{#1}

\titlespacing*{\section}{0pt}{5pt}{5pt}
\titlespacing*{\subsection}{0pt}{5pt}{5pt}
\titlespacing*{\subsubsection}{0pt}{5pt}{5pt}

\newcommand{\sectionbreak}{\clearpage} % Start every section on a new page
% \newcommand{\subsectionbreak}{\clearpage} % Start every subsection on a new page

\newcommand{\Disp}{\displaystyle}
\newcommand{\qe}{\hfill\(\bigtriangledown\)}
\DeclareMathAlphabet\mathbfcal{OMS}{cmsy}{b}{n}
\setlength{\parindent}{0.2in}
\setlength{\parskip}{0pt}
\setlength{\columnseprule}{0pt}