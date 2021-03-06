



## Poking Around StackLite

This is an initial exploration of the [StackLite dataset](https://github.com/dgrtwo/StackLite/blob/master/README.md).  

Some inspirational questions from David:
* The increase or decrease in questions in each tag over time
* Correlations among tags on questions
* Which tags tend to get higher or lower scores
* Which tags tend to be asked on weekends vs weekdays
* The speed at which questions are closed or deleted


## Read the data

There are two datasets:
* In questions.csv.gz, each row represents a separate question on StackOverflow
* In question_tags.csv.gz, each row represents a separate question-tag pairing


```r
library(readr)
library(dplyr)

questions <- read_csv("../questions.csv.gz", progress = FALSE)
question_tags <- read_csv("../question_tags.csv.gz", progress = FALSE)
```

## Some exploration

* Of the [questions](./questions.md) data frame
* Of the [question_tags](./tags.md) data frame
* Of the [joined questions/question_tags](./cross_questions-tags.md) data frame
