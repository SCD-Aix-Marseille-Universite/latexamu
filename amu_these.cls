%
% Aix-Marseille Université <@univ-amu.fr>
% Version 0.9 released 04/06/2020
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{amu_these}[2020/06/04 Classe personnelle, V0.9]

%%% classe de base (KOMA-Script)
\LoadClass{scrreprt}						%% classe report KOMA-Script
\KOMAoptions{
	paper=a4,								%% taille du papier
	fontsize=12pt,							%% taille de la police
	DIV=12,									%% taille des marges
	BCOR=0mm,								%% taille de la reliure
	twoside=off,							%% recto-verso
	listof=totoc,							%% LOFT dans la TOC
	index=totoc								%% index dans la TOC
	}

\RequirePackage{lipsum}						%% lorem ipsum (exemple)

%%% extensions minimales
\RequirePackage[utf8]{inputenc}				%% encodage du texte
\RequirePackage[TS1,T1]{fontenc}			%% encodage des fontes
%\RequirePackage{lmodern}					%% polices latines (désactivés)
\RequirePackage{fourier}					%% polices Adobe Utopia (activés)
\RequirePackage[english,main=french]{babel}	%% typographie (français par défaut)
\RequirePackage[babel]{csquotes}			%% guillemets typographiques
\MakeAutoQuote{«}{»}						%% espacement automatique des guillemets

%%% typographie et mise en page
\RequirePackage{scrhack}					%% macros personnalisées (KOMA-Script)
\RequirePackage[
	automark,								%% rappel du titre de chapître en en-tête
	autooneside=false						%% nécessaire pour le rappel du chapître et de la partie en en-tête
	]{scrlayer-scrpage}						%% en-tête/pied de page personnalisés (KOMA-Script)
\RequirePackage{textcomp}					%% symboles complémentaires
\RequirePackage{hyphenat}					%% césure explicite
\RequirePackage{microtype}					%% microtypographie

\RequirePackage[bottom=10em]{geometry}		%% réduit le bas de page pour pouvoir numéroter les pdf insérés (réduire plus si nécessaire)
\RequirePackage{setspace}					%% modification de l'interligne

\pagestyle{scrheadings}						%% style de page
%\setkomafont{disposition}{\bfseries}		%% titrage en police sérif (décommenter)
%\setkomafont{descriptionlabel}{\bfseries}	%% entrée des glossaires en police sérif (décommenter)

%%% tableaux et figures
\RequirePackage{float}						%% définit les objets flottants tels que les figures et tableaux
\RequirePackage{graphicx}					%% graphiques et figures
\RequirePackage[export]{adjustbox}			%% permet de définir une taille minimale ou maximale
\RequirePackage{subfig}						%% figures multiples
\RequirePackage{caption}					%% légendes des figures
\RequirePackage{tabularx}					%% tableaux
\RequirePackage{multirow}					%% fusion des cellules dans les tableaux 
\RequirePackage{makecell}					%% sauts des lignes dans les cellules	
\RequirePackage{array}						%% amélioration des tableaux
\RequirePackage{booktabs}					%% tables formelles
\RequirePackage{tikz}						%% figures en code natif
\usetikzlibrary{decorations.markings}

\floatplacement{figure}{H}					%% placer une figure là où elle a été appelée
\graphicspath{{fig/}{logo/}}				%% chemins vers fichiers images

%%% appareil de référence (sauf glossaires)
\PassOptionsToPackage{						%% options biblatex
	backend=biber,							%% compilateur par défaut pour biblatex
	maxnames=3,								%% nombre max. de noms auteurs
	minnames=3,								%% nombre min. de noms auteurs
	sorting=nyt,							%% trier par nom, année, titre
	citestyle=authoryear,					%% style de citation auteur-année
	bibstyle=alphabetic,					%% style de bibliographie alphabétique
%	bibstyle=iso-authoryear,				%% style de bibliographie ISO 690
	backref=true							%% liens retour des références (cf. p.)
	}
	{biblatex}
\RequirePackage{biblatex}					%% gestion de la bibliographie avec biblatex
\RequirePackage{enotez}						%% notes de fin
\setenotez{
	list-name=Notes,						%% titre des notes
	totoc=chapter,							%% niveau des notes dans la TOC
	backref									%% hyperlien retour des notes
	}
\RequirePackage{imakeidx}					%% index
\RequirePackage{etoc}						%% fonctions pour TOC locale (préférable à minitoc avec KOMA-Script)
\setuptoc{toc}{totoc}						%% ajoute la TOC à la TOC
\newcommand{\chaptertoc}[1][Sommaire]{%		%% définit une commande pour la TOC locale (Sommaire)
	\etocsetnexttocdepth{3}%				%% profondeur de la TOC locale
	\etocsettocstyle{\addsec*{#1}}{}%
	\localtableofcontents%
}

\setcounter{secnumdepth}{3}					%% profondeur des sections numérotées
\setcounter{tocdepth}{2}					%% profondeur des sections dans la table des matières

\addbibresource{biblio.bib}					%% fichiers sources bibliographiques
\makeindex[									%% génère l'index
	program=makeindex,						%% compilateur
	options=-s alpha.ist,					%% paramètre en-têtes alphabétiques
	columns=1,								%% nombre de colonnes
	intoc									%% index dans la TOC
	]

%%% mathématiques, physique, chimie (à adapter)
\RequirePackage{amsmath}					%% formules mathématiques
\RequirePackage{amssymb}					%% symboles mathématiques
\RequirePackage{amsfonts}					%% polices mathématiques

\RequirePackage{xspace}						%% gestions des espaces dans les macros
\RequirePackage{xparse}						%% macros avancées
\RequirePackage{nicefrac}					%% fractions en ligne (voir aussi xfrac)
\RequirePackage{siunitx}					%% unités du système international
\sisetup{									%% options pour les unités
	list-final-separator = { \translate{and} },	
	list-pair-separator  = { \translate{and} },
	output-decimal-marker = {,},
	exponent-product = {\cdot},
	separate-uncertainty = true
	}
\PassOptionsToPackage{version=4}{mhchem}
\RequirePackage{mhchem}						%% chimie

\RequirePackage{physics}					%% physique

%%% PDF
\RequirePackage{pdfpages}					%% insertion de pdf
\RequirePackage{hyperref}					%% pdf interactifs (charger le package hyperref en dernier)

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
	bookmarksopen=false,					%% signets repliés par défaut
	linktocpage=false,						%% lien numéro de page dans TOC
%% métadonnées :							%% ATTENTION à compléter
	pdftitle={Titre},
	pdfauthor={Prénom NOM},
	pdfsubject={Résumé},
	pdfkeywords = {mot clé, keyword, ...},
	}

%%% glossaires
\RequirePackage[
	acronym,								%% liste des acronymes
	xindy,									%% compilateur xindy
	toc,									%% affichage dans la TOC
	style=altlist							%% affichage des entrées
	]
	{glossaries}							%% glossaires (charger le package glossaries après le package hyperref)
\newglossary[nlg]{notation}{not}{ntn}{Nomenclature} % Création d'un type de glossaire 'notation'
\makeglossaries								%% génère les glossaires
\loadglsentries{tex_open/gloss}					%% fichiers sources glossaires

%%% commandes personnelles (macros)
\newcommand{\langue}{\emph}					%% mots en langues étrangères en italique : \langue{framework}
\newcommand{\citital}{\emph}				%% citation en italique : \citital{to be or not to be}
\renewcommand{\mkbegdispquote}[2]{\itshape} %% courte citation en italique : \begin{displayquote} ... \end{displayquote}

\newcommand{\acc}{\ensuremath{\omega ^{2}=\omega ^{2}_{0}+2\alpha \theta}\xspace}
\newcommand{\emiss}[2][]{\ensuremath{\varepsilon_{#2}^{#1}}\xspace}

%%% commandes pour la page de titre
\definecolor{blueamu}{RGB}{0, 101, 189}
\definecolor{cyanamu}{RGB}{61, 183, 228}

\newcommand{\dhorline}[3][0]{%
    \tikz[baseline=-2pt]{\path[decoration={markings, 
      mark=between positions 0 and 1 step 2*#3
      with {\node[color=blueamu, fill, circle, minimum width=#3, inner sep=0pt, anchor=south west] {};}},postaction={decorate}]  (0,#1) -- ++(#2,0);}}
\newcommand{\dvertline}[3][0]{%
    \tikz[baseline=2em]{\path[decoration={markings,
      mark=between positions 0 and 1 step 2*#2
      with {\node[color=black!50, fill, circle, minimum width=#2, inner sep=0pt, anchor=south west] {};}},postaction={decorate}] (0, #1) -- ++(0,#3);}}

\newcommand\titel[1]{{\usefont{T1}{tit}{el}{n} #1 }}
\newcommand\titl[1]{{\usefont{T1}{tit}{l}{n} #1 }}
\newcommand\titm[1]{{\usefont{T1}{tit}{m}{n} #1 }}
\newcommand\titsb[1]{{\usefont{T1}{tit}{sb}{n} #1 }}
\newcommand\titb[1]{{\usefont{T1}{tit}{b}{n} #1 }}
\makeatletter\newcommand\HUGE{\@setfontsize\Huge{28}{0}}\makeatother

%%% reconfigurations personnelles
\addto\captionsfrench{\def\tablename{Tableau}}		%% renomme Table en Tableau dans les légendes

%\renewcommand{\thefootnote}{\alph{footnote}}		%% format de numérotation des notes de bas de page (décommenter)
%\let\footnote=\endnote								%% passe les footnote en endnote (décommenter)

\renewcommand*{\sfdefault}{phv} % sélectionne la fonte Helvetica pour tout le sans sérif (titrage)

%\renewcommand{\familydefault}{\sfdefault} % passe à l'utilisation du sans-serif pour tout sauf les mathématiques (décommenter : vivement déconseillé)
