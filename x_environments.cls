\ProvidesClass{zkdl-template}[2025/03/04 v1.0 Custom x environments]

%=====================%
% ------ X env ------ %
%=====================%

% There may be exceptions to where to use what

% Last equation in block (in lemma, theorem, etc)
\newenvironment{xequation}
{
  \vspace{-2.5mm}
  \begin{equation*}
}
{
  \end{equation*}
}

% Not last equation in block (there is text after)
\newenvironment{xequation*}
{
  \vspace{-1.75mm}
  \begin{equation*}
}
{
  \vspace{-2.25mm}
  \end{equation*}
}

% Last multicols in block (lemma, theorem, etc)
\newenvironment{xmulticols}[1]
{
  \vspace{-2.5mm}
  \begin{multicols*}{#1}
} 
{
  \end{multicols*}
  \vspace{-2.5mm}
} 

% Not last multicols in block (there is text after)
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

