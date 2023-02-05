% This document needs to be compiled with the lualatex compiler
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ecamexam}[2023/01/14 Template DS ECAM]

\DeclareOption*{%
	\PassOptionsToClass{\CurrentOption}{exam}
}
\ProcessOptions\relax

\LoadClass[11pt,addpoints]{exam}

\RequirePackage[svgnames]{xcolor}
	\definecolor{bleuecam}{HTML}{2F2F75} % bleu ECAM
\RequirePackage{fontspec}
	\setmainfont{Arial}
	\renewcommand{\familydefault}{\sfdefault}
\RequirePackage{graphicx}
\RequirePackage{amssymb}
\RequirePackage[top=2cm,bottom=2cm,left=2cm,right=2cm]{geometry}
\RequirePackage{polyglossia}
	\setdefaultlanguage{french}
\RequirePackage{adjustbox}
\RequirePackage{pdfpages}
\RequirePackage{tabularx}
	\newcolumntype{Y}{>{\centering\arraybackslash}X}
\RequirePackage{tikz}
\RequirePackage{pgfplots}
\RequirePackage{eso-pic}
\RequirePackage{adjustbox}

\RequirePackage{soul}

\RequirePackage{enumitem}
\RequirePackage{booktabs}


\newcommand\blankpage{% macro page blanche
	\clearpage
	\null
	\thispagestyle{empty}%
	\addtocounter{page}{-1}%
	\clearpage
}

\newcommand{\@UE}{}
\newcommand*{\UE}[1]{%
	\renewcommand*{\@UE}{#1}%
}
\newcommand{\@duree}{}
\newcommand*{\duree}[1]{%
	\renewcommand*{\@duree}{#1}%
}
\newcommand{\@dateDS}{}
\newcommand*{\dateDS}[1]{%
	\renewcommand*{\@dateDS}{#1}%
}
\newcommand{\@sujetDS}{}
\newcommand*{\sujetDS}[1]{%
	\renewcommand*{\@sujetDS}{#1}%
}
\newcommand{\@promo}{}
\newcommand*{\promo}[1]{%
	\renewcommand*{\@promo}{#1}%
}
\newcommand{\@annee}{}
\newcommand*{\annee}[1]{%
	\renewcommand*{\@annee}{#1}%
}

% Typeset the headers and footers
\pagestyle{headandfoot}
\coverheader{}{}{\@dateDS}
\headrule
\header{\footnotesize \@sujetDS}{}{}
\footer{\oddeven{}{Page \thepage\ sur \numpages}}{}{\oddeven{Page \thepage\ sur \numpages}{}}

% Rename the different labels to match the template
\renewcommand{\choicelabel}{[\thechoice]}
\renewcommand{\questionlabel}{\color{blue}\thequestion)}
\renewcommand{\partlabel}{\thepartno)}
\newcommand{\exercice}[1]{\noindent\vrule width 3pt~~\colorbox{Lavender}{\parbox{\linewidth-.5cm}{\Large #1}}\vspace{1em}}

%

\newcommand*{\@intro}{}
\newcommand*{\intro}[1]{%
	\renewcommand*{\@intro}{#1}
}
\newcommand{\makeintro}{%
	\fbox{\parbox{17cm}{
		\@intro	
	}}
}

% Create specific instructions
\renewcommand{\labelitemi}{$\blacksquare$}
\newcommand*{\@tableauconsigne}{}
\newcommand*{\tableauconsigne}[1]{%
	\renewcommand*{\@tableauconsigne}{%
		\begin{itemize}
			\item #1\checknextarg
		}
}
\newcommand*{\checknextarg}{\@ifnextchar\bgroup{\addnextchar}{\end{itemize}}}
\newcommand*{\addnextchar}[1]{ \item #1 \@ifnextchar\bgroup{\addnextchar}{\end{itemize}}}


\newcommand{\makecover}{%
	\begin{coverpages}
		\begin{tabularx}{\linewidth}{p{6cm}p{12cm}}
			\adjincludegraphics[width=4cm,valign=c]{ECAM-LaSalle.png} & \Huge\color{bleuecam} \@sujetDS
		\end{tabularx}
		
		\renewcommand{\arraystretch}{2}
		\sethlcolor{Lavender}
%		\renewcommand{\labelitemi}{$\blacksquare$}
		\begin{tabularx}{\linewidth}{p{0.5\linewidth}p{.5\linewidth}}
			\hline
			\hl{UE:} \@UE & \hl{Durée:} \@duree \\
			\textbf{Promotion:} \@promo & \\
			\textbf{Année:} \@annee & \\
			\hline
			\hl{Consignes spécifiques:} &\\
			
			\@tableauconsigne &\\
			\hline
			\makebox[.8\linewidth]{\hl{Nom:}\enspace\hrulefill} & \makebox[.8\linewidth]{\hl{Prénom:}\enspace\hrulefill}
		\end{tabularx}
	
	\vspace{4em}
	\makeintro
	
	\end{coverpages}
		
}


