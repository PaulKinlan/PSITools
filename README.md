# Page Speed Insight tools

A small collection of tools that I am writing to help developers monitor
their sites pages speed scores and analyse them at scale.

The quickest way to get started is to run `make mergepsi` that will run all the tests that are in the system.

## Run across custom list of sites

To generate the markdown results run:

`cat your_custom_list_of_urls | ./run.py | ./generate-table.py > output`

## Run across alexa top 10

`cat source/alexa-top-10 | ./run.py | ./generate-table.py > output`
