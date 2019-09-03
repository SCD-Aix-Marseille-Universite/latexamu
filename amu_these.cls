%
% Aix-Marseille Université <@univ-amu.fr>
% Version 0.3 released 01/03/2017
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{amu_these}[2012/07/01 Classe personnelle, V0.2]

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
\RequirePackage{lmodern}					%% polices latines
\RequirePackage[english,french]{babel}		%% typographie (français par défaut)
\RequirePackage[babel]{csquotes}			%% guillemets typographiques
\MakeAutoQuote{«}{»}						%% espacement automatique des guillemets

%%% typographie et mise en page
\RequirePackage{scrhack}					%% macros personnalisées (KOMA-Script)
\RequirePackage{scrlayer-scrpage}			%% en-tête/pied de page personnalisés (KOMA-Script)
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
\RequirePackage{multirow}					%% fusion des lignes dans les tableaux 
\RequirePackage{array}						%% amélioration des tableaux
\RequirePackage{booktabs}					%% tables formelles

\floatplacement{figure}{H}					%% placer une figure là où elle a été appelée
\graphicspath{{fig/}}						%% chemin vers fichiers images

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
\RequirePackage[titles,subfigure]{tocloft}	%% fonctions pour TOC LOF LOT
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
	options=-s these,						%% paramètres
	columns=1,								%% nombre de colonnes
	intoc									%% index dans la TOC
	]

%%% mathématiques, physique, chimie (à adapter)
\RequirePackage{amsmath}					%% formules mathématiques
\RequirePackage{amssymb}					%% symboles mathématiques
\RequirePackage{amsfonts}					%% polices mathématiques

\RequirePackage{xspace}
\RequirePackage{nicefrac}		% Fractions 'inline'

\PassOptionsToPackage{load-configurations=abbreviations}{siunitx}
\RequirePackage{siunitx}					%% unités du système international
\PassOptionsToPackage{version=4}{mhchem}
\RequirePackage{mhchem}						%% chimie

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
\loadglsentries{tex/gloss}					%% fichiers sources glossaires

%%% commandes personnelles
\newcommand{\langue}{\emph}					%% mots en langues étrangères en italique
\newcommand{\citital}{\emph}				%% citation en italique

\newcommand{\acc}{\ensuremath{\omega ^{2}=\omega ^{2}_{0}+2\alpha \theta}\xspace}
\newcommand{\emiss}[2][]{\ensuremath{\varepsilon_{#2}^{#1}}\xspace}

%\renewcommand{\thefootnote}{\alph{footnote}}		%% format de numérotation des notes de bas de page (décommenter)
%\let\footnote=\endnote								%% passe les footnote en endnote (décommenter)

%\renewcommand*{\sfdefault}{phv} % sélectionne la fonte Helvetica pour tout le sans sérif (décommenter)
%\renewcommand*{\rmdefault}{bch} % sélectionne la fonte Charter pour tout le sérif sauf les mathématiques (décommenter)

%\renewcommand{\familydefault}{\sfdefault} % passe à l'utilisation du sans-serif pour tout sauf les mathématiques (décommenter : vivement déconseillé)