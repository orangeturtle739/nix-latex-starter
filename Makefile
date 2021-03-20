all : $(wildcard *)
	latexmk -pdf < /dev/null
clean :
	latexmk -C < /dev/null
