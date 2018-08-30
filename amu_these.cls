%
% Aix-Marseille Université <@univ-amu.fr>
% Version 0.3 released 01/03/2017
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{amu_these}[2012/07/01 Classe personnelle, V0.2]

%%% classe de base (KOMA-Script)
\LoadClass{scrreprt}						%% classe report KOMA-Script
\KOMAoptions{
	paper=a4,
	fontsize=12pt,
	DIV=12,
	BCOR=0mm,
	twoside=off,
	listof=totoc,
	index=totoc
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
\addtokomafont{pagenumber}{\small\sffamily}			%% numéro de page en police sans-sérif (commenter)
%\setkomafont{disposition}{\normalcolor\bfseries}	%% titrage en police sérif (décommenter)

%%% tableaux et figures
\RequirePackage{float}						%% définit les objets flottants tels que les figures et tableaux
\RequirePackage{graphicx}					%% graphiques et figures
\RequirePackage{caption}					%% légendes des figures
\RequirePackage{tabularx}					%% tableaux
\RequirePackage{multirow}					%% fusion des lignes dans les tableaux 
\RequirePackage{array}						%% amélioration des tableaux
\RequirePackage{booktabs}					%% tables formelles

\floatplacement{figure}{H}					%% placer une figure là où elle a été appelée
\graphicspath{{fig/}}						%% chemin vers fichiers images

%%% appareil de référence
\PassOptionsToPackage{						%% options biblatex
	backend=biber,							%% compilateur par défaut pour biblatex
	maxnames=3,								%% nombre max. de noms auteurs
	minnames=3,								%% nombre min. de noms auteurs
	sorting=nyt,							%% trier par nom, année, titre
	citestyle=authoryear,					%% style de citation auteur-année
	bibstyle=alphabetic,					%% style de bibliographie alphabétique
	backref=true							%% liens retour des références (cf. p.)
	}
	{biblatex}
\RequirePackage{biblatex}					%% gestion de la bibliographie avec biblatex
\RequirePackage{enotez}						%% notes de fin
\setenotez{
	list-name=Notes,
	totoc=chapter,
	backref
	}
\RequirePackage{imakeidx}					%% index
\RequirePackage[intoc]{nomencl}				%% nomenclature
\RequirePackage[titles]{tocloft}			%% TOC LOF LOT

\addbibresource{biblio.bib}					%% fichiers sources bibliographiques
\makenomenclature							%% génère la nomenclature
\makeindex[									%% génère l'index
	program=makeindex,
	options=-s these,
	columns=1,
	intoc
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

%%% paramètres
\setcounter{secnumdepth}{3}					%% profondeur des sections numérotées
\setcounter{tocdepth}{2}					%% profondeur des sections dans la table des matières


%%% commandes personnelles
\newcommand{\langue}{\emph}					%% mots en langues étrangères en italique
\newcommand{\citital}{\emph}				%% citation en italique

%\renewcommand{\thefootnote}{\alph{footnote}}		%% format de numérotation des notes de bas de page (décommenter)
%\let\footnote=\endnote								%% passe les footnote en endnote (décommenter)


