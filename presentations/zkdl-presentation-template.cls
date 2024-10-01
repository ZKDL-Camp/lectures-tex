\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{zkdl-presentation-template}[2024/09/28 ZKDL Template]

% -- Beamer settings --
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{beamer}}
\ProcessOptions\relax
\LoadClass[xcolor={dvipsnames}]{beamer}

\usepackage[utf8]{inputenc}
\usepackage[english]{babel}

% -- Setting the theme --
\usetheme{Arguelles}
\setbeamercolor{block title}{bg=blue!50!white, fg=white}
\setbeamercolor{block body}{bg=blue!10}
\setbeamercolor{block title alerted}{fg=white, bg=purple!50!white}
\setbeamercolor{block body alerted}{bg=purple!10}
\setbeamercolor{block title example}{fg=white, bg=green!70!black}
\setbeamercolor{block body example}{bg=green!10}

% -- Including some standard packages --
\RequirePackage{graphicx}
\RequirePackage{soul}
\RequirePackage{hyperref}
\RequirePackage{colortbl}
\RequirePackage{dsfont}
\RequirePackage{soul}

% --- Tikz ---
\RequirePackage{tikz}
\usepackage{tikz,tikz-3dplot,tikz-cd,tkz-tab,tkz-euclide,pgf,pgfplots}
\usetikzlibrary{matrix,positioning,fit,backgrounds,intersections}

% Code highlighting
\RequirePackage{listings,lstautogobble}

% -- Cross signs --
\RequirePackage{pifont} % http://ctan.org/pkg/pifont
\newcommand{\cmark}{\ding{51}}%
\newcommand{\xmark}{\ding{55}}%
\newcommand{\xopt}{\ding{48}}%

\RequirePackage{listings}

% -- Custom commands --
\DeclareMathOperator*{\argmax}{arg\,max}
\DeclareMathOperator*{\argmin}{arg\,min}

% --- Beamer settings ---
\expandafter\def\expandafter\insertshorttitle\expandafter{%
  \insertshorttitle\hfill%
  \insertframenumber\,/\,\inserttotalframenumber}

\AtBeginSection[]{
  \begin{frame}
  \vfill
  \centering
  \begin{beamercolorbox}[sep=8pt,center,shadow=true,rounded=true]{title}
    \usebeamerfont{title}\insertsectionhead\par%
  \end{beamercolorbox}
  \vfill
  \end{frame}
}

%% Code Block Settings
\RequirePackage{listings}
\definecolor{dkgreen}{rgb}{0,0.5,0}
\definecolor{gray}{rgb}{0.5,0.5,0.5}
\definecolor{mauve}{rgb}{0.58,0,0.82}
\lstset{
    numbers=left,  
    frame=tb,
    % aboveskip=3mm,
    % belowskip=3mm,
    showstringspaces=false,
    columns=fixed,
    % framerule=1pt,
    rulecolor=\color{gray!35},
    backgroundcolor=\color{gray!5},
    basicstyle={\ttfamily\small},
    numberstyle=\footnotesize\color{gray},
    keywordstyle=\bfseries\color{MidnightBlue!95!black},
    commentstyle=\color{dkgreen},
    stringstyle=\color{mauve},
    breaklines=true,
    breakatwhitespace=true,
    tabsize=2,
    extendedchars=false,
    postbreak=\mbox{\hspace{-1.4em}\textcolor{purple}{$\hookrightarrow$}\space}
}
