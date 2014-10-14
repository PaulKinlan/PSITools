clean: cleanresults
	rm -rf output/*
	rm -rf ./_site/
	rm -f *.tmp

cleanresults:
	rm -rf results/*

#  Apps
output/apps/%: source/apps/%
	./run.py source/apps/$* > $@

apps-%.tmp: output/apps/apps-%
	./generate-table.py ./output/apps/apps-$* > $@
	./generate-page-result.py ./output/apps/apps-$*

results/apps/apps-%.markdown: apps-%.tmp generate-table.py
	cat _frontmatter/apps apps-$*.tmp | sed "s/title: Web Apps/title: Web Apps $*/" > $@
	rm -f apps-$*.tmp

# Sites
output/sites/%: source/sites/%
	./run.py source/sites/$* > $@

sites-%.tmp: output/sites/%
	./generate-table.py ./output/sites/$* > $@
	./generate-page-result.py ./output/sites/$*

results/sites/%.markdown: sites-%.tmp generate-table.py
	cat _frontmatter/$* sites-$*.tmp > $@
	rm -f sites-$*.tmp

# Main process

output/apps: results/pages results/apps 
	mkdir -p output/apps

output/sites: results/pages results/sites
	mkdir -p output/sites

output/pages: results/pages
	mkdir -p output/pages

results/pages:
	mkdir -p results/pages

results/sites:
	mkdir -p results/sites

results/apps:
	mkdir -p results/apps

apps: output/pages output/apps results/apps/apps-firefox.markdown

sites: output/pages output/sites results/sites/alexa-top-10.markdown results/sites/singapore-top-100.markdown results/sites/philippines-top-100.markdown results/sites/malaysian-top-100.markdown results/sites/indonesian-top-100.markdown results/sites/nigerian-top-100.markdown results/sites/kenyan-top-100.markdown results/sites/south-african-top-100.markdown results/sites/indian-top-100.markdown results/sites/dutch-top-100.markdown results/sites/danish-top-100.markdown results/sites/romainian-top-100.markdown results/sites/polish-top-100.markdown results/sites/czech-republic-top-100.markdown results/sites/italian-top-100.markdown results/sites/spanish-top-100.markdown results/sites/computers.markdown results/sites/sports.markdown results/sites/south-korean-top-100.markdown results/sites/shopping.markdown results/sites/thai-top-100.markdown results/sites/german-top-100.markdown results/sites/uk-top-100.markdown results/sites/japanese-top-100.markdown results/sites/french-top-100.markdown results/sites/wordpress.markdown results/sites/news.markdown results/sites/themeforest-livepopular.markdown results/sites/webdeveloperdocs.markdown

mergepsi: sites apps 

build: mergepsi

deploy: build
	git push origin gh-pages

server:
	jekyll serve -w --trace $(param1)