clean: cleanresults
	rm -rf output/*
	rm -rf ./_site/
	rm *.tmp

cleanresults:
	rm -rf results/*.markdown
	rm -rf results/sites/*.markdown

#  Apps

output/apps/%: source/apps/%
	./run.py source/apps/$* > $@

apps-%.tmp: output/apps/apps-%
	./generate-table.py ./output/apps/apps-$* > $@
	./generate-page-result.py ./output/apps/apps-$*

results/apps/apps-%.markdown: apps-%.tmp generate-table.py
	cat _frontmatter/apps apps-$*.tmp > $@
	rm -f %*

#  Singapore top 100 
output/singapore-top-100:
	./run.py source/singapore-top-100 > output/singapore-top-100

singapore-top-100.tmp: output/singapore-top-100
	./generate-table.py ./output/singapore-top-100 > singapore-top-100.tmp 
	./generate-page-result.py ./output/singapore-top-100

results/singapore-top-100.markdown: singapore-top-100.tmp generate-table.py
	cat _frontmatter/singapore-top-100 singapore-top-100.tmp > results/singapore-top-100.markdown
	rm -f singapore-top-100.tmp

#  Philippines top 100 
output/philippines-top-100:
	./run.py source/philippines-top-100 > output/philippines-top-100

philippines-top-100.tmp: output/philippines-top-100
	./generate-table.py ./output/philippines-top-100 > philippines-top-100.tmp 
	./generate-page-result.py ./output/philippines-top-100

results/philippines-top-100.markdown: philippines-top-100.tmp generate-table.py
	cat _frontmatter/philippines-top-100 philippines-top-100.tmp > results/philippines-top-100.markdown
	rm -f philippines-top-100.tmp

#  Malaysian top 100 
output/malaysian-top-100:
	./run.py source/malaysian-top-100 > output/malaysian-top-100

malaysian-top-100.tmp: output/malaysian-top-100
	./generate-table.py ./output/malaysian-top-100 > malaysian-top-100.tmp 
	./generate-page-result.py ./output/malaysian-top-100

results/malaysian-top-100.markdown: malaysian-top-100.tmp generate-table.py
	cat _frontmatter/malaysian-top-100 malaysian-top-100.tmp > results/malaysian-top-100.markdown
	rm -f malaysian-top-100.tmp

# Indoneisan top 100 
output/indonesian-top-100:
	./run.py source/indonesian-top-100 > output/indonesian-top-100

indonesian-top-100.tmp: output/indonesian-top-100
	./generate-table.py ./output/indonesian-top-100 > indonesian-top-100.tmp 
	./generate-page-result.py ./output/indonesian-top-100

results/indonesian-top-100.markdown: indonesian-top-100.tmp generate-table.py
	cat _frontmatter/indonesian-top-100 indonesian-top-100.tmp > results/indonesian-top-100.markdown
	rm -f indonesian-top-100.tmp

# Nigerian top 100 
output/nigerian-top-100:
	./run.py source/nigerian-top-100 > output/nigerian-top-100

nigerian-top-100.tmp: output/nigerian-top-100
	./generate-table.py ./output/nigerian-top-100 > nigerian-top-100.tmp 
	./generate-page-result.py ./output/nigerian-top-100

results/nigerian-top-100.markdown: nigerian-top-100.tmp generate-table.py
	cat _frontmatter/nigerian-top-100 nigerian-top-100.tmp > results/nigerian-top-100.markdown
	rm -f nigerian-top-100.tmp

# Kenyan top 100 
output/kenyan-top-100:
	./run.py source/kenyan-top-100 > output/kenyan-top-100

kenyan-top-100.tmp: output/kenyan-top-100
	./generate-table.py ./output/kenyan-top-100 > kenyan-top-100.tmp 
	./generate-page-result.py ./output/kenyan-top-100

results/kenyan-top-100.markdown: kenyan-top-100.tmp generate-table.py
	cat _frontmatter/kenyan-top-100 kenyan-top-100.tmp > results/kenyan-top-100.markdown
	rm -f kenyan-top-100.tmp

# Indian top 100 
output/indian-top-100:
	./run.py source/indian-top-100 > output/indian-top-100

indian-top-100.tmp: output/indian-top-100
	./generate-table.py ./output/indian-top-100 > indian-top-100.tmp 
	./generate-page-result.py ./output/indian-top-100

results/indian-top-100.markdown: indian-top-100.tmp generate-table.py
	cat _frontmatter/indian-top-100 indian-top-100.tmp > results/indian-top-100.markdown
	rm -f indian-top-100.tmp

# South African top 100 
output/south-african-top-100:
	./run.py source/south-african-top-100 > output/south-african-top-100

south-african-top-100.tmp: output/south-african-top-100
	./generate-table.py ./output/south-african-top-100 > south-african-top-100.tmp 
	./generate-page-result.py ./output/south-african-top-100

results/south-african-top-100.markdown: south-african-top-100.tmp generate-table.py
	cat _frontmatter/south-african-top-100 south-african-top-100.tmp > results/south-african-top-100.markdown
	rm -f south-african-top-100.tmp

# Dutch top 100 
output/dutch-top-100:
	./run.py source/dutch-top-100 > output/dutch-top-100

dutch-top-100.tmp: output/dutch-top-100
	./generate-table.py ./output/dutch-top-100 > dutch-top-100.tmp 
	./generate-page-result.py ./output/dutch-top-100

results/dutch-top-100.markdown: dutch-top-100.tmp generate-table.py
	cat _frontmatter/dutch-top-100 dutch-top-100.tmp > results/dutch-top-100.markdown
	rm -f dutch-top-100.tmp

# Danish top 100 
output/danish-top-100:
	./run.py source/danish-top-100 > output/danish-top-100

danish-top-100.tmp: output/danish-top-100
	./generate-table.py ./output/danish-top-100 > danish-top-100.tmp 
	./generate-page-result.py ./output/danish-top-100

results/danish-top-100.markdown: danish-top-100.tmp generate-table.py
	cat _frontmatter/danish-top-100 danish-top-100.tmp > results/danish-top-100.markdown
	rm -f danish-top-100.tmp

# Romainian top 100 
output/romainian-top-100:
	./run.py source/romainian-top-100 > output/romainian-top-100

romainian-top-100.tmp: output/romainian-top-100
	./generate-table.py ./output/romainian-top-100 > romainian-top-100.tmp 
	./generate-page-result.py ./output/romainian-top-100

results/romainian-top-100.markdown: romainian-top-100.tmp generate-table.py
	cat _frontmatter/romainian-top-100 romainian-top-100.tmp > results/romainian-top-100.markdown
	rm -f romainian-top-100.tmp

# Czech top 100 
output/czech-republic-top-100:
	./run.py source/czech-republic-top-100 > output/czech-republic-top-100

czech-republic-top-100.tmp: output/czech-republic-top-100
	./generate-table.py ./output/czech-republic-top-100 > czech-republic-top-100.tmp 
	./generate-page-result.py ./output/czech-republic-top-100

results/czech-republic-top-100.markdown: czech-republic-top-100.tmp generate-table.py
	cat _frontmatter/czech-republic-top-100 czech-republic-top-100.tmp > results/czech-republic-top-100.markdown
	rm -f czech-republic-top-100.tmp

# Poish top 100 
output/polish-top-100:
	./run.py source/polish-top-100 > output/polish-top-100

polish-top-100.tmp: output/polish-top-100
	./generate-table.py ./output/polish-top-100 > polish-top-100.tmp 
	./generate-page-result.py ./output/polish-top-100

results/polish-top-100.markdown: polish-top-100.tmp generate-table.py
	cat _frontmatter/polish-top-100 polish-top-100.tmp > results/polish-top-100.markdown
	rm -f polish-top-100.tmp

# Italian top 100 
output/italian-top-100:
	./run.py source/italian-top-100 > output/italian-top-100

italian-top-100.tmp: output/italian-top-100
	./generate-table.py ./output/italian-top-100 > italian-top-100.tmp 
	./generate-page-result.py ./output/italian-top-100

results/italian-top-100.markdown: italian-top-100.tmp generate-table.py
	cat _frontmatter/italian-top-100 italian-top-100.tmp > results/italian-top-100.markdown
	rm -f italian-top-100.tmp

# Computers 
output/computers:
	./run.py source/computers > output/computers

computers.tmp: output/computers
	./generate-table.py ./output/computers > computers.tmp 
	./generate-page-result.py ./output/computers

results/computers.markdown: computers.tmp generate-table.py
	cat _frontmatter/computers computers.tmp > results/computers.markdown
	rm -f computers.tmp

# Sports 
output/sports:
	./run.py source/sports > output/sports

sports.tmp: output/sports
	./generate-table.py ./output/sports > sports.tmp 
	./generate-page-result.py ./output/sports

results/sports.markdown: sports.tmp generate-table.py
	cat _frontmatter/sports sports.tmp > results/sports.markdown
	rm -f sports.tmp

# Spanish Top 100
output/spanish-top-100:
	./run.py source/spanish-top-100 > output/spanish-top-100

spanish-top-100.tmp: output/spanish-top-100
	./generate-table.py ./output/spanish-top-100 > spanish-top-100.tmp 
	./generate-page-result.py ./output/spanish-top-100

results/spanish-top-100.markdown: spanish-top-100.tmp generate-table.py
	cat _frontmatter/spanish-top-100 spanish-top-100.tmp > results/spanish-top-100.markdown
	rm -f spanish-top-100.tmp

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

apps: results/apps/apps-aa.markdown

mergepsi: results/singapore-top-100.markdown results/philippines-top-100.markdown results/malaysian-top-100.markdown results/indonesian-top-100.markdown results/nigerian-top-100.markdown results/kenyan-top-100.markdown results/south-african-top-100.markdown results/indian-top-100.markdown results/dutch-top-100.markdown results/danish-top-100.markdown results/romainian-top-100.markdown results/polish-top-100.markdown results/czech-republic-top-100.markdown results/italian-top-100.markdown results/spanish-top-100.markdown results/computers.markdown results/sports.markdown results/south-korean-top-100.markdown results/shopping.markdown results/thai-top-100.markdown results/german-top-100.markdown results/uk-top-100.markdown results/japanese-top-100.markdown results/french-top-100.markdown results/wordpress.markdown results/news.markdown results/themeforest-livepopular.markdown results/alexa-top-10.markdown results/webdeveloperdocs.markdown

build: mergepsi

deploy: build
	git push origin gh-pages

server:
	jekyll serve -w --trace $(param1)