clean:
	rm -f output/wordpress
	rm -f output/alexa-top-top
	rm -f results/wordpress.markdown
	rm -f results/alexa-top-10.markdown
	rm -f wordpress.tmp
	rm -rf ./_site/


output/webdeveloperdocs:
	./run.py source/webdeveloperdocs > output/webdeveloperdocs

webdeveloperdocs.tmp: output/webdeveloperdocs
	./generate-table.py ./output/webdeveloperdocs > webdeveloperdocs.tmp 

results/webdeveloperdocs.markdown: webdeveloperdocs.tmp generate-table.py
	cat _frontmatter/webdeveloperdocs.frontmatter webdeveloperdocs.tmp > results/webdeveloperdocs.markdown
	rm -f webdeveloperdocs.tmp

output/alexa-top-10:
	./run.py source/alexa-top-10 > output/alexa-top-10

alexa-top-10.tmp: output/alexa-top-10
	./generate-table.py ./output/alexa-top-10 > alexa-top-10.tmp 

results/alexa-top-10.markdown: alexa-top-10.tmp generate-table.py
	cat _frontmatter/alexa-top-10.frontmatter alexa-top-10.tmp > results/alexa-top-10.markdown
	rm -f alexa-top-10.tmp

output/wordpress:
	./run.py source/wordpress > output/wordpress

wordpress.tmp: output/wordpress
	./generate-table.py ./output/wordpress > wordpress.tmp 

results/wordpress.markdown: wordpress.tmp generate-table.py
	cat _frontmatter/wordpress.frontmatter wordpress.tmp > results/wordpress.markdown
	rm -f wordpress.tmp

mergepsi: results/wordpress.markdown results/alexa-top-10.markdown results/webdeveloperdocs.markdown

build: mergepsi

deploy: build
	git push origin gh-pages

server:
	jekyll serve -w --trace $(param1)