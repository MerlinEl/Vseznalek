var xml:XML = new XML(<item label="notepad" fname="notepad.exe" />)ftrace("xml:%", xml.@fname)trace(xml.toXMLString())orvar lesson_item_name:String = "Lesson_1"var lesson_item:XML = new XML(<{lesson_item_name} isFinished="true"/>);ftrace("xml:%", lesson_item.@isFinished)trace(lesson_item.toXMLString())orvar path:String = "Frame_1"var item:XML = new XML(<{path}/>);trace(item.toXMLString())orvar new_item:XML = <item {"noteText"}={notes.text} />;trace(new_item.toXMLString())orvar xml_str:String = "<item label=" + "\""+ "notepad" + "\"" + " fname=" + "\"" + 'notepad.exe' + "\"/>";ftrace(xml_str)var xml:XML = new XML(xml_str);ftrace("xml:%", xml.@fname)var pointsRawXML:String = '<mypoints>\n<point x="100" y="100"/>\n<point x="100" y="0"/>\n<point x="0" y="0"/>\n<point x="0" y="100"/>\n</mypoints>';var points:XML = new XML(pointsRawXML);//ORvar points:XML = <mypoints>    <point x="100" y="100"/>    <point x="100" y="0"/>    <point x="0" y="0"/>    <point x="0" y="100"/></mypoints><project name="EFM 1" id="right">  <characteristics>    <characteristic name="Types of Data">      <options>        <option name="Benefits Information" value="True"/>        <option name="Supply Chain Event Data" value="False"/>        <option name="Physical Movement Data" value="False"/>        <option name="Other" value="False"/>      </options>    </characteristic>  </characteristics></project>appendChild()prependChild()insertChildAfter()insertChildBefore()//print XML attributesvar atts = myXML.attributes();trace(atts.toXMLString());//read attributesvar myXML:XML = ;trace(myXML.attribute("name")); // senoculartrace(myXML.attribute("id")); // 2867trace(myXML.@name); // senoculartrace(myXML.@id); // 2867 // create an XML object with one child.var parentXml:XML = <items><item /></items>; // parentXml.child is an XMLList.  add two new elementsparentXml.child[parentXml.child.length()] = <item />;parentXml.child[parentXml.child.length()] = <item />; // remove the 2nd itemdelete parentXml.child[1];