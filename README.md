# ECAMexam latex class for unified exams subjects

This repository aims to unify the template for exams subjects for LaTeX users at ECAM LaSalle. It follows the template given as .doc for MS-Word users and therefore may be subject to change in the near future.

## The ecamexam.cls file

The `ecamexam.cls` file is the latex class file and therefore is the only file that needs to be modify. The files `template.tex` and `template_test_class` should not be modified as they are Minimum Working Examples (MWE) and served as test files for the modification done in the class file.

## Macro implemented (2023/02/05)

### The coverpage
For the coverpage several macros have been implemented:

`\UE{<name of the UE>}
\duree{<duration of the exam>}
\dateDS{<date of the exam>}
\promo{<year of graduation>}
\annee{<year of the exam>}
\sujetDS{title of the exam}`

These macros have to be set in the preambule as shown in the MWE.

The specific instructions that need to be in the coverpages are set with the macro `\tableauconsigne{Consigne1,Consigne2,Consigne3,...}`. This macro is still a work in progress.

### For the main document
The exercize macro create the title of an exercize and automatically increment the exercize number:

``\exercize{Title of the exercize}``

## Roadmap

- [x] Automatiser le premier bandeau
- [ ] Automatiser la mise en page des consignes
- [ ] Créer une alternative automatique en anglais
- [ ] Uploader la class sur CTAN
