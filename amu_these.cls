%
% Aix-Marseille Université <@univ-amu.fr>
% Version 0.2 released 01/07/2012
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{amu_these}[2012/07/01 Classe personnelle, V0.2]

% classe de base (KOMA-Script)
\LoadClass{scrreprt}					%% report (KOMA-Script)
\KOMAoptions{paper=a4,fontsize=12pt,DIV=12,BCOR=0mm,twoside=off}

% extensions minimales
\RequirePackage[T1]{fontenc}			%% fontes de caractère
\RequirePackage[utf8]{inputenc}		%% format d'encodage
\RequirePackage{lmodern}				%% fontes latin modern
\RequirePackage[french]{babel}		%% typographie française
\RequirePackage[babel]{csquotes}		%%  guillemet

\RequirePackage{lipsum}				%% lorem ipsum (exemple)

% extensions complémentaires
\RequirePackage{scrhack,scrpage2}	%% macros et en-tête/pied de page personnalisés (KOMA-Script)
\PassOptionsToPackage{
	backend=biber,
	maxnames=3,
	minnames=3,
	sorting=nyt,
	citestyle=authoryear,
	bibstyle=numeric}{biblatex}
\RequirePackage{biblatex}			%% nouvelle façon de gérer ses bibliographies sous LaTeX
\RequirePackage{makeidx}				%% création d'index
\RequirePackage[titles]{tocloft}		%% TOC LOF LOT
\RequirePackage{endnotes,hyperendnotes}	%% notes de fin
\RequirePackage{pdfpages}			%% insertion de pdf
\RequirePackage{graphicx}			%% graphiques et figures
\RequirePackage{caption}				%% légendes des figures
\RequirePackage{array,multirow,tabularx}	%% amélioration des tableaux
\RequirePackage{float}				%% définit les objets flottants tels que les figures et tableaux
\RequirePackage{setspace}			%% modification de l'interligne
\RequirePackage{sectsty}				%% style des section

\RequirePackage{amsthm,amssymb,amsbsy,amsmath,amsfonts,amscd} %% mathématiques
\RequirePackage[squaren,Gray,cdot]{SIunits} %% unités du système international
\PassOptionsToPackage{version=3}{mhchem}
\RequirePackage{mhchem}				%% chimie

\RequirePackage{hyperref}			%% pdf interactifs (charger ce Package en dernier)

% paramètres
\pagestyle{scrheadings}				%% style de page
\addtokomafont{pagenumber}{\small\sffamily}	%% style de numero de page

\setcounter{secnumdepth}{3}			%% profondeur des sections numérotées 
\setcounter{tocdepth}{2}				%% profondeur des sections dans la table des matières

\graphicspath{{fig/}}				%% chemin vers fichiers images
\floatplacement{figure}{H}			%% placer une figure là où elle a été appelée
\addbibresource{biblio.bib}			%% fichiers sources bibliographiques
\makeindex							%% index

\pdfobjcompresslevel 0				%% compression des objets
\pdfcompresslevel 0					%% compression du PDF

\hypersetup{
	backref=true,					%% ajout de liens
	pagebackref=true,				%% dans bibliographie
	hyperindex=true,					%% dans index
	colorlinks=true,					%% colorise liens
	breaklinks=true,					%% retour à la ligne (si lien trop long)
	urlcolor= blue,					%% couleur hyperliens
    citecolor=blue,					%% couleur liens bibliographie
	linkcolor= blue,					%% couleur liens internes
	bookmarks=true,					%% signets Acrobat
    bookmarksopen=false,				%% signets repliés par défaut
    linktocpage=false,				%% lien numéro de page dans TOC
	%% métadonnées :
	pdftitle={Titre},
	pdfauthor={Prénom NOM},
	pdfsubject={Sujet},
	%% mots-clés :
	pdfkeywords = {mot clé, keyword, ...},  
}

% commandes personnelles
\allsectionsfont{\usefont{T1}{qhv}{b}{n}} %% font

\newcommand{\langue}{\emph}			%% mots en langues étrangères en italique
\newcommand{\citital}{\emph}			%% citation en italique
\renewcommand{\thefootnote}			%% format de numérotation des notes de bas de page
             {\alph{footnote}}
\renewcommand{\bibfont}				%% bibliography font
             {\usefont{T1}{bch}{m}{n}\selectfont}
%% TOC             
\renewcommand{\cfttoctitlefont}		%% TOC title font
             {\usefont{T1}{qhv}{b}{n}\selectfont\huge}
\renewcommand{\cftchapfont}			%% chapter titles font
             {\usefont{T1}{qhv}{b}{n}\selectfont}
\renewcommand{\cftsecfont}			%% section titles font
             {\usefont{T1}{qhv}{m}{n}\selectfont}
\renewcommand{\cftsubsecfont}		%% subsection titles font
             {\usefont{T1}{qhv}{m}{n}\selectfont}
\renewcommand{\cftsubsubsecfont}		%% subsubsection titles font
             {\usefont{T1}{qhv}{m}{n}\selectfont}           
\renewcommand{\cftchappagefont}		%% chapter page numbers font
             {\usefont{T1}{qhv}{b}{n}\selectfont}
\renewcommand{\cftsecpagefont}		%% section page numbers font
             {\cftsecfont} 
\renewcommand{\cftsubsecpagefont}	%% subsection page numbers font
             {\cftsubsecfont}
\renewcommand{\cftsubsubsecpagefont}	%% subsubsection page numbers font
             {\cftsubsubsecfont}
\renewcommand{\cftdotsep}{\cftnodots}	%% supprime les pointillés

%% LOF
\renewcommand{\cftfigfont}			%% entry font
             {\usefont{T1}{qhv}{m}{n}\selectfont}
\renewcommand{\cftfigpagefont}		%% numbers font
             {\usefont{T1}{qhv}{m}{n}\selectfont}
             
%% LOT
\renewcommand{\cfttabfont} % entry font
             {\usefont{T1}{qhv}{m}{n}\selectfont}
\renewcommand{\cfttabpagefont} % numbers font
             {\usefont{T1}{qhv}{m}{n}\selectfont}

%% légendes des figures
\renewcommand{\captionfont} %% fonte des légendes
             {\usefont{T1}{cmbr}{m}{n}\selectfont}
\renewcommand{\captionlabelfont} %% fonte des étiquettes des légendes
             {\usefont{T1}{cmbr}{m}{n}\selectfont}

\addto\captionsfrench{\renewcommand\listfigurename{Liste des figures}} %% titre de la table des figure

%% notes de fin
\def\enoteheading{\chapter*{\notesname
	\@mkboth{\MakeUppercase{\notesname}}{\MakeUppercase{\notesname}}}
	\mbox{}\par\vskip-\baselineskip}
\def\enotesize{\normalsize}