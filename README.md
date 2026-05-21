# Markdown CV
Write the content of your CV in Markdown and style is using [Context](https://en.wikipedia.org/wiki/ConTeXt)!

Why? Makes it easy to tailor your CV or maintain a CV in multiple languages.

Also to be honest, I found it a lot more fun tweaking the Context style than using traditional text processers.


```
cv-content.md → pandoc → context → cv-content.pdf
                  ↑
          chmduquesne.tex
```

## Features
- [Markdown-metadata](https://pandoc.org/demo/example33/8.10-metadata-blocks.html) supported styling: Your personal details, photo and highlighted competences are all defined in the markdown file. There's no need to change the Context file!
- Docker container running Context saves you having to install it on your own system


## Example
See [bohr.pdf](./bohr.pdf).


## Acknowledgements
- [pandoc\_resume](https://github.com/mszep/pandoc_resume/tree/master) for proof-of-concept. I started based on its Context style-file and there are still some remnants left in it. Sadly it seems the project has been abandoned and no longer works after [a change](https://github.com/jgm/pandoc/issues/5539) in pandoc . 
