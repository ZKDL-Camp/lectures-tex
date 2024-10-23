\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{zkdl-presentation-template}[2024/09/28 ZKDL Template]

% --- Beamer settings ---
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{beamer}}
\ProcessOptions\relax
\LoadClass[compress, final, xcolor={dvipsnames}]{beamer}

\usepackage[utf8]{inputenc}
\usepackage[english]{babel}

% --- Setting the theme ---
\usetheme{altarguelles}
\setbeamertemplate{sections/subsections in toc}[square]

% --- Bold captions ---
\usepackage[labelfont=bf]{caption}

% --- Including some standard packages ---
\RequirePackage{graphicx}
\RequirePackage{soul}
\RequirePackage{hyperref}
\RequirePackage{colortbl}
\RequirePackage{dsfont}
\RequirePackage{extarrows}

% --- Tikz ---
\RequirePackage{tikz}
\usepackage{tikz,tikz-3dplot,tikz-cd,tkz-tab,tkz-euclide,pgf,pgfplots}
\usetikzlibrary{matrix,positioning,fit,backgrounds,intersections}

% --- Cross signs ---
\RequirePackage{pifont} % http://ctan.org/pkg/pifont
\newcommand{\cmark}{\ding{51}}%
\newcommand{\xmark}{\ding{55}}%
\newcommand{\xopt}{\ding{48}}%

\RequirePackage{listings}

% --- Custom commands ---
\DeclareMathOperator*{\argmax}{arg\,max}
\DeclareMathOperator*{\argmin}{arg\,min}

% --- Intermediate Section Slides ---
\expandafter\def\expandafter\insertshorttitle\expandafter{%
  \insertshorttitle\hfill%
  \insertframenumber\,/\,\inserttotalframenumber}

\AtBeginSection[]{
  \begin{frame}[standout]
    \begin{tcolorbox}[
      boxrule=0pt,
      boxsep=0pt,
      blanker,
      borderline north={2.0pt}{-10pt}{white},
      borderline south={2.0pt}{-10pt}{white},
      left=8pt,
      right=8pt,
      before skip=10pt,
      after skip=10pt,
      colframe=black!95!gray, 
      colback=white,
      center, 
      arc=1em]
      \centering\LARGE
      \textcolor{white}{
        \textbf{\insertsectionhead}
      }
    \end{tcolorbox}
  \end{frame}
}

% --- Code Block Settings ---
\RequirePackage{listings,lstautogobble}
\definecolor{codegreen}{rgb}{0,0.6,0}
\definecolor{codegray}{rgb}{0.5,0.5,0.5}
\definecolor{codepurple}{rgb}{0.58,0,0.82}
\definecolor{backcolour}{rgb}{0.95,0.95,0.92}
 
\lstdefinestyle{mystyle}{
    language=Python,
    commentstyle=\color{codegreen},
    keywordstyle=\bfseries\color{oc-pink-7},
    numberstyle=\tiny\color{codegray},
    stringstyle=\color{oc-teal-7},
    basicstyle=\ttfamily\footnotesize,
    breakatwhitespace=false,         
    breaklines=true,                 
    captionpos=b,                    
    keepspaces=true,                 
    numbers=left,                    
    numbersep=5pt,                  
    showspaces=false,                
    showstringspaces=false,
    showtabs=false,                  
    tabsize=2
}

\lstset{style=mystyle}
