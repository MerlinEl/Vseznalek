// # I've assumed you've downloaded and installed the Flash CS4/CS5 Project Panel update at: http://www.gskinner.com/blog/archives/2010/07/project_panel_u.html// # 1. Create this file in: /Users/{you}/Library/Application Support/Adobe/Flash CS4/en/Configuration/Commands// # 2. Then go to Flash => Keyboard Shortcuts...// # 3. Create your shortcut under the Commands menu, I use 'Cmd+Opt+P'function callMethod(p_panelName, p_function, p_param){	// # Check for panels first	l = fl.swfPanels.length;	if (l == 0) return 'false';	// # Find the panel, and call the method.	for (i=0; i<l; i++){		if (fl.swfPanels[i].name == p_panelName) return (p_param == null) ? fl.swfPanels[i].call(p_function) : fl.swfPanels[i].call(p_function, p_param);	}	return 'false';}// # Test ProjectcallMethod('gProject', 'runCompileList');