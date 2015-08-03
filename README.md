# Report LaTeX Template for Texas Intruments Contests

This repository contains a template for TI contests, such as the European Analog Design Contest. It should fulfill all formal requirements. Nevertheless, it is good practice to recheck if the formal requirements for a specific contest are really fulfilled. The requirements may change over time and we are not responsible for fulfilling the requirements in your specific case.

## Building

The template comes with a small *Makefile*. Just use `make` to build the sample. The *Makefile* can be easily extended to cover your dependencies and create your document in a custom way.

Currently the *Makefile* builds the LaTeX source three times. After the first run the bibliography is constructed. A `clean` target to remove output files (temporary **and** permanent) is included. The *.gitignore* file is also set to ignore such files from the VCS's perspective.

## Using the Template

The template is named `tireport`. It can be used by specifying `\documentclass{tireport}` as document class. Parts of the document rely on special settings. Other parts are fully optional and can be accessed by using special commands, described in the next section.

To define special properties of your report you need to use the following commands:

    \title{Sets the title for the project}
    \projectpic{Path to the project's picture}
    \author{Name the primary author here}
    \coauthor{Name the co-author(s) here}
    \advisor{Name your advisor here}
    \teampic{Path to the team's picture}
    \university{Name of your university}
    \unilogo{Path to the university's logo}
    \tilogo{Path to Texas Instrument's logo}
    \contest{Name of the contest to participate in}
    \date{The date of submission}

The commands should be inserted **before** starting a new document using `\begin{document}`. They are most used at the title page, which is optional. Hence some of these commands may be in fact optional, but it is good practice to define them anyway. You can also use them in your own title page or text. Every command maps to a output command starting with *the*, e.g., `\title` (input) maps to `\thetitle` (output).

## Special Commands

You can use the `abstract` region for defining your abstract.

    \begin{abstract}
    ...
    \end{abstract}

If you want to include parts on the title page, just use the following snippet:

    \usepart{Quantity}{Name}{Url}

After all parts have been defined (abstract and parts), use the ordinary `\maketitle` to generate the title page. There is no automatic page break, so a `\newpage` may be wanted.

Finally there is the `\inputtikz` command. The command allows treatment of TikZ drawing similar to `\includegraphics`.

Let's see an example:

    \inputtikz{0.8\textwidth}{images/blockdiagram}

This example is equivalent to the following `\includegraphics` instruction, except that instead of using *blockdiagram.tex*, we use *blockdiagram.pdf* as image source.

    \includegraphics[width=0.8\textwidth]{images/blockdiagram.pdf}

## License

### The LaTeX Project Public License

LPPL Version 1.3c  2008-05-04

Copyright 1999 2002-2008 LaTeX3 Project