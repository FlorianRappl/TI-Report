% -------------------------------------------------------------------
%  @LaTeX-class-file{
%     filename        = "tireport.cls",
%     version         = "1.0",
%     date            = "3 August 2015",
%     codetable       = "UTF-8",
%     keywords        = "LaTeX, Texas, Instruments, Report, Contest, Submission",
%     supported       = "send email to mail@florian-rappl.de",
%     docstring       = "The report class used for the TI contest."
% --------------------------------------------------------------------
%
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{tireport}[2015/08/03 The TI report]
\LoadClass[
	12pt, % Main document font size
	a4paper, % Paper type, use 'letterpaper' for US Letter paper
	oneside, % One page layout (no page indentation)
	headinclude,
	footinclude, % Extra spacing for the header and footer
	BCOR5mm, % Binding correction
]{scrartcl}
%
\usepackage[
	nochapters, % Turn off chapters since this is an article        
	beramono, % Use the Bera Mono font for monospaced text (\texttt)
	eulermath,% Use the Euler font for mathematics
	pdfspacing, % Makes use of pdftex’ letter spacing capabilities via the microtype package
	dottedtoc % Dotted lines leading to the page numbers in the table of contents
]{classicthesis} % The layout is based on the Classic Thesis style
%
\RequirePackage{arsclassica} % Modifies the Classic Thesis package
\RequirePackage[T1]{fontenc} % Use 8-bit encoding that has 256 glyphs
\RequirePackage[utf8]{inputenc} % Required for including letters with accents
\RequirePackage{graphicx} % Required for including images
\RequirePackage{enumitem} % Required for manipulating the whitespace between and within lists
\RequirePackage{lipsum} % Used for inserting dummy 'Lorem ipsum' text into the template
\RequirePackage{subfig} % Required for creating figures with multiple parts (subfigures)
\RequirePackage{amsmath,amssymb,amsthm} % For including math equations, theorems, symbols, etc
\RequirePackage{varioref} % More descriptive referencing
\RequirePackage[a4paper]{geometry} % Improved geometry A4 paper
\newgeometry{top=1in, bottom=1in, left=1in, right=1in} % Set according to formal requirements
\RequirePackage{titling} % For accessing some data
\RequirePackage{collect} % Moving parts prior to the title
\RequirePackage{xspace} % Insert spaces if useful after defines
\RequirePackage{tabu} % More beautiful tables
\bibliographystyle{unsrt} % Use numbers for the bibliography
\RequirePackage{epstopdf} % Convert EPS to PDF
\RequirePackage{tikz} % Use advanced drawing capabilities
\usetikzlibrary{calc, arrows, decorations.pathmorphing}
%
\newlength\figureheight	%used to define length and width of pgfplots
\newlength\figurewidth
%
\hypersetup{
	colorlinks=true, 
	breaklinks=true, 
	bookmarks=true,
	bookmarksnumbered,
	urlcolor=webbrown, 
	linkcolor=RoyalBlue, 
	citecolor=webgreen, % Link colors
	pdftitle={}, % PDF title
	pdfauthor={\textcopyright}, % PDF Author
	pdfsubject={}, % PDF Subject
	pdfkeywords={}, % PDF Keywords
	pdfcreator={pdfLaTeX}, % PDF Creator
	pdfproducer={LaTeX with hyperref and ClassicThesis} % PDF producer
}
% The header for all pages
\renewcommand{\sectionmark}[1]{\markright{\spacedlowsmallcaps{#1}}}
% The header style
\lehead{
	\mbox{
		\llap{\small\thepage\kern1em\color{halfgray} \vline}
		\color{halfgray}\hspace{0.5em}\rightmark\hfil
	}
}
%
\def\coauthor#1{\gdef\thecoauthor{#1}}
\def\advisor#1{\gdef\theadvisor{#1}}
\def\university#1{\gdef\theuniversity{#1}}
\def\teampic#1{\gdef\theteampic{#1}}
\def\projectpic#1{\gdef\theprojectpic{#1}}
\def\unilogo#1{\gdef\theunilogo{#1}}
\def\tilogo#1{\gdef\thetilogo{#1}}
\def\contest#1{\gdef\thecontest{#1}}
%
\pagestyle{scrheadings}
%
\setcounter{tocdepth}{2} 
% For adding new images via tikz
\newcommand{\inputtikz}[2]{\resizebox{#1}{!}{\input{#2}}}
% For modifying the bibliography heading
\renewcommand{\refname}{\spacedlowsmallcaps{References}}
% Saving the delivered abstract
\definecollection{abstract}
\makeatletter
\renewenvironment{abstract}[0]{\@nameuse{collect}{abstract}{}{}{}{}}{\@nameuse{endcollect}}
\makeatother
% Saving the used parts
\newcommand{\parts}{}
\newcounter{partcounter}
\setcounter{partcounter}{0}
% Making a list easy (being transformed to cells)
\makeatletter
\newcommand{\usepart}[3]{
	\g@addto@macro\parts{#1 & \href{#3}{#2}}

	\ifnum\value{partcounter} > 0
		\g@addto@macro\parts{\\}
		\setcounter{partcounter}{0}
	\else
		\g@addto@macro\parts{ & }
		\stepcounter{partcounter}
	\fi
}
\makeatother
% Labels for the grid
\newcommand{\bl}[1]{\textbf{#1:}}
% Creating the title
\renewcommand{\maketitle}{{
	\thispagestyle{empty}
	\setlength{\parindent}{0cm}
	\tabulinesep=1.2mm

	\makebox[\textwidth]{
		\includegraphics[width=3cm]{\theunilogo}
		\hfill
		\includegraphics[width=4.5cm]{\thetilogo}
	}

	\vspace{0.2cm}

	\begin{center}
		\bfseries\small
		Texas Instruments Innovation Challenge: 
		\thecontest\ Project Report
	\end{center}

	\begin{center}
		\Huge
		\thetitle
	\end{center}

	\begin{tabu}{ll}
		\bl{Team Leader} & \theauthor\\
		\bl{Team Members} & \thecoauthor\\
		\bl{Advising Professor} & \theadvisor\\
		\bl{University} & \theuniversity\\
		\bl{Date} & \thedate
	\end{tabu}

	\begin{tabu} to \textwidth {X[1]X[7]X[1]X[7]}
		\textbf{Qty.} & \textbf{TI Part Number \& URL} & 
		\textbf{Qty.} & \textbf{TI Part Number \& URL} \\
		\parts
	\end{tabu}

	\vspace*{\fill}

	\makebox[\textwidth]{
		\hfill
		\includegraphics[width=0.45\textwidth]{\theteampic}
		\hfill
		\includegraphics[width=0.45\textwidth]{\theprojectpic}
		\hfill
	}

	\vspace*{\fill}

	\includecollection{abstract}
}}
%