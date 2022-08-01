function readabilityParser(x, candidates, threshold) {
  // Parse jsdom with readability.js
  let doc = new jsdom.JSDOM(x);
  let reader = new Readability.Readability(
    doc.window.document,
    options = { nbTopCandidates: candidates, charThreshold: threshold }
  );
  let res = reader.parse();

  // Sanitize results to avoid script injection
  const purifyWindow = new jsdom.JSDOM('').window;
  const DOMPurify = dompurify(purifyWindow);

  let clean = DOMPurify.sanitize(res.content);
  res.content = clean;

  return res;
}
