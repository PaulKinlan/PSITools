clean:
	# rm -f output/wordpress.output
	rm -f wordpress.markdown
	rm -f wordpress.tmp
	rm -rf ./_site/


output/wordpress.output:
	./run.py source/wordpress.source | ./parse-score.py > output/wordpress.output

wordpress.tmp: # output/wordpress.output
	./generate-table.py ./output/wordpress.output > wordpress.tmp 

wordpress.markdown: wordpress.tmp
	cat wordpress.frontmatter wordpress.tmp > wordpress.markdown
	rm -f wordpress.tmp

mergepsi: wordpress.markdown

build: mergepsi

deploy: build
	git push origin gh-pages

server:
	jekyll serve -w --trace $(param1)