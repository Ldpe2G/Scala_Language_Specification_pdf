Convert [Scala Language Specification](https://www.scala-lang.org/files/archive/spec/2.13/) [markdown files](https://github.com/scala/scala/tree/2.13.x/spec) to [pdf format](https://gist.github.com/justincbagley/ec0a6334cc86e854715e459349ab1446) or epub format.

## Configuration

1. `git clone --recursive https://github.com/Ldpe2G/Scala_Language_Specification_pdf.git`;

2. Install [pandoc](https://pandoc.org/installing.html#linux);

3. Install `pdflatex` and `xelatex` by following command:

```bash
sudo apt-get install texlive-latex-base

sudo apt-get install texlive-latex-extra texlive-fonts-recommended texlive-fonts-extra

sudo apt-get install texlive-xetex

sudo apt install texlive-math-extra
```

## Convert markdown to pdf or epub

Checkout the scala submodule to the version you want and run the `convert.sh` script. Then you should get all the pdf files under the `pdf` folder and the same all the epub files under the `epub` folder. If you get pdf convert error during the conversion, the following answer may help:
https://tex.stackexchange.com/questions/428975/multiple-alignment-inside-cases-environment.

