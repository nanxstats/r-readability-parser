source("readability.R")

url <- "https://www.nytimes.com/2022/07/31/business/gen-z-jobs.html"

lst <- url |>
  rvest::read_html() |>
  as.character() |>
  readability()

cat(lst$title)
cat(lst$textContent)
lst$content |>
  htmltools::HTML() |>
  htmltools::browsable()
