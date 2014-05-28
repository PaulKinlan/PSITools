clean: cleanresults
	rm -f output/wordpress
	rm -f output/alexa-top-10
	rm -f output/news
	rm -f output/webdeveloperdocs
	rm -f output/themeforest-livepopular
	rm -f wordpress.tmp
	rm -rf ./_site/

cleanresults:
	rm -f results/themeforest-livepopular.markdown
	rm -f results/wordpress.markdown
	rm -f results/alexa-top-10.markdown
	rm -f results/news.markdown
	rm -f results/webdeveloperdocs.markdown

# News
output/news:
	./run.py source/news > output/news

news.tmp: output/news
	./generate-table.py ./output/news > news.tmp 

results/news.markdown: news.tmp generate-table.py
	cat _frontmatter/news news.tmp > results/news.markdown
	rm -f news.tmp

# Theme forest popular themes
output/themeforest-livepopular:
	./run.py source/themeforest-livepopular > output/themeforest-livepopular

themeforest-livepopular.tmp: output/themeforest-livepopular
	./generate-table.py ./output/themeforest-livepopular > themeforest-livepopular.tmp 

results/themeforest-livepopular.markdown: themeforest-livepopular.tmp generate-table.py
	cat _frontmatter/themeforest-livepopular themeforest-livepopular.tmp > results/themeforest-livepopular.markdown
	rm -f themeforest-livepopular.tmp

# Web Developer Docs
output/webdeveloperdocs:
	./run.py source/webdeveloperdocs > output/webdeveloperdocs

webdeveloperdocs.tmp: output/webdeveloperdocs
	./generate-table.py ./output/webdeveloperdocs > webdeveloperdocs.tmp 

results/webdeveloperdocs.markdown: webdeveloperdocs.tmp generate-table.py
	cat _frontmatter/webdeveloperdocs webdeveloperdocs.tmp > results/webdeveloperdocs.markdown
	rm -f webdeveloperdocs.tmp

# Alexa Top 10
output/alexa-top-10:
	./run.py source/alexa-top-10 > output/alexa-top-10

alexa-top-10.tmp: output/alexa-top-10
	./generate-table.py ./output/alexa-top-10 > alexa-top-10.tmp 

results/alexa-top-10.markdown: alexa-top-10.tmp generate-table.py
	cat _frontmatter/alexa-top-10 alexa-top-10.tmp > results/alexa-top-10.markdown
	rm -f alexa-top-10.tmp

# Top Wordpress Themes
output/wordpress:
	./run.py source/wordpress > output/wordpress

wordpress.tmp: output/wordpress
	./generate-table.py ./output/wordpress > wordpress.tmp 

results/wordpress.markdown: wordpress.tmp generate-table.py
	cat _frontmatter/wordpress wordpress.tmp > results/wordpress.markdown
	rm -f wordpress.tmp


# Main process

mergepsi: results/wordpress.markdown results/news.markdown results/themeforest-livepopular.markdown results/alexa-top-10.markdown results/webdeveloperdocs.markdown

build: mergepsi

deploy: build
	git push origin gh-pages

server:
	jekyll serve -w --trace $(param1)