
# knit the README
library(knitr)
library(markdown)
knit("ralex/README.Rmd", output="ralex/README.md")
knit("ralex/questions.Rmd", output="ralex/questions.md")
knit("ralex/tags.Rmd", output="ralex/tags.md")
knit("ralex/cross_questions-tags.Rmd", output="ralex/cross_questions-tags.md")

markdownToHTML("ralex/README.md", "ralex/README.html")
markdownToHTML("ralex/questions.md", "ralex/questions.html")
