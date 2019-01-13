    http://www.flashdevelop.org/wikidocs/index.php?title=Shortcuts    Escape: Hide the completion list or method call-tip.    F1: when you see "..." in a (yellow) tip, you can press F1 to see a more detailed tip.    F4: go to declaration of element at cursor location.    Shift+F4: jump back after F4 or code generation operations.    Ctrl+Space: contextual completion list - also, press Tab to expand snippets like 'for', 'while', etc.    Ctrl+Shift+Space: method call-tip (the yellow window with current method's signature)    Ctrl+Alt+Space: list all project classes (as after ':' or keywords like "new")    Ctrl+Shift+1: contextual code generation http://www.flashdevelop.org/wikidocs/index.php?title=Features:GenerationGenerate fields from function parameters no Generator.txt anymore, just a Snippets>as3>generators folderEdit your user copy: from FD, Tools > User Config Files...I am creating new syntax for Generator.txt templates so it would give more freedom for developers. Some people like that syntaxCode:private function parseLocaleData(keyData:XMLList):void {         }while some might prefer thatCode:private function parseLocaleData ( keyData : XMLList ) : void {         }or maybe some other syntaxSo I came up with the following Generator.txt templates language. For example, function generation template would look like this:Code:$(modifiers) function $(name)($(arguments))[[:$(type)]] $(CSLB){\n\t[[$(body)]]$(EntryPoint)\n}In [[ and ]] brackets contain non-mandatory parts, e.g. some functions might not have type and FD should not fail because of that.Here's a function parameter templateCode:$(p_name)[[:$(p_type)]][[ = $(p_default_value)]][[$(p_comma) ]]Again, type, default value and comma are not mandatory components (last parameter does not have comma after that). This template gives you possibility to generate this type of function (or even more crazy):Code:public function init(  isAdmin  :  Boolean  , test  :  String  ):void {           }What I want to ask community is whether you like that kind of syntax or you can suggest a better one?