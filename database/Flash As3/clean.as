function editItem( lib, item )
{
	var success = true,
		linkageIdentifier = item.linkageIdentifier,
		itemType = item.itemType,
		path = [];
 
	// separate export symbols from assets
	path.push( ( linkageIdentifier ) ? "_export" : "_asset" );
 
	// don't touch existing folders
	if ( itemType !== "folder" )
	{
		// separate different item types
		path.push( itemType );
 
		success = libItemMoveToFolder( lib, path.join( "/" ), item, false );
	}
 
	return success;
}
 
function libItemMoveToFolder( lib, path, item, replace )
{
	fl.outputPanel.trace( "libItemMoveToFolder( " + lib + ", " + path + ", " + item.name + ", " + replace + " ) CALL" );  
	var folderCreated = lib.newFolder( path ),
		success = false;
 
	if ( folderCreated )
	{
		// Can't move symbol names with empty space
		if ( item.name.indexOf( " " ) )
		{
			// But even this doesn't work - so avoid spaces in item names!
			item.name = item.name.split( " " ).join( "" );
		}
		success = lib.moveToFolder( path, item.name, replace );
		if ( ! success )
		{
			fl.outputPanel.trace( "libItemMoveToFolder( " + lib + ", " + path + ", " + item.name + ", " + replace + " ) Error Can't move item!" );  
		}
	}
	else
	{
		fl.outputPanel.trace( "libItemMoveToFolder( " + lib + ", " + path + ", " + item.name + ", " + replace + " ) Error Can't create folder!" );  
	}
 
	return success;
}
 
function iterateAllItems( lib )
{
	var items = lib.items,
		item,
		c = items.length,
		i = 0,
		success;
 
	for ( i; i < c; i++ )
	{
		item = items[ i ];
 
		if ( item )
		{
			success = editItem( lib, item )
			if ( ! success )
			{
				break;
			}
		}
	}
}
 
// Select .fla
var avatarFLASource = fl.browseForFileURL( "open");
if ( avatarFLASource )
{
	// Open .fla
	var doc = fl.openDocument( avatarFLASource );
	if ( doc )
	{
		var lib = doc.library;
		if ( lib )
		{
			iterateAllItems( lib );
		}
	}
}