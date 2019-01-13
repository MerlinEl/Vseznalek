////////////////////////////////////////////////////////////////////////////////
2 	//
3 	//  Convert Multiple Library Items to MovieClip
4 	//  Copyright 2012 Nobuhiro Takahashi (http://feb19.jp/).
5 	//  All Rights Reserved.
6 	//
7 	////////////////////////////////////////////////////////////////////////////////
8 	
9 	var dom = fl.getDocumentDOM();
10 	
11 	if (!dom)
12 	{
13 	        fl.trace("not file found");
14 	}
15 	else
16 	{
17 	        ui = dom.xmlPanel(fl.configURI + "Commands/Convert Multiple Library Items to MovieClip.xml");
18 	       
19 	        if (ui.libraryname)
20 	        {
21 	                var libraryname = ui.libraryname,
22 	                        library = dom.library,
23 	                        align = ui.align,
24 	                        items = library.getSelectedItems().concat();
25 	               
26 	                if (items)
27 	                {
28 	                        library.addNewItem("movie clip", libraryname);
29 	                        fl.getDocumentDOM().library.selectItem(libraryname);
30 	                       
31 	                        if (ui.classname)
32 	                        {
33 	                                var lib = fl.getDocumentDOM().library;
34 	                                lib.setItemProperty('symbolType', 'movie clip');
35 	                                if (lib.getItemProperty('linkageImportForRS') == true) {
36 	                                        lib.setItemProperty('linkageImportForRS', false);
37 	                                }
38 	                                lib.setItemProperty('linkageExportForAS', true);
39 	                                lib.setItemProperty('linkageExportForRS', false);
40 	                                lib.setItemProperty('linkageExportInFirstFrame', true);
41 	                                lib.setItemProperty('linkageClassName', ui.classname);
42 	                                lib.setItemProperty('scalingGrid',  false);
43 	                        }
44 	                       
45 	                        fl.getDocumentDOM().library.editItem();
46 	                       
47 	                        fl.trace("----------------------------------------");
48 	                        fl.trace("Make MovieClip within Selected Library Items");
49 	                        fl.trace("Library Name: " + libraryname);
50 	                        fl.trace("Align: " + align);
51 	                       
52 	                        var l = items.length;
53 	                        for (var i = 0; i < l; i++)
54 	                        {
55 	                                fl.trace("frame[" +(i+1)+ "]: " + items[i].name);
56 	                                library.selectItem(items[i].name);
57 	                                library.addItemToDocument({x:0, y:0});
58 	                                var el = fl.getDocumentDOM().getTimeline().layers[0].frames[i].elements[0];
59 	                                if (align == "top left" || align == "center left" || align == "bottom left")
60 	                                        el.x = 0;
61 	                                else if (align == "top right" || align == "center right" || align == "bottom right")
62 	                                        el.x = -el.width;
63 	                               
64 	                                if (align == "top left" || align == "top center" || align == "top right")
65 	                                        el.y = 0;
66 	                                else if (align == "bottom left" || align == "bottom center" || align == "bottom right")
67 	                                        el.y = -el.height;
68 	                                if (i+1 != l)
69 	                                {
70 	                                        fl.getDocumentDOM().library.selectItem(libraryname);
71 	                                        fl.getDocumentDOM().getTimeline().convertToBlankKeyframes();
72 	                                }
73 	                        }
74 	                        fl.getDocumentDOM().selectNone();
75 	                }
76 	        }
77 	}