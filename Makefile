all: main.pdf

main.pdf: main.tex
	latexmk -quiet -xelatex -synctex=1 main.tex

watch: main.tex
	latexmk -pvc -quiet -xelatex -synctex=1 main.tex

clean:
	latexmk -CA -quiet
	rm -f *.maf *.mtc* *.ptc

cloc: clean
	cloc . --exclude-ext sty

release: main.pdf
	mv main.pdf ..
	make clean
	7z a src.7z .
	mv src.7z ..
