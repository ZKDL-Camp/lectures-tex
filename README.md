# :teacher: ZKDL Camp Lecture Notes

This is a series of lectures on zero-knowledge conducted internally at Distributed Lab, in which we explained from scratch how SNARKs (Groth16, PLONK), STARKs, Bulletproofs (in the future, perhaps also Folding schemes) work.

It is important that this course is designed for a full low-level understanding of these protocols and, accordingly, all the mathematics on which the protocols are based. That is why the course covers both zk itself and its application, directly, but also the basic level of mathematics needed to understand zk and cryptography in general.

## :open_file_folder: Structure

| Folder/File | Description |
| --- | --- |
| [`lectures`](lectures) | Contains the written material for the lectures: both `.tex` and compiled `.pdf` files. If you want to add your lecture, you need to navigate to this folder. |
| [`lectures/images`](lectures/images) | Contains images used in the lectures. |
| [`presentations`](presentations) | Contains the beamer presentations for the lectures. |
| [`zkdl-template.cls`](zkdl-template.cls) | The style file for the lectures. Do not touch unless needed. |
| [`lecture-notes.tex`](lecture-notes.tex) | The compilation of all lectures. Uses lecture files from [`lectures`](lectures) and compiles them into a single file [`lecture-notes.pdf`](lecture-notes.pdf) |
| [`topics.tex`](topics.tex) | The list of topics to be covered in the lectures. |

## :running_man: Setup to run locally

1. Download LaTeX locally (e.g. [TeX Live](https://www.tug.org/texlive/), if you are using MacOS: [MacTex](https://www.tug.org/mactex/)).
2. Download relevant VSCode extensions: LaTex, LaTex Workshop etc.
3. Clone the repository.
4. Open in VSCode and run the `lecture-notes.tex` file (green arrow at the top of the window).

## :books: How to add your lecture?

1. Conduct the steps above and make sure you can compile everything locally.
2. Create a new `.tex` file in the [`lectures`](lectures) folder. Name it `<number>-<topic>.tex`, where `<number>` is the next number in the sequence.
3. Add lecture to the [`lecture-notes.tex`](lecture-notes.tex) file. For example, if the code looks as:

    ```tex
    \section{Mathematics Preliminaries}

    \subfile{lectures/1-math}

    \section{Elliptic Curves}

    \subfile{lectures/2-ec}
    ```

    and you want to add `lectures/3-commitment-schemes`, you do

    ```tex
    \section{Mathematics Preliminaries}

    \subfile{lectures/1-math}

    \section{Elliptic Curves}

    \subfile{lectures/2-ec}

    \section{Commitment Schemes}

    \subfile{lectures/3-commitment-schemes}
    ```

4. To add the presentation, navigate to the [`presentations`](presentations) folder and add the same name as for
your lecture file.
