# Page Speed Insight tools

A small collection of tools that I am writing to help developers monitor
their sites pages speed scores and analyse them at scale.

## Run across custom list of sites
`cat tests | python run.py | python parse-score.py > output.tsv`

## Run across alexa top 10k

`cat alexa-top-10000-global.txt | python run.py | python parse-score.py > output.tsv`
