clean:
	rm -f wordpress.markdown
	rm -f wordpress.tmp
	rm -rf ./_site/

wordpress.tmp:
	./generate-table.py wordpress-output.tsv > wordpress.tmp 

wordpress.markdown: wordpress.tmp
	cat wordpress.frontmatter wordpress.tmp > wordpress.markdown
	rm -f wordpress.tmp

mergepsi: wordpress.markdown

build: mergepsi

deploy: build
	cd ./src/appengine/build && appcfg.py --oauth2 update .
	@echo "Visit http://web-central.appspot.com"

server:
	@echo "Visit: http://0.0.0.0:8081/web/fundamentals/"
	cd ./src/site && jekyll serve -w --trace $(param1)