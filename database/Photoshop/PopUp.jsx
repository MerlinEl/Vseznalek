var txt = prompt("Input your dimensions", "200x200");txt = txt.replace(/\s/g, "");txt = txt.toLowerCase();dims = txt.split("x");app.documents.add(parseInt(dims[0]), parseInt(dims[1]), 72, "WEB " + txt, NewDocumentMode.RGB);