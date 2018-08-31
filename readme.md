## Compilation

Install [TeX Live](http://www.tug.org/texlive/acquire-netinstall.html) or [Texmaker](http://www.xm1math.net/texmaker/) in the usual way.

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

## Contributing

[Bug reports and pull requests are welcome on GitHub](https://github.com/SCD-Aix-Marseille-Universite/latexamu).
