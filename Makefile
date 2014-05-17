mkdown.css: mkdown/*.css
	cat mkdown/*.css > mkdown.css
	sed -ie 's|\.main|body|g' mkdown.css
	rm mkdown.csse
