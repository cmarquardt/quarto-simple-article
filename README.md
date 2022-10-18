# Simple Article Template for Quarto

This is a Quarto template that assists you in creating in simple, journal article-like document. The template allows both single and two-column output.

## Creating a New Article

You can use this as a template to create a document by using the following command:

```bash
quarto use template cmarquardt/quarto-simple-article
```

This will install the extension and create an example `.qmd` file, along with a `bibiography.bib` file that you can use as a starting place for your article.

## Installation For An Existing Document

You may also use this format with an existing Quarto project or document. From the Quarto project or document directory, run the following command to install this format:

```bash
quarto install extension cmarquardt/quarto-simple-article
```

## Usage

To use the format, you can use the format names `simple-article-pdf` and `simple-article-html`. For example:

```bash
quarto render article.qmd --to simple-article-pdf
```

or in your document yaml

```yaml
format:
  pdf: default
  simple-article-pdf:
    keep-tex: true    
```

You can view a preview of the rendered template at <https://cmarquardt.github.io/quarto-simple-article/>.

## Format Options

The simple article format supports a number of options for customizing the format and appearance of the document. 
Specify these under the `classoption` key.

 - `twoside` - use two-sided output.
 - `twocolumn` -  use two-coloumn output; this option should be used together should be used together with a reduced font size (and possibly narrower margins).
 - `9pt`, `11pt`,... - font size for normal text; 9pt is useful for twocolumn output while other font sizes supported by the `extsizes` package will also work (default: 10pt).
 - `narrowmargins` - use narrow margins; possibly useful for twocolumn articles.
 - `normalnumbers` - use normal numbers for sectioning (default are roman numbers).
 - `lucida` - use the commercially available (from the TUG) Lucida fonts; this requires Lua/XeLaTeX (default: Palatino for pdfLaTeX or TeX Gyre Pagella for Lua/XeLaTeX).
 - `phfthm` - provide theorem and proof environments from the phfthm package.

For two-column output, I also recommend non-indented paragraphs (use the ìndent` parameter for the output format). An example:

``` yaml
format:
  simple-article-pdf:
    indent: false
    classoption: 
     - 9pt
     - lucida
     - twocolumn
     - twoside
```
## Limitations

Support for LaTeX tables is currently broken in the two-column output.
