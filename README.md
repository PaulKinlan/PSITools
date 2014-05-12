## Run across custom list of sites
`cat tests | python run.py | python parse-score.py > output.tsv`

## Run across alexa top 10k

`cat alexa-top-10000-global.txt | python run.py | python parse-score.py > output.tsv`
