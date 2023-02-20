# ECAMexam latex class for unified exams subjects

This repository aims to unify the template for exams subjects for LaTeX users at ECAM LaSalle. It follows the template given as .doc for MS-Word users and therefore may be subject to change in the near future.

## The ecamexam.cls file

The `ecamexam` class file is derived from the `exam` class available on CTAN. Therefore it uses the environnements defined in this parent class for typesetting questions. The only options specific to `ecamexam` are ``\documentclass[french]{ecamexam}`` or same with `english`. It switches the titles of the different parts as well as the numbering for each pages an typos (hyphenation etc.).

The `ecamexam.cls` file is the latex class file and therefore is the only file that needs to be modify. The file `template_test_class.tex` should not be modified as it is the Minimum Working Example (MWE) and serves as test file for the modification done in the class file.

## Macro implemented (2023/02/14)

### The coverpage
For the coverpage several macros have been implemented:

```\UE{<name of the UE>}
\duree{<duration of the exam>}
\dateDS{<date of the exam>}
\promo{<name of the promo>}
\anneediplome{<year of graduation>}
\sujetDS{<title of the exam>}
\intro{<introduction written on coverpage>}
\consigne{<first instruction to be shown>}
\consigne{<second instruction to be shown>}
```

These macros have to be set in the preambule as shown in the MWE.

The specific instructions that need to be in the coverpages are set with the macro `\consigne{}` that needs to be called as many times as instructions to be written.

The coverpage is then printed with `\makecover`

### For the main document
The `exercice` macro creates the title of an exercize and automatically increment the exercize number:

``\exercice{Title of the exercize}``

The `exercicebonus` macro creates an unnumbered exercize named "BONUS":

``\exercicebonus``

## Roadmap

- [ ] Ajouter la possibilité de mettre les consignes sur deux colonnes
- [ ] Réparer l'affichage de longues consignes
- [ ] Uploader la class sur CTAN (in progress)
