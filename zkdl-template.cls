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
\RequirePackage[T1,T2A]{fontenc}
\RequirePackage[utf8]{inputenc}
\RequirePackage[english]{babel}

% --- MATH & FONT PACKAGES (Corrected and Synced with bionetta.cls) ---
% 1. Load the main math/text font package FIRST.
%    This sets the main font to XCharter and configures math to match.
%\RequirePackage[amsthm,xcharter,bigdelims,vvarbb]{newtxmath}
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

% --- Layout and Formatting ---
\RequirePackage[
    paperwidth=145mm,
    paperheight=215mm,
    top=5mm,
    bottom=12mm, 
    left=15mm, 
    right=15mm, 
    includehead,
    headheight=5mm,
    headsep=2mm,
    includefoot,
    footskip=4mm
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
\RequirePackage[labelfont=bf]{caption}
\setlength{\belowcaptionskip}{0mm}
\setlength{\textfloatsep}{1mm}
\counterwithin{figure}{section}

% --- Lists, Footnotes, and Utilities ---
\RequirePackage[inline,shortlabels]{enumitem}
\setlist{topsep=2pt,itemsep=2pt,parsep=0pt,partopsep=0pt}
\RequirePackage[bottom,multiple]{footmisc}
\RequirePackage{subfiles}
\RequirePackage{pifont}

% --- Hyperref and Cleverref ---
\RequirePackage{hyperref}
\hypersetup{pdflang=en}
    \hypersetup{colorlinks=true,
      citecolor=blue!80,
      linkcolor=black!70!red}
\RequirePackage[nameinlink]{cleveref}

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
\RequirePackage{listlings/listings-rust}
\RequirePackage{listlings/listings-circom}
\RequirePackage{listlings/listings-json}
\RequirePackage{listlings/listings-ts}

\newcommand{\remind}[1]{\textcolor{red}{\textbf{#1}}} % To remind me of unfinished work to fix later
\newcommand{\hide}[1]{} % To hide large blocks of code without using % symbols

% --- Minted settings ---
\RequirePackage{minted}
% Style for minted
\setminted{
  fontfamily=cmtt,
  frame=lines,      % Adding a frame for style
  fontsize=\small   % Using a slightly smaller font for code
}
\usemintedstyle{colorful}

% --- Headers and Footers ---
\RequirePackage{fancyhdr}
\pagestyle{fancy}
\fancyhf{}
\lhead{}
\rhead{}
\cfoot{\thepage}
\renewcommand{\headrulewidth}{0.0mm}
\renewcommand{\footrulewidth}{0.0mm}

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
\newtheoremstyle{mystyle}{}{}{}{}{\bfseries}{.}{ }{}
\newtheoremstyle{cstyle}{}{}{}{}{\bfseries}{.}{ }{\thmnote{#3}}
\makeatletter
\renewenvironment{proof}[1][\proofname] {\par\pushQED{\qed}{\normalfont\bfseries\topsep6\p@\@plus6\p@\relax #1\@addpunct{.} }}{\popQED\endtrivlist\@endpefalse}
\makeatother
\theoremstyle{mystyle}{\newtheorem{definition}{Definition}[section]}
\theoremstyle{mystyle}{\newtheorem{proposition}[definition]{Proposition}}
\theoremstyle{mystyle}{\newtheorem{theorem}[definition]{Theorem}}
\theoremstyle{mystyle}{\newtheorem{lemma}[definition]{Lemma}}
\theoremstyle{mystyle}{\newtheorem{corollary}[definition]{Corollary}}
\theoremstyle{mystyle}{\newtheorem*{remark}{Remark}}
\theoremstyle{mystyle}{\newtheorem*{remarks}{Remarks}}
\theoremstyle{mystyle}{\newtheorem{example}{Example}[section]}
\theoremstyle{mystyle}{\newtheorem{examples}{Examples}[section]}
\theoremstyle{definition}{\newtheorem*{exercise}{Exercise}}
\theoremstyle{cstyle}{\newtheorem*{cthm}{}}

% Load custom environment 
\input{x_environments.cls}

% --Warning environment--
\newtheoremstyle{warn}{}{}{}{}{\normalfont}{}{ }{}
\theoremstyle{warn}
\newtheorem*{warning}{\warningsign{0.2}\relax}

% Symbol for the warning environment
\newcommand{\warningsign}[1]{\tikz[scale=#1,every node/.style={transform shape}]{\draw[-,line width={#1*0.8mm},red,fill=yellow,rounded corners={#1*2.5mm}] (0,0)--(1,{-sqrt(3)})--(-1,{-sqrt(3)})--cycle;
\node at (0,-1) {\fontsize{48}{60}\selectfont\bfseries!};}}

% --- Box styles using tcolorbox ---
\RequirePackage[most]{tcolorbox}
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
\newcommand{\footerfont}{\color{black}\normalfont\fontsize{11}{12}\selectfont}
\newcommand{\subjectfont}{\color{white}\bfseries\fontsize{10}{12}\selectfont}
\newcommand{\headingfont}{\color{black}\bfseries\fontsize{13}{14}\selectfont}


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