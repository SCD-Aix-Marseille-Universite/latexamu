%
% Aix-Marseille Université <@univ-amu.fr>
% Version 0.3 released 01/03/2017
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{amu_these}[2012/07/01 Classe personnelle, V0.2]

%%% classe de base (KOMA-Script)
\LoadClass{scrreprt}						%% classe report KOMA-Script
\KOMAoptions{paper=a4,fontsize=12pt,DIV=12,BCOR=0mm,twoside=off,index=totoc,listof=totoc}

%%% extensions minimales
\RequirePackage[utf8]{inputenc}				%% encodage du texte
\RequirePackage[TS1,T1]{fontenc}			%% encodage des fontes
\RequirePackage{textcomp}					%% symboles complémentaires
\RequirePackage{lmodern}					%% polices latin modern
\RequirePackage{microtype}					%% microtypographie
\RequirePackage[english,french]{babel}		%% typographie (français par défaut)
\RequirePackage[babel]{csquotes}			%% guillemets
\MakeAutoQuote{«}{»}						%% espacement automatique

\RequirePackage{lipsum}						%% lorem ipsum (exemple)

%%% extensions complémentaires
\RequirePackage{scrhack,scrpage2}			%% macros et en-tête/pied de page personnalisés (KOMA-Script)
\PassOptionsToPackage{
	backend=biber,							%% compilateur par défaut pour biblatex
	maxnames=3,								%% nombre max. de noms auteurs
	minnames=3,								%% nombre min. de noms auteurs
	sorting=nyt,							%% trier par nom, année, titre
	citestyle=authoryear,					%% style de citation auteur-année
	bibstyle=alphabetic,					%% style de bibliographie alphabetique
	backref=true							%% retour de références (cf. p.)
	}{biblatex}
\RequirePackage{biblatex}					%% gestion de la bibliographie avec biblatex
\RequirePackage{imakeidx}					%% index
\RequirePackage[intoc]{nomencl}				%% nomenclature
\RequirePackage[titles]{tocloft}			%% TOC LOF LOT
\RequirePackage{endnotes}					%% notes de fin
\RequirePackage{hyperendnotes}				%% !attention! fichier hyperendnotes.sty hack
\RequirePackage{pdfpages}					%% insertion de pdf
\RequirePackage{graphicx}					%% graphiques et figures
\RequirePackage{caption}					%% légendes des figures
\RequirePackage{array,
	multirow,
	tabularx}								%% amélioration des tableaux
\RequirePackage{float}						%% définit les objets flottants tels que les figures et tableaux
\RequirePackage{setspace}					%% modification de l'interligne
\RequirePackage{sectsty}					%% style des section

\RequirePackage[bottom=10em]{geometry}		%% réduit le bas de page pour pouvoir numéroté les pdf insérés (réduire plus si nécessaire)

%%% mathématiques, physique, chimie (à adapter)
\RequirePackage{amsthm,
	amssymb,
	amsbsy,
	amsmath,
	amsfonts,
	amscd}									%% mathématiques
\PassOptionsToPackage{load-configurations = abbreviations}{siunitx}
\RequirePackage{siunitx}					%% unités du système international
\PassOptionsToPackage{version=4}{mhchem}
\RequirePackage{mhchem}						%% chimie

%% charger ce Package en dernier
\RequirePackage{hyperref}					%% pdf interactifs

%%% paramètres
\pagestyle{scrheadings}						%% style de page
\addtokomafont{pagenumber}{\small\sffamily}	%% style de numéro de page

\setcounter{secnumdepth}{3}					%% profondeur des sections numérotées
\setcounter{tocdepth}{2}					%% profondeur des sections dans la table des matières

\graphicspath{{fig/}}						%% chemin vers fichiers images
\floatplacement{figure}{H}					%% placer une figure là où elle a été appelée
\addbibresource{biblio.bib}					%% fichiers sources bibliographiques
\makenomenclature											%% génère la nomenclature
\makeindex[program=makeindex,options=-s these,columns=1]	%% génère l'index

\pdfminorversion=5							%% PDF en version 1.5
\pdfobjcompresslevel 0						%% compression des objets
\pdfcompresslevel 0							%% compression du PDF

\hypersetup{
	%backref=true,							%% ajout de liens (par défaut)
	%pagebackref=true,						%% dans la bibliographie (par défaut)
	%hyperindex=true,						%% dans l'index (par défaut)
	%bookmarks=true,						%% signets Acrobat (par défaut)
	breaklinks=true,						%% retour à la ligne (si lien trop long)
	colorlinks=true,						%% colorise liens
	urlcolor=blue,							%% couleur hyperliens
	citecolor=blue,							%% couleur liens bibliographie
	linkcolor=blue,							%% couleur liens internes
	anchorcolor=blue,						%% couleur liens ancres
	bookmarksopen=false,						%% signets repliés par défaut
	linktocpage=false,						%% lien numéro de page dans TOC
%% métadonnées :							%% ATTENTION à compléter
	pdftitle={Titre},
	pdfauthor={Prénom NOM},
	pdfsubject={Résumé},
	pdfkeywords = {mot clé, keyword, ...},
}

%%% commandes personnelles
\newcommand{\langue}{\emph}					%% mots en langues étrangères en italique
\newcommand{\citital}{\emph}				%% citation en italique

%\renewcommand{\thefootnote}{\alph{footnote}}	%% format de numérotation des notes de bas de page

%% polices et graisse des fontes
\allsectionsfont					{\usefont{T1}{qhv}{b}{n}} 					%% fonte des titres
\renewcommand{\bibfont}				{\usefont{T1}{bch}{m}{n}\selectfont}		%% fonte de la bibliographie

%% TOC
\renewcommand{\cfttoctitlefont}		{\usefont{T1}{qhv}{b}{n}\selectfont\huge}	%% fonte titre title
\renewcommand{\cftchapfont}			{\usefont{T1}{qhv}{b}{n}\selectfont}		%% fonte titre chapter
\renewcommand{\cftsecfont}			{\usefont{T1}{qhv}{m}{n}\selectfont}		%% fonte titre section
\renewcommand{\cftsubsecfont}		{\usefont{T1}{qhv}{m}{n}\selectfont}		%% fonte titre subsection
\renewcommand{\cftsubsubsecfont}	{\usefont{T1}{qhv}{m}{n}\selectfont}		%% fonte titre subsubsection
\renewcommand{\cftchappagefont}		{\cftchapfont}								%% fonte numéro de page chapter
\renewcommand{\cftsecpagefont}		{\cftsecfont}								%% fonte numéro de page section
\renewcommand{\cftsubsecpagefont}	{\cftsubsecfont}							%% fonte numéro de page subsection
\renewcommand{\cftsubsubsecpagefont}{\cftsubsubsecfont}							%% fonte numéro de page subsubsection

\renewcommand{\cftdotsep}{\cftnodots}											%% supprime les pointillés

%% LOF
\renewcommand{\cftfigfont}          {\usefont{T1}{qhv}{m}{n}\selectfont}		%% fonte entrée
\renewcommand{\cftfigpagefont}      {\usefont{T1}{qhv}{m}{n}\selectfont}		%% fonte numéro de page
\setlength{\cftfigindent}{0em}

%% LOT
\renewcommand{\cfttabfont}          {\usefont{T1}{qhv}{m}{n}\selectfont}		%% fonte entrée
\renewcommand{\cfttabpagefont}      {\usefont{T1}{qhv}{m}{n}\selectfont}		%% fonte numéro de page
\setlength{\cfttabindent}{0em}

%% légendes des figures
\renewcommand{\captionfont}         {\usefont{T1}{cmbr}{m}{n}\selectfont}		%% fonte légende
\renewcommand{\captionlabelfont}    {\usefont{T1}{cmbr}{m}{n}\selectfont}		%% fonte étiquette légende

\addto\captionsfrench{\renewcommand\listfigurename{Liste des figures}} 			%% titre de la table des figures

%% notes de fin
%\let\footnote=\endnote							%% passe les footnote en endnote (décommenter)
\def\enoteheading{\chapter*{\notesname
	\@mkboth{\MakeUppercase{\notesname}}{\MakeUppercase{\notesname}}}
	\mbox{}\par\vskip-\baselineskip}
\def\enotesize{\normalsize}
