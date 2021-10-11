index.html: notebooks/data_analysis.ipynb Makefile
	jupyter nbconvert --to slides \
         --output-dir=./docs \
         --output=index \
         --execute \
         --reveal-prefix "https://unpkg.com/reveal.js@4.1.3/" \
         notebooks/data_analysis.ipynb;\
         mv docs/index.slides.html docs/$@

clean: 
	rm index.html
