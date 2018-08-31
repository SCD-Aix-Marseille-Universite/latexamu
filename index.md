### Modèle de mise en page.
Ce modèle de mise en page pour les thèses de doctorat soutenues à Aix Marseille Université propose un ensemble de fichiers LaTeX commentés, prêt à être compilés dont une classe LaTeX [.cls].

[Télécharger le PDF](https://raw.githubusercontent.com/SCD-Aix-Marseille-Universite/latexamu/gh-pages/these.pdf)

La page de titre a obtenu l'approbation du Collège Doctoral Aix-Marseille Université.

### Distribution LaTeX

La distribution LaTeX utilisée/recommandée est la [TeX Live](http://www.tug.org/texlive/acquire-netinstall.html).

### Résumé des fonctionnalités du document

* fichiers sources commentés
* typographie européenne (KOMA-Script)
* sommaire, glossaires et index avec hyperliens
* listes des figures et des tableaux
* bibliographie et notes de fin avec hyperliens
* signets dans le paneau latéral gauche
* titrage consistant sur tout le document
* numérotation des pages et du PDF identique
* numérotation continue sur les PDF insérés
* PDF 1.5 conforme pour archivage pérenne au CINES

### Conformation du fichier

Lors du dépôt légal de votre thèse, si le fichier PDF compilé avec pdflatex est rejeté comme non conforme par le service [Facile](https://facile.cines.fr/) pour archivage au CINES. Vous pouvez le conformer avec une simple commande ghostscript.

```
gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.5 -dNOPAUSE -dQUIET -dBATCH -sOutputFile=these-valide.pdf these.pdf
```
