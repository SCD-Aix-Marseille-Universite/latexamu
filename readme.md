## Compilation with TeX Live

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

## Compilation with TexMaker
For users of [TexMaker](https://www.xm1math.net/texmaker/index.html) combined with [MikTeX](https://miktex.org/)
First open the MikTeX Console and go to update and check for available update and update if any are available.

if you intend to make use of the glossary install [perl](https://www.perl.org/get.html) for your OS.

Open texMaker and open your these.tex file.

A bit of configuration is required: go into Options/Configure Texmaker
In the Commands menu / tab look for Bib(la)tex and change the content of the field to 
```bash
biber %
```
Select OK

makeglossaries is not there by default you need to have installed perl and go to User/User Commands/Edit User Commands.
Choose one of the command in Menu Item field enter:
```bash
makeglossaries
```
In the field command enter:
```bash
makeglossaries %
```
Select OK.

Now you can compile like for texLive:
```bash 
PDFLaTex
BibTeX
MakeIndex
makeglossaries
PDFLatex
PDFLatex
View PDF
```

In the future you can recompile everything with the above sequence.
Or in User/User Commands/Edit User Commands
Choose a command and in the field Menu Item enter a command name e.g.:
```bash
AMUCompile
```
and in the Command Field enter:
```bash
pdflatex -synctex=1 -interaction=nonstopmode %.tex|biber %|makeindex %.idx|makeglossaries %|pdflatex -synctex=1 -interaction=nonstopmode %.tex|pdflatex -synctex=1 -interaction=nonstopmode %.tex|"C:/Program Files/Adobe/Reader 11.0/Reader/AcroRd32.exe" %.pdf
```

If you do not need to recompile the glossary or the index customise this command for your need.


## Contributing

[Bug reports and pull requests are welcome on GitHub](https://github.com/SCD-Aix-Marseille-Universite/latexamu).
