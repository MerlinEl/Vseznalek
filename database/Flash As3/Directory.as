var desktop = air.File.desktopDirectory;var files = desktop.getDirectoryListing()for (i = 0; i < files.length; i++) {    air.trace(files[i].nativePath)}var desktop = air.File.desktopDirectory;var files = desktop.getDirectoryListing()for (i = 0; i < files.length; i++) {    air.trace(files[i].nativePath)}var temp = air.File.createTempFile();air.trace(temp.exists) // truetemp.deleteFile();air.trace(temp.exists) // falsevar userDirFiles = air.File.userDirectory.getDirectoryListing();for (i = 0; i < userDirFiles.length; i++) {    if (userDirFiles[i].isHidden) {        air.trace(userDirFiles[i].nativePath);    }}  var docs = air.File.documentsDirectory;air.trace(docs.nativePath); // C:\Documents and Settings\turing\My Documentsair.trace(docs.url); // file:///C:/Documents%20and%20Settings/turing/My%20Documentsvar tempFile = air.File.createTempDirectory();air.trace(tempFile.parent.nativePath);tempFile.deleteFile();var directory = air.File.documentsDirectory.resolvePath("Apollo Test");var file = air.File.documentsDirectory.resolvePath("Apollo Test/employees/bob/test.txt");var relativePath = directory.getRelativePath(file); // employees/bob/test.txtrelativePath = relativePath.replace(/\//g, air.File.separator);air.trace(relativePath); 