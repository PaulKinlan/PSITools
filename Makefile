clean: cleanresults
	rm -f output/*
	rm -rf ./_site/

cleanresults:
	rm -f results/*.markdown
	rm -f results/sites/*.markdown

# Sports 
output/sports:
	./run.py source/sports > output/sports

sports.tmp: output/sports
	./generate-table.py ./output/sports > sports.tmp 
	./generate-page-result.py ./output/sports

results/sports.markdown: sports.tmp generate-table.py
	cat _frontmatter/sports sports.tmp > results/sports.markdown
	rm -f sports.tmp

# South Korean Top 100
output/south-korean-top-100:
	./run.py source/south-korean-top-100 > output/south-korean-top-100

south-korean-top-100.tmp: output/south-korean-top-100
	./generate-table.py ./output/south-korean-top-100 > south-korean-top-100.tmp 
	./generate-page-result.py ./output/south-korean-top-100

results/south-korean-top-100.markdown: south-korean-top-100.tmp generate-table.py
	cat _frontmatter/south-korean-top-100 south-korean-top-100.tmp > results/south-korean-top-100.markdown
	rm -f south-korean-top-100.tmp

# Thai Top 100
output/thai-top-100:
	./run.py source/thai-top-100 > output/thai-top-100

thai-top-100.tmp: output/thai-top-100
	./generate-table.py ./output/thai-top-100 > thai-top-100.tmp 
	./generate-page-result.py ./output/thai-top-100

results/thai-top-100.markdown: thai-top-100.tmp generate-table.py
	cat _frontmatter/thai-top-100 thai-top-100.tmp > results/thai-top-100.markdown
	rm -f thai-top-100.tmp

# German Top 100
output/german-top-100:
	./run.py source/german-top-100 > output/german-top-100

german-top-100.tmp: output/german-top-100
	./generate-table.py ./output/german-top-100 > german-top-100.tmp 
	./generate-page-result.py ./output/german-top-100

results/german-top-100.markdown: german-top-100.tmp generate-table.py
	cat _frontmatter/german-top-100 german-top-100.tmp > results/german-top-100.markdown
	rm -f german-top-100.tmp

# UK Top 100
output/uk-top-100:
	./run.py source/uk-top-100 > output/uk-top-100

uk-top-100.tmp: output/uk-top-100
	./generate-table.py ./output/uk-top-100 > uk-top-100.tmp 
	./generate-page-result.py ./output/uk-top-100

results/uk-top-100.markdown: uk-top-100.tmp generate-table.py
	cat _frontmatter/uk-top-100 uk-top-100.tmp > results/uk-top-100.markdown
	rm -f uk-top-100.tmp

# French Top 100
output/french-top-100:
	./run.py source/french-top-100 > output/french-top-100

french-top-100.tmp: output/french-top-100
	./generate-table.py ./output/french-top-100 > french-top-100.tmp 
	./generate-page-result.py ./output/french-top-100

results/french-top-100.markdown: french-top-100.tmp generate-table.py
	cat _frontmatter/french-top-100 french-top-100.tmp > results/french-top-100.markdown
	rm -f french-top-100.tmp

# Japanese Top 100
output/japanese-top-100:
	./run.py source/japanese-top-100 > output/japanese-top-100

japanese-top-100.tmp: output/japanese-top-100
	./generate-table.py ./output/japanese-top-100 > japanese-top-100.tmp 
	./generate-page-result.py ./output/japanese-top-100

results/japanese-top-100.markdown: japanese-top-100.tmp generate-table.py
	cat _frontmatter/japanese-top-100 japanese-top-100.tmp > results/japanese-top-100.markdown
	rm -f japanese-top-100.tmp

# Shopping
output/shopping:
	./run.py source/shopping > output/shopping

shopping.tmp: output/shopping
	./generate-table.py ./output/shopping > shopping.tmp
	./generate-page-result.py ./output/shopping

results/shopping.markdown: shopping.tmp generate-table.py
	cat _frontmatter/shopping shopping.tmp > results/shopping.markdown
	rm -f shopping.tmp

# News
output/news:
	./run.py source/news > output/news

news.tmp: output/news
	./generate-table.py ./output/news > news.tmp
	./generate-page-result.py ./output/news

results/news.markdown: news.tmp generate-table.py
	cat _frontmatter/news news.tmp > results/news.markdown
	rm -f news.tmp

# Theme forest popular themes
output/themeforest-livepopular:
	./run.py source/themeforest-livepopular > output/themeforest-livepopular

themeforest-livepopular.tmp: output/themeforest-livepopular
	./generate-table.py ./output/themeforest-livepopular > themeforest-livepopular.tmp 
	./generate-page-result.py ./output/themeforest-livepopular

results/themeforest-livepopular.markdown: themeforest-livepopular.tmp generate-table.py
	cat _frontmatter/themeforest-livepopular themeforest-livepopular.tmp > results/themeforest-livepopular.markdown
	rm -f themeforest-livepopular.tmp

# Web Developer Docs
output/webdeveloperdocs:
	./run.py source/webdeveloperdocs > output/webdeveloperdocs

webdeveloperdocs.tmp: output/webdeveloperdocs
	./generate-table.py ./output/webdeveloperdocs > webdeveloperdocs.tmp
	./generate-page-result.py ./output/webdeveloperdocs

results/webdeveloperdocs.markdown: webdeveloperdocs.tmp generate-table.py
	cat _frontmatter/webdeveloperdocs webdeveloperdocs.tmp > results/webdeveloperdocs.markdown
	rm -f webdeveloperdocs.tmp

# Alexa Top 10
output/alexa-top-10:
	./run.py source/alexa-top-10 > output/alexa-top-10

alexa-top-10.tmp: output/alexa-top-10
	./generate-table.py ./output/alexa-top-10 > alexa-top-10.tmp 
	./generate-page-result.py ./output/alexa-top-10

results/alexa-top-10.markdown: alexa-top-10.tmp generate-table.py
	cat _frontmatter/alexa-top-10 alexa-top-10.tmp > results/alexa-top-10.markdown
	rm -f alexa-top-10.tmp

# Top Wordpress Themes
output/wordpress:
	./run.py source/wordpress > output/wordpress

wordpress.tmp: output/wordpress
	./generate-table.py ./output/wordpress > wordpress.tmp 
	./generate-page-result.py ./output/wordpress

results/wordpress.markdown: wordpress.tmp generate-table.py
	cat _frontmatter/wordpress wordpress.tmp > results/wordpress.markdown
	rm -f wordpress.tmp

# Main process

mergepsi: results/sports.markdown results/south-korean-top-100.markdown results/shopping.markdown results/thai-top-100.markdown results/german-top-100.markdown results/uk-top-100.markdown results/japanese-top-100.markdown results/french-top-100.markdown results/wordpress.markdown results/news.markdown results/themeforest-livepopular.markdown results/alexa-top-10.markdown results/webdeveloperdocs.markdown

build: mergepsi

deploy: build
	git push origin gh-pages

server:
	jekyll serve -w --trace $(param1)