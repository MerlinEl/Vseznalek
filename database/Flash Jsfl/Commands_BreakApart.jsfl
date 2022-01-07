//極限まで分解するJSFL
2 	
3 	var doc = fl.getDocumentDOM();
4 	
5 	while(breakApart());
6 	
7 	function breakApart(){
8 	        doc.selection = getBreakTargets();
9 	        if(!doc.selection.length || checkSelection()){
10 	                return false;
11 	        }else{
12 	                doc.breakApart();
13 	                return true;
14 	        }
15 	        function checkSelection(){
16 	                return doc.selection.length <= 1 && isNotBreakTarget(doc.selection[0])
17 	        }
18 	}
19 	
20 	
21 	function getBreakTargets(){
22 	        var select = $();
23 	        var list = select.concat();
24 	        for(var i=0;i<select.length;i++){
25 	                var element = select[i];
26 	                if(isNotBreakTarget(element)){
27 	                        list.slice(i,1);
28 	                }
29 	        }
30 	        return list;
31 	}
32 	
33 	function isNotBreakTarget(element){
34 	        return element instanceof Shape && !element.isGroup
35 	}
36 	
37 	
38 	function $(){
39 	        return doc.selection.concat();
40 	}