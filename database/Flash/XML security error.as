Here's why!Exerpt from the Mozilla Developer Center (https://developer.mozilla.org/en/E4X)Quote:    E4X doesn't support parsing XML declaration ( <?xml version=...?>) (see bug 336551 ). You may get SyntaxError "xml is a reserved identifier" (despite the XML being in a string).    Workaround:    var response = xmlhttprequest.responseText; // bug 270553    response = response.replace(/^<\?xml\s+version\s*=\s*(["'])[^\1]+\1[^?]*\?>/, ""); // bug 336551    var e4x = new XML(response);Alfresco Workaround:var content = new XML(node.content.replaceAll("(?s)<\\?xml .*?\\?>\\s*", "")); // Workaround: Mozilla Bug 336551Edit 11/2/2008 10:14PM: Be careful that you don't include any whitespace/newline characters before the first XML element in the node.content, otherwise new XML("\r\nTest Successful") will create a blank XML text node, which can be very confusing, but it's part of the E4X specification.