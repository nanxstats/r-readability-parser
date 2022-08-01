readability <- function(html, candidates = 5L, threshold = 500L) {
  ct <- V8::v8(global = "window")

  ct$eval("function setTimeout(){}")
  ct$eval("function clearInterval(){}")
  ct$source("js/encoding.min.js")
  ct$source("js/jsdom.js")
  ct$source("js/dompurify.js")
  ct$source("js/readability.js")
  ct$eval(readLines("js/wrapper.js"))

  # ct$get(V8::JS("Object.keys(window)"))
  ct$call("readabilityParser", html, candidates, threshold)
}
