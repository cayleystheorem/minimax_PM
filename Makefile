all 	: pap.pdf 

pap.pdf : pap.tex
	rubber --pdf $<

pap_final.pdf : pap_final.tex
	rubber --pdf $<

submit  : paper.pdf appendix.pdf

paper.pdf: pap.pdf
	pdftk $< cat 1-9 output $@

appendix.pdf: pap.pdf
	pdftk $< cat 10-end output $@

clean	:
	  -rm -f $(PDF:%.pdf=%.aux) $(PDF:%.pdf=%.bbl) $(PDF:%.pdf=%.blg) $(PDF:%.pdf=%.log) $(PDF:%.pdf=%.out) $(PDF:%.pdf=%.idx) $(PDF:%.pdf=%.ilg) $(PDF:%.pdf=%.ind) $(PDF:%.pdf=%.toc) $(PDF:%.pdf=%.d) $(PDF:%.pdf=%.dvi) $(PDF:%.pdf=%.ps)

veryclean	:
	  -rm -f $(PDF)
	  make clean
