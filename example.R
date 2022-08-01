source("readability.R")

url <- "https://www.nytimes.com/2022/07/31/business/gen-z-jobs.html"

html <- url |>
  rvest::read_html() |>
  as.character()

html |> is_readable()

lst <- html |> readability(url = url)

cat(lst$title)
cat(lst$textContent)
lst$content |>
  htmltools::HTML() |>
  htmltools::browsable()
