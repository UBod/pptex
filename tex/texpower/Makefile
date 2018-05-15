MKDIR=mkdir
COPY=cp
MOVE=mv
RM=rm -r
CHDIR=cd
ZIP=zip -9
INSTALLDIRVAR=TEXMFMAIN

all: texpower

texpower: documentation

unpack: 			# Not used yet.
	latex texpower.ins 

texpower.drv: unpack		# Not used yet.

documentation: # texpower.drv
	($(CHDIR) doc; \
	  for what in *demo.tex ; \
	   do pdflatex $$what; pdflatex $$what; \
	  done; \
	  pdflatex manual; \
	  pdflatex manual; \
	  pdflatex FAQ-display; \
	  pdflatex FAQ-display; \
	  pdflatex FAQ-printout; \
	  pdflatex FAQ-printout; \
	  for what in `ls *tex | grep '^[^_]'` ; \
	   do pdflatex $$what; \
	  done; \
	  if which distill | grep "no " ; \
	  then \
	    echo Adobe Distiller not found. ; \
	  else \
	    latex fulldemo; \
	    dvips -Pwww -j0 fulldemo; \
	    distill fulldemo.ps ; \
	  fi \
	)

install: # unpack
	( \
	TEXMF=`kpsewhich -expand-var '$$$(INSTALLDIRVAR)'`; \
	echo installing to $${TEXMF}/tex/latex/texpower; \
	$(MKDIR) $${TEXMF}/tex/latex/texpower; \
	$(COPY) *.sty *.cls *.cfg $${TEXMF}/tex/latex/texpower \
	)

clean:
	-$(RM) *~ *.aux *.toc *.dvi *.ps *.log *.tmp *.out 
	-$(CHDIR) doc; $(RM) auto *~ *.aux *.log *.dvi *.ps *.toc *.tmp *.out 

distrib: clean; \
	($(CHDIR) ..; \
	$(ZIP) texpower-doc \
	texpower/doc/*.tex \
	texpower/doc/*.cfg \
	texpower/doc/*.eps \
	texpower/doc/*.pdf; \
	$(ZIP) texpower-src \
	texpower/*.txt \
	texpower/*.sty \
	texpower/*.cls \
	texpower/*.cfg \
	texpower/Makefile; \
	$(ZIP) texpower \
	texpower/*.txt \
	texpower/*.sty \
	texpower/*.cls \
	texpower/*.cfg \
	texpower/Makefile \
	texpower/doc/*.tex \
	texpower/doc/*.cfg \
	texpower/doc/*.eps \
	texpower/doc/*.pdf; \
	$(MOVE) texpower-src.zip texpower-doc.zip texpower.zip texpower \
	)

