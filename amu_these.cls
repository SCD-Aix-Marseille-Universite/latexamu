%
% amu_these v0.1
% Aix-Marseille Université <@univ-amu.fr>
% Version 0.2 released 01/07/2012
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{amu_these}[2012/01/01 Classe personnelle, V0.1]
 
% classe de base (KOMA-Script)
 
\LoadClass[paper=a4,fontsize=12pt,DIV=12,BCOR=0mm,twoside=off]{scrreprt}

% extensions minimales

\RequirePackage[T1]{fontenc} % fontes de caractère
\RequirePackage[utf8]{inputenc} % format d'encodage
\RequirePackage{lmodern} % fontes latin modern
\RequirePackage[french]{babel} % typographie française

% extensions compémentaires

\RequirePackage{graphicx} % graphiques et figures
\RequirePackage{pdfpages} % insertion de pdf
\RequirePackage{caption} % légendes des figures
\RequirePackage[ocgcolorlinks]{hyperref} % pdf interactifs
\RequirePackage{setspace} % modification de l'interligne
\RequirePackage[backend=biber, sorting=nyt, style=authoryear]{biblatex} % nouvelle façon de gérer ses bibliographies sous LaTeX
%\RequirePackage[]{natbib} % citations de type auteur-année et numérique
%\RequirePackage[babel]{csquotes} % à voir +
\RequirePackage{scrhack} % redéfinition des macros (KOMA-Script)
\RequirePackage{scrpage2} % en-tête et les pied de page personnalisé (KOMA-Script)

\RequirePackage{lipsum} % Lorem ipsum pour l'exemple

\RequirePackage[titles]{tocloft} % TOC+
\RequirePackage{sectsty} % style section+
\allsectionsfont{\usefont{T1}{qhv}{b}{n}} % +
%\RequirePackage{fancyhdr} % en-tête et les pied de page personnalisé
\RequirePackage{float} % définit les objets flottants tels que les figures et tableaux
\floatplacement{figure}{H} % placer une figure là où elle a été appelée

\RequirePackage{amsthm,amssymb,amsbsy,amsmath,amsfonts,amssymb,amscd} % mathematiques
\PassOptionsToPackage{version=3}{mhchem}
\RequirePackage{mhchem} % chimie


% paramètres

\pdfobjcompresslevel 0 % compression des objets
\pdfcompresslevel 0 % compression du PDF

\setcounter{secnumdepth}{3} % profondeur des sections numérotées 
\setcounter{tocdepth}{2} % profondeur des sections dans la table des matières

\hypersetup{
    backref=true, % permet d'ajouter des liens dans...
    pagebackref=true, % ...les bibliographies 
    hyperindex=true, % ajoute des liens dans les index.
    colorlinks=true, % colorise les liens 
    breaklinks=true, % permet le retour à la ligne dans les liens trop longs 
    urlcolor= blue, % couleur des hyperliens
    citecolor=blue, % couleur des liens des références
    linkcolor= blue, % couleur des liens internes 
    bookmarks=true, % créé des signets pour un lecteur de PDF 
    bookmarksopen=true, % si les signets sont créés, les afficher complètement
    pdftitle={Titre}, % informations apparaissant dans...
    pdfauthor={Prénom NOM}, % ...dans les informations du document...
    pdfsubject={Sujet}, % ...sous un lecteur de PDF
    pdfkeywords = {mot clé, keyword, ...}, % Mots-clés
    linktocpage=true % lien sur le numéro de page pour césure des titres longs
}

\pagestyle{scrheadings} % style de page
\graphicspath{{fig/}} % chemin vers les fichiers images
\addbibresource{biblio} % chargement des fichiers de sources bibliographiques

% commandes personnelles

\newcommand{\langue}{\emph} % mots en langues étrangères
\newcommand{\citital}{\emph} % citation en italique

% TOC
\renewcommand{\cfttoctitlefont} % ToC title
             {\usefont{T1}{qhv}{b}{n}\selectfont\huge}
\renewcommand{\cftchapfont} % chapter titles
             {\usefont{T1}{qhv}{b}{n}\selectfont}
\renewcommand{\cftsecfont} % section titles
             {\usefont{T1}{qhv}{m}{n}\selectfont}
\renewcommand{\cftsubsecfont} % subsection titles
             {\usefont{T1}{qhv}{m}{n}\selectfont}
\renewcommand{\cftsubsubsecfont} % subsubsection titles
             {\usefont{T1}{qhv}{m}{n}\selectfont}           
\renewcommand{\cftchappagefont} % chapter page numbers
             {\usefont{T1}{qhv}{b}{n}\selectfont}
\renewcommand{\cftsecpagefont} % section page numbers
             {\cftsecfont} 
\renewcommand{\cftsubsecpagefont} % subsection page numbers
             {\cftsubsecfont}
\renewcommand{\cftsubsubsecpagefont} % subsubsection page numbers
             {\cftsubsubsecfont}

\renewcommand{\cftdotsep}{\cftnodots} % supprime les pointillés dans la TOC


\renewcommand{\captionfont} % légendes
             {\usefont{T1}{qhv}{m}{n}\selectfont}
\renewcommand{\captionlabelfont} % étiquettes des légendes
             {\usefont{T1}{qhv}{m}{n}\selectfont}
             
\addtokomafont{pagenumber}{\small\sffamily} % style de numero de page