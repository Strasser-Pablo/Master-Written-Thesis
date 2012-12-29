%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                         %
%  masters.cls : A class file for Pablo Strasser master thesis.		  %
%		 Based on a class file for a master thesis                %
%                Université de Genève, Faculté des Sciences               %
%                Section de mathématiques                                 %
%                                                                         %
%                Version 2.0,  29/04/2008 by Martin Gander                %
%               (Version 1.0 by Julio Rodriguez in 2007)                  %
%              								  %
%		Changed counter to reset at every chapter and not section %
%									  %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{master}

% All options are passed to the article class.

\LoadClassWithOptions{book}

% use standard graphics and math packages

\usepackage{amsmath,amssymb}
\usepackage{psfrag}
\usepackage{graphicx}

%Package used by Pablo

%Package inclusion
%\usepackage{morefloats}
\usepackage{fontspec}
\usepackage{hyperref}
\usepackage{amsmath}
\usepackage{amsthm}
\usepackage{listings}
\usepackage{tikz}
\usepackage{verbatim}
\usepackage{minitoc}
\usepackage{pgfplots}
\usepackage{pgfplotstable}

\usepackage{float}
\usepackage[amssymb,thickspace,thickqspace]{SIunits}
\usepackage{algpseudocode,algorithm}
\usepackage{caption}
\usepackage{subcaption}
%Float Style
\floatstyle{ruled}
\restylefloat*{table}
\restylefloat*{figure}

%Tikz library inclusion
\usepgflibrary{shapes.geometric}
\usetikzlibrary{fit}
\usetikzlibrary{backgrounds}
\usetikzlibrary{pgfplots.external}
\usetikzlibrary{pgfplots.units} 
\usepgfplotslibrary{external}
\usetikzlibrary{shapes.multipart}

%Algorythms
\renewcommand\And{\mathbin{\textbf{and}}}
\newcommand\Or{\mathbin{\textbf{or}}}
\newcommand\True{\mathop{\textbf{true}}}
\newcommand\False{\mathop{\textbf{false}}}
\newcommand\Nan{\mathop{\textbf{nan}}}

\newcommand\Step{\mathbin{\textbf{step}}}

\newcommand\To{\mathbin{\textbf{to}}}

\newcommand\Not{\mathop{\textbf{not}}}

\newcommand\Break{\mathop{\textbf{break}}}

%\renewcommand\Return{\mathop{\textbf{return}}}

\newcommand\FuncCall[1]{\mathop{\textbf{#1}}}

%External command
\tikzset{external/system call={lualatex --shell-escape \tikzexternalcheckshellescape -halt-on-error
-interaction=batchmode -jobname "\image" "\texsource"}}

\tikzset{external/mode=list and make}
\tikzsetexternalprefix{figures/}

%New command for identifier style
\newcommand{\identifiera}[0]{\setmonofont }
\newcommand{\identifier}[1]{ {\identifiera #1}}

%listings option set
% Warning use newcommand for identifier style
\lstset{numbers=left, numberstyle=\tiny, stepnumber=5, numbersep=5pt}
\lstset{escapeinside={(*@}{@*)}}
\lstset{basicstyle=\small, language=c++}
\lstset{breaklines=true,
    breakindent=0pt,
    tabsize=2,
    identifierstyle=\identifiera}
\lstset{morekeywords={iterator,stack,pair}}
\lstset{emphstyle=\underbar}
\lstset{escapeinside={@}{@}}

%New filename command for typseting file
\DeclareUrlCommand\filename{\urlstyle{tt}}

%New command Bold for vector in math mode
\newcommand{\vect}[1]{ {\boldsymbol {#1}}}

%New command for kronecker product.
\newcommand{\kron}{\bigotimes}
%New command for identity matrice.
\newcommand{\eye}{1}

%Debug for lua
\newwrite\luadebug
\immediate\openout\luadebug luadebug.lua
\AtEndDocument{\immediate\closeout\luadebug}
\newcommand\directluadebug{\immediate\write\luadebug}

%modify page sizes and indentation
\oddsidemargin 0in \evensidemargin 0in
\topmargin -25pt \headheight 9pt \headsep 25pt 
\setlength{\textheight}{235mm}
\setlength{\textwidth}{155mm}

% provide standard mathematics environments
\newtheorem{theorem}{\bf Theorem}[section]
\newtheorem{lemma}[theorem]{\bf Lemma}
\newtheorem{corollary}[theorem]{\bf Corollary}
\newtheorem{proposition}[theorem]{\bf Proposition}
\newtheorem{definition}{\bf Definition}[section]
\renewenvironment{proof}{\noindent{\bf Proof\ }}{\QED\\}
\newcommand{\QED}{\hspace*{\fill}\rule{2.5mm}{2.5mm}}
\newtheorem{remark}{\bf  Remark}[section]
\newtheorem{problem}{\bf Problem}[section]
\newtheorem{example}{\bf Example}[section]

% Added by Pablo
\newtheorem{property}{Property}

% Variables for the titlepage
\newcommand{\Supervisor}[1]{\gdef\@Supervisor{#1}}

\renewcommand{\maketitle}{
    \thispagestyle{empty}
    \setcounter{page}{0}
    \noindent\large UNIVERSIT\'E DE GEN\`EVE \hfill FACULT\'E DES SCIENCES \\
    Section de math\'ematiques

    \hrule
    \vfill
    \begin{center}
    {\Large\bf\@title}
    \vfill

    {\large\rm\ {\@author} }
    \vfill

    {\large Master thesis under the supervision of} \\
    {\large { \@Supervisor } } 
    \vfill

    {\footnotesize
    Atelier de reproduction de la Section de physique \\
    Geneva, \ \@date \\[-2mm]}
    \hrulefill

    \end{center}
    \newpage }

\@addtoreset{equation}{chapter}   % Makes \chapter reset 'equation' counter.
\def\theequation{\thechapter.\arabic{equation}}

\@addtoreset{theorem}{chapter}
\def\thetheorem{\thechapter.\@arabic\c@theorem}
\def\thelemma{\thechapter.\@arabic\c@theorem}
\def\thecorollary{\thecorollary.\@arabic\c@theorem}
\def\theproposition{\theproposition.\@arabic\c@theorem}

\@addtoreset{figure}{chapter}
\def\thefigure{\thechapter.\@arabic\c@figure}

\@addtoreset{table}{chapter}
\def\thetable{\thechapter.\@arabic\c@table}
