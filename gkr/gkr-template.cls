\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{test-template}[2024/07/09 ZKDL Template]

% --- Defining the basic article style ---
\providecommand\mtfntsize{12pt}
\ProcessOptions\relax
\LoadClass[a4paper,\mtfntsize]{memoir}
\RequirePackage[a4paper, 
    top=1.0in,
    bottom=1.0in, 
    left=0.8in, 
    right=0.8in, 
    footskip=0.4in, 
    includefoot
]{geometry}

% --- Fonts and such ---
\RequirePackage[T1,T2A]{fontenc}
\RequirePackage[utf8]{inputenc}
\RequirePackage[english,ukrainian]{babel}
% \usepackage{concmath}
% \usepackage[OT1]{fontenc}

% --- Footnote style ---
\newcounter{daggerfootnote}
\newcommand*{\daggerfootnote}[1]{%
    \setcounter{daggerfootnote}{\value{footnote}}%
    \renewcommand*{\thefootnote}{\fnsymbol{footnote}}%
    \footnote[2]{#1}%
    \setcounter{footnote}{\value{daggerfootnote}}%
    \renewcommand*{\thefootnote}{\arabic{footnote}}%
}

\usepackage{libertinus}
%\usepackage[T1]{fontenc}

% --- Base Packages ---
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
\RequirePackage{longtable}
\RequirePackage{makecell, boldline}
\RequirePackage{opencolor}
\RequirePackage[utf8]{inputenc}
\RequirePackage[most]{tcolorbox}
\RequirePackage{multicol}
\RequirePackage{bm}
\RequirePackage[symbol*]{footmisc} % ensures footnotes are at the bottom of the page, and separates footnotes by a comma if they are adjacent
\RequirePackage[makeroom]{cancel}

% --- Configuring Figure settings ---
\usepackage[labelfont=bf]{caption}
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

% --- Linter settings ---
\RequirePackage{listings}

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
    numbers=left,  
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
    postbreak=\mbox{\hspace{-1.4em}\textcolor{purple}{$\hookrightarrow$}\space}
}

\newcommand{\remind}[1]{\textcolor{red}{\textbf{#1}}} % To remind me of unfinished work to fix later
\newcommand{\hide}[1]{} % To hide large blocks of code without using % symbols

% --- Footers ---
\RequirePackage{fancyhdr}
\lhead{Distributed Lab}
\rhead{Entrance Test}
\cfoot{Page \thepage}
\renewcommand{\headrulewidth}{1.25pt}
\renewcommand{\footrulewidth}{1.25pt}

% --- Theorem keywords ---
\newtheoremstyle{mystyle}{}{}{}{}{\sffamily\bfseries}{.}{ }{}
\newtheoremstyle{cstyle}{}{}{}{}{\sffamily\bfseries}{.}{ }{\thmnote{#3}}
\makeatletter
\renewenvironment{proof}[1][\proofname] {\par\pushQED{\qed}{\normalfont\sffamily\bfseries\topsep6\p@\@plus6\p@\relax #1\@addpunct{.} }}{\popQED\endtrivlist\@endpefalse}
\makeatother
\newcommand{\coolqed}[1]{\includegraphics[width=#1cm]{sunglasses_emoji.png}} %Defines the new QED symbol
\renewcommand{\qedsymbol}{\coolqed{0.32}} %Implements the new QED symbol
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
\tcolorboxenvironment{definition}{boxrule=0pt,boxsep=0pt,colback={blue!10},left=8pt,right=8pt,enhanced jigsaw, borderline west={2pt}{0pt}{blue},sharp corners,before skip=10pt,after skip=10pt}
\tcolorboxenvironment{proposition}{boxrule=0pt,boxsep=0pt,colback={Orange!10},left=8pt,right=8pt,enhanced jigsaw, borderline west={2pt}{0pt}{Orange},sharp corners,before skip=10pt,after skip=10pt}
\tcolorboxenvironment{theorem}{boxrule=0pt,boxsep=0pt,colback={blue!10},left=8pt,right=8pt,enhanced jigsaw, borderline west={2pt}{0pt}{blue},sharp corners,before skip=10pt,after skip=10pt}
\tcolorboxenvironment{lemma}{boxrule=0pt,boxsep=0pt,colback={Cyan!10},left=8pt,right=8pt,enhanced jigsaw, borderline west={2pt}{0pt}{Cyan},sharp corners,before skip=10pt,after skip=10pt}
\tcolorboxenvironment{corollary}{boxrule=0pt,boxsep=0pt,colback={violet!10},left=8pt,right=8pt,enhanced jigsaw, borderline west={2pt}{0pt}{violet},sharp corners,before skip=10pt,after skip=10pt}
\tcolorboxenvironment{proof}{boxrule=0pt,boxsep=0pt,blanker,borderline west={2pt}{0pt}{CadetBlue!80!white},left=8pt,right=8pt,sharp corners,before skip=10pt,after skip=10pt}
\tcolorboxenvironment{remark}{boxrule=0pt,boxsep=0pt,blanker,borderline west={2pt}{0pt}{Green},left=8pt,right=8pt,before skip=10pt,after skip=10pt}
\tcolorboxenvironment{remarks}{boxrule=0pt,boxsep=0pt,blanker,borderline west={2pt}{0pt}{Green},left=8pt,right=8pt,before skip=10pt,after skip=10pt}
\tcolorboxenvironment{example}{boxrule=0pt,boxsep=0pt,colback={Gray!10},left=8pt,right=8pt,enhanced jigsaw, borderline west={2pt}{0pt}{Gray},sharp corners,before skip=10pt,after skip=10pt}
\tcolorboxenvironment{examples}{boxrule=0pt,boxsep=0pt,blanker,borderline west={2pt}{0pt}{Black},left=8pt,right=8pt,sharp corners,before skip=10pt,after skip=10pt}
\tcolorboxenvironment{cthm}{boxrule=0pt,boxsep=0pt,colback={gray!10},left=8pt,right=8pt,enhanced jigsaw, borderline west={2pt}{0pt}{gray},sharp corners,before skip=10pt,after skip=10pt}

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
\titleformat{\section}{\color{blue!70!black}\fontsize{18}{20}\bfseries}{\thesection}{20pt}{#1}
\titleformat{\subsection}{\color{blue!70!black}\fontsize{14}{16}\bfseries}{\thesubsection}{12pt}{#1}
\titleformat{\subsubsection}{\color{blue!70!black}\fontsize{10}{12}\large\bfseries}{\thesubsubsection}{8pt}{#1}

\titlespacing*{\section}{0pt}{5pt}{5pt}
\titlespacing*{\subsection}{0pt}{5pt}{5pt}
\titlespacing*{\subsubsection}{0pt}{5pt}{5pt}

%\newcommand{\sectionbreak}{\clearpage} % Start every section on a new page

\newcommand{\Disp}{\displaystyle}
\newcommand{\qe}{\hfill\(\bigtriangledown\)}
\DeclareMathAlphabet\mathbfcal{OMS}{cmsy}{b}{n}
\setlength{\parindent}{0.2in}
\setlength{\parskip}{0pt}
\setlength{\columnseprule}{0pt}