## Compilation

Install [TeX Live](http://www.tug.org/texlive/acquire-netinstall.html) in the usual way.

```bash
pdflatex these.tex
biber these
makeindex these.nlo -s nomencl.ist -o these.nls -t these.nlg
makeindex these.idx -s these.ist
pdflatex these.tex
pdflatex these.tex
```
## Contributing

[Bug reports and pull requests are welcome on GitHub](https://github.com/SCD-Aix-Marseille-Universite/latexamu).