% This document needs to be compiled with the lualatex compiler
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ecamexam}[2023/01/14 Template DS ECAM]

\DeclareOption{french}{%
	\def\uetext{\mbox{UE:}}
	\def\consignetext{\mbox{Consignes spécifiques:}}
	\def\dureetext{\mbox{Durée:}}
	\def\nametext{\mbox{Nom:}}
	\def\firstnametext{\mbox{Prénom:}}
}
\DeclareOption{english}{%
	\def\uetext{\mbox{UE:}}
	\def\consignetext{\mbox{Specific instructions:}}
	\def\dureetext{\mbox{Duration:}}
	\def\nametext{\mbox{Name:}}
	\def\firstnametext{\mbox{First name:}}
}
\DeclareOption*{%
	\PassOptionsToClass{\CurrentOption}{exam}
}

\ProcessOptions\relax

\LoadClass[11pt,addpoints]{exam}

\RequirePackage[svgnames]{xcolor}
	\definecolor{bleuecam}{HTML}{2F2F75} % bleu ECAM
\RequirePackage{fontspec}
	\setmainfont{Arial}[Path=fonts/]
	\renewcommand{\familydefault}{\sfdefault}
\RequirePackage{graphicx}
\RequirePackage{amssymb}
\RequirePackage[top=2cm,bottom=2cm,left=2cm,right=2cm]{geometry}
\RequirePackage{babel}
\RequirePackage{adjustbox}
\RequirePackage{pdfpages}
\RequirePackage{tabularx}
	\newcolumntype{Y}{>{\centering\arraybackslash}X}
\RequirePackage{tikz}
\RequirePackage{pgfplots}
\RequirePackage{eso-pic}
\RequirePackage{adjustbox}
\RequirePackage{etoolbox}
\RequirePackage{soul}
\RequirePackage{enumitem}
	\setlist{noitemsep}
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
\newcommand*{\anneediplome}[1]{%
	\renewcommand*{\@annee}{#1}%
}

% Typeset the headers and footers
\pagestyle{headandfoot}
\headrule
\header{\footnotesize \@sujetDS}{}{}
\@ifclasswith{ecamexam}{french}{\footer{\oddeven{Page \thepage\ sur \numpages}{}}{}{\oddeven{}{Page \thepage\ sur \numpages}}}{\footer{\oddeven{Page \thepage\ on \numpages}}{}{}{\oddeven{}{Page \thepage\ on \numpages}}}

% Rename the different labels to match the template
\renewcommand{\choicelabel}{[\thechoice]}
\renewcommand{\questionlabel}{\color{blue}\thequestion)}
\renewcommand{\partlabel}{\thepartno)}

\newcounter{exercize}
\newcommand{\noexercize}{\stepcounter{exercize}\theexercize}
\newcommand{\exercice}[1]{\noindent\vrule width 3pt~~\colorbox{Lavender}{\parbox{\linewidth-.5cm}{\Large Exercice \noexercize:  #1}}\vspace{1em}}
%

\newcommand{\@intro}{}
\newcommand{\intro}[1]{%
	\renewcommand*{\@intro}{#1}
}
\newcommand{\makeintro}{%
	\ifx\@intro\empty
	\else
	\fbox{\parbox{17cm}{
		{\@intro}	
	}}\fi
}

% Create specific instructions

\newcommand{\tabitem}{\hspace{1.5cm}~~\llap{$\blacksquare$}~~}
\renewcommand{\labelitemi}{$\blacksquare$}

%\newcommand*\consignes{}
%\newcommand*\consigne[1]
%{\ifx\consignes\empty
%	\def\consignes{\tabitem #1 & \\}%
%	\else
%	\expandafter\def\expandafter\consignes\expandafter{\consignes \tabitem#1 & \\}%
%	\fi}

\newcommand*\consignes{}
\newcommand*\consigne[1]
{\ifx\consignes\empty
	\def\consignes{\item #1}%
	\else
	\expandafter\def\expandafter\consignes\expandafter{\consignes \item #1}%
	\fi}

\renewcommand{\arraystretch}{0.1}
\newcommand{\makecover}{%
	\newgeometry{top=1cm,bottom=2cm,left=2cm,right=2cm}
	\begin{coverpages}
		\begin{tabularx}{\linewidth}{p{6cm}p{9cm}r}
			& & \@dateDS \\
			\adjincludegraphics[width=4cm,valign=c]{logos/ECAM-LaSalle.png} & \Huge\color{bleuecam} \textbf{\@sujetDS} & \\
		\end{tabularx}
		
		\renewcommand{\arraystretch}{2}
		\sethlcolor{Lavender}
		\renewcommand{\labelitemi}{$\blacksquare$}
		\vspace{-1.25em} %to look exactly like the template provided by ECAM
		
		\begin{tabularx}{\linewidth}{p{0.45\linewidth}>{\raggedleft\arraybackslash}p{.5\linewidth}}
			\hline
			\hl{\uetext} \@UE & \@promo/\@annee\\
			 & \hl{\dureetext} \@duree\\
			\hline
			\hl{\consignetext}
			
			\begin{itemize}
				\consignes 
			\end{itemize} &\\
			\hline
			\makebox[.8\linewidth]{\hl{\nametext}\enspace\hrulefill} & \makebox[.8\linewidth]{\hl{\firstnametext}\enspace\hrulefill}
		\end{tabularx}
	
	\vspace{4em}
	\makeintro
	
	\end{coverpages}
	\restoregeometry
}


