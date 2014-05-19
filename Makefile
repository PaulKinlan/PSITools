clean:
	# rm -f output/wordpress.output
	rm -f results/wordpress.markdown
	rm -f results/alexa-top-10.markdown
	rm -f wordpress.tmp
	rm -rf ./_site/


output/alexa-top-10.output:
	./run.py source/alexa-top-10.source > output/alexa-top-10.output

alexa-top-10.tmp: output/alexa-top-10.output
	./generate-table.py ./output/alexa-top-10.output > alexa-top-10.tmp 

results/alexa-top-10.markdown: alexa-top-10.tmp
	cat frontmatter/alexa-top-10.frontmatter alexa-top-10.tmp > results/alexa-top-10.markdown
	rm -f alexa-top-10.tmp

output/wordpress.output:
	./run.py source/wordpress.source > output/wordpress.output

wordpress.tmp: # output/wordpress.output
	./generate-table.py ./output/wordpress.output > wordpress.tmp 

results/wordpress.markdown: wordpress.tmp
	cat frontmatter/wordpress.frontmatter wordpress.tmp > results/wordpress.markdown
	rm -f wordpress.tmp

mergepsi: results/wordpress.markdown

build: mergepsi

deploy: build
	git push origin gh-pages

server:
	jekyll serve -w --trace $(param1)