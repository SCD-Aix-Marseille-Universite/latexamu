This repository was forked from [SCD-Aix-Marseille-Universite/latexamu](https://github.com/SCD-Aix-Marseille-Universite/latexamu) on 2018-06-16.

## Compilation

Install [Texmaker](http://www.xm1math.net/texmaker/) in the usual way.

The compilation script is:

```bash
pdflatex these.tex
biber these
makeindex these.nlo -s nomencl.ist -o these.nls -t these.nlg
makeindex these.idx -s these.ist
pdflatex these.tex
pdflatex these.tex
```
This script can be added to Texmaker by going to **Options > Configure Texmaker > Quick Build > User**
and changing it to 
```
pdflatex %.tex | biber % | makeindex %.nlo -s nomencl.ist -o %.nls -t %.nlg | makeindex %.idx -s %.ist | pdflatex %.tex | pdflatex %.tex
```
