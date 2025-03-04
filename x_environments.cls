\ProvidesClass{zkdl-template}[2025/03/04 v1.0 Custom x environments]

%=====================%
% ------ X env ------ %
%=====================%

\newenvironment{xequation}
{
  \vspace{-2mm}
  \begin{equation*}
}
{
%   \vspace{-1mm}
  \end{equation*}
}

\newenvironment{xmulticols}[1]
{
  \vspace{-2.5mm}
  \begin{multicols*}{#1}
} 
{
  \end{multicols*}
  \vspace{-2.5mm}
} 

% Use when 
\newenvironment{xmulticols*}[1]
{
  \vspace{-2.5mm}
  \begin{multicols*}{#1}
} 
{
  \end{multicols*}
  \vspace{-2.5mm}
} 

%=====================%
% -- Exercises env -- %
%=====================%

\newcommand{\exerciseTitle}[2]{
  \vspace{1mm}

  \textbf{#1} #2
}

\newcommand{\exerciseList}[1]{
  \begin{enumerate}[a),left=5mm]
    #1
  \end{enumerate}
}

\newcommand{\exerciseMulticols}[2]{
  \vspace{-3mm}
  
  \begin{multicols}{#1}
    \begin{enumerate}[a),left=5mm]
      #2
    \end{enumerate}
  \end{multicols}
  
  \vspace{-3.5mm}
}

\newenvironment{xexercise}[4]{
  \exerciseTitle{#1}{#2}
  \ifnum#3=1
    \exerciseList{#4}
  \else
    \exerciseMulticols{#3}{#4}
  \fi
}{}

