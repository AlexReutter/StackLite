









### question_tags
Look at the columns in question_tags

```r
head(question_tags,10)
```

```
## # A tibble: 10 � 2
##       Id                 Tag
##    <int>               <chr>
## 1      1                data
## 2      4                  c#
## 3      4            winforms
## 4      4     type-conversion
## 5      4             decimal
## 6      4             opacity
## 7      6                html
## 8      6                 css
## 9      6                css3
## 10     6 internet-explorer-7
```

How many records are there?

```r
count(question_tags)
```

```
## # A tibble: 1 � 1
##          n
##      <int>
## 1 46433698
```

Most popular tags:

```r
question_tags %>%
  count(Tag, sort = TRUE)
```

```
## # A tibble: 56,080 � 2
##           Tag       n
##         <chr>   <int>
## 1  javascript 1490887
## 2        java 1436223
## 3         php 1264656
## 4          c# 1230325
## 5     android 1188115
## 6      jquery  947328
## 7      python  753000
## 8        html  706782
## 9         ios  585091
## 10        c++  580429
## # ... with 56,070 more rows
```

How many unique tags?


### Cross questions/question_tags

Or you could compare the growth of particular tags over time:


```r
library(lubridate)

tags <- c("c#", "javascript", "python", "r")

q_per_year <- questions %>%
  count(Year = year(CreationDate)) %>%
  rename(YearTotal = n)

tags_per_year <- question_tags %>%
  filter(Tag %in% tags) %>%
  inner_join(questions) %>%
  count(Year = year(CreationDate), Tag) %>%
  inner_join(q_per_year)

ggplot(tags_per_year, aes(Year, n / YearTotal, color = Tag)) +
  geom_line() +
  scale_y_continuous(labels = scales::percent_format()) +
  ylab("% of Stack Overflow questions with this tag")
```

![plot of chunk tags_per_year](README-fig/tags_per_year-1.png)
