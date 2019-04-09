index.html: src/data_analysis.md Makefile
	pandoc --to=revealjs --standalone \
	--output=docs/$@ src/computing_intro.md \
	--slide-level 2 \
        -i \
        -V revealjs-url=https://revealjs.com \
        -V theme=league \
        -V history=false \
        -V center=false \
        -V slideNumber=true\
        -V transition=slide \
        -V controlsTutorial=false \

clean: 
	rm index.html
