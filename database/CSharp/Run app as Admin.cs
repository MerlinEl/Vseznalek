You'll want to modify the manifest that gets embedded in the program. This works on Visual Studio 2008 and higher: Project + Add New Item, select "Application Manifest File". Change the <requestedExecutionLevel> element  <requestedExecutionLevel level="requireAdministrator" uiAccess="false" />