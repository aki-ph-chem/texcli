TEX = platex
PDF = dvipdfmx
f = main

${f}.pdf : ${f}.dvi
	${PDF} $<

${f}.dvi : ${f}.tex
	${TEX} $< 

opn :
	mupdf ${f}.pdf &

.PHONY : opn
