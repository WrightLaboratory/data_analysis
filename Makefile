index.html: notebooks/data_analysis.ipynb Makefile
	jupyter nbconvert --to slides \
         --output-dir=./docs \
         --output=index \
         --execute \
         --reveal-prefix "https://cdnjs.cloudflare.com/ajax/libs/reveal.js/3.1.0" \
         notebooks/data_analysis.ipynb;\
         mv docs/index.slides.html docs/$@

clean: 
	rm index.html
