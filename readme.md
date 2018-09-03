## Compilation

Install [TeX Live](http://www.tug.org/texlive/acquire-netinstall.html) in the usual way.

compile with
```bash
pdflatex these
biber these
makeindex these
makeglossaries these
pdflatex these
pdflatex these

makeindex these
makeglossaries these
pdflatex these
```

or use [Latexmk](https://mg.readthedocs.io/latexmk.html) and add the following lines to some .latexmkrc initialization file (already done in repo):
```bash
add_cus_dep('glo', 'gls', 0, 'run_makeglossaries');
add_cus_dep('acn', 'acr', 0, 'run_makeglossaries');

sub run_makeglossaries {
  if ( $silent ) {
    system "makeglossaries -q '$_[0]'";
  }
  else {
    system "makeglossaries '$_[0]'";
  };
}
$clean_ext = "acn acr alg glg glo gls nlg nlo ntn xdy run.xml not bbl";
```
then compile with
```bash
latexmk -pdf
```
and erase temp files with
```bash
latexmk -c
```

## Contributing

[Bug reports and pull requests are welcome on GitHub](https://github.com/SCD-Aix-Marseille-Universite/latexamu).
