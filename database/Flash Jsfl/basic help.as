/*
	jsfl FlasJavaScript - BASIC HELP

	by aemkei@mizubitchy.com
	check http://mizubitchy.antville.org/topics/FlashMX2004/
*/

//: BitmapInstance - "Subclass of Instance; a bitmap on the Stage"

	//: Methods - "Methods of the BitmapInstance object"
	bitmapInstance.getBits( bitmap )                      	 // Gets bits from a bitmap
	bitmapInstance.setBits( bitmap )                      	 // Sets bits of a bitmap

	//: Properties - "Properties of the BitmapInstance object"
	bitmapInstance.hPixels                                	 // Width of BItmapInstance in pixels
	bitmapInstance.vPixels                                	 // Height of BItmapInstance in pixels


//: BitmapItem - "Subclass of Item; a bitmap symbol in the Library"

	//: Properties - "Properties of the BitmapItem object"
	bitmapItem.allowSmoothing                         	 // If true, smooths edges of bitmap with anti-aliasing
	bitmapItem.compressionType                        	 // Specifies compression type for export
	bitmapItem.quality                                	 // Quality for JPEG compression
	bitmapItem.useImportedJPEGQuality                 	 // If true, imported JPEG´s quality for export


//: CompiledClipInstance - "Subclass of SymbolInstance; a compiled clip instance on the Stage"

	//: Properties - "Properties of the CompiledClipInstance object"
	compiledClipInstance.accName                                	 // Name of an object, used by screen reader
	compiledClipInstance.actionScript                           	 // String representing the ActionScript on an instance
	compiledClipInstance.description                            	 // Description of the object, used by screen reader
	compiledClipInstance.forceSimple                            	 // If true, the children of the object are not accessible to screen reader
	compiledClipInstance.shortcut                               	 // An object´s runtime shortcut key
	compiledClipInstance.silent                                 	 // If true, object is not read by screen reader
	compiledClipInstance.tabIndex                               	 // tabIndex value of an object


//: ComponentInstance - "Subclass of SymbolInstance; a component instance on the Stage"

	//: Properties - "Properties of the ComponentInstance object"
	componentInstance.parameters                             	 // Component´s parameters


//: ComponentsPanel - "Components panel"

	//: Methods - "Methods of the ComponentsPanel object"
	componentsPanel.addItemToDocument( position, categoryName, componentName )	 // Adds component to the document


//: Contour - "A closed path of half edges"

	//: Methods - "Methods of the Contour object"
	contour.getHalfEdge()                          	 // Returns a halfEdge object

	//: Properties - "Properties of the Contour object"
	contour.interior                               	 // If true, contour encloses an area
	contour.orientation                            	 // Integer indicating the orientation of a contour


//: Document - "The Stage"

	//: Methods - "Methods of the Document object"
	document.addDataToDocument( name, type, data )  	 // Stores data with a document
	document.addDataToSelection( name, type, data ) 	 // Stores data with selected objects
	document.addItem( position, item )              	 // Adds an Item from the Library to the Stage
	document.addNewLine( startPoint, endPoint )     	 // Draws a line on the Stage
	document.addNewOval( boundingRectangle [, bSuppressFill] [, bSuppressStroke] )	 // Draws an oval on the Stage
	document.addNewPublishProfile( [profileName] )  	 // Adds a new publish profile
	document.addNewRectangle( boundingRectangle, roundness [, bSupressFill] [, bSuppressStroke] )	 // Draws a new rectangle on the Stage
	document.addNewScene( [name] )                  	 // Adds a new scene
	document.addNewText( boundingRectangle )        	 // Inserts a new empty text field
	document.align( alignmode [, bUseDocumentBounds] )	 // Aligns the selection
	document.allowScreens()                         	 // Checks if the Screen Outline is available
	document.arrange( arrangeMode )                 	 // Arranges the selection
	document.breakApart()                           	 // Breaks apart the current selection
	document.canEditSymbol()                        	 // If true, the editSymbol() method can be used
	document.canRevert()                            	 // Indicates if a document can be reverted
	document.canTestMovie()                         	 // Indicates if movie can be tested
	document.canTestScene()                         	 // Indicates if current scene can be tested
	document.clipCopy()                             	 // Copies the selection selection to the Clipboard
	document.clipCut()                              	 // Cuts the selection to the Clipboard
	document.clipPaste( [bInPlace] )                	 // Pastes the Clipboard into the document
	document.close( [bPromptToSaveChanges] )        	 // Closes the current document
	document.convertLinesToFills()                  	 // Converts lines to fills on selected objects
	document.convertToSymbol( type, name, registrationPoint )	 // Converts selected items to a new symbol
	document.deletePublishProfile()                 	 // Deletes the current publish profile
	document.deleteScene()                          	 // Deletes the current scene
	document.deleteSelection()                      	 // Deletes the selection from the Stage
	document.distribute( distributemode [, bUseDocumentBounds] )	 // Distributes the selection
	document.distributeToLayers()                   	 // Distributes the current selection to layers
	document.documentHasData( name )                	 // If true, there is persistent data
	document.duplicatePublishProfile( [profileName] )	 // Duplicates the current profile
	document.duplicateScene()                       	 // Duplicates the current scene
	document.duplicateSelection()                   	 // Duplicates the selection
	document.editScene( index )                     	 // Sets the specified scene to be the current one
	document.enterEditMode( [editMode] )            	 // Enters an edit mode for a symbol or group
	document.exitEditMode()                         	 // Exits an edit mode
	document.exportPublishProfile( fileURI )        	 // Exports the current publish profile to  file
	document.exportSWF( [fileURI] [, bCurrentSettings] )	 // Exports document as a SWF
	document.getAlignToDocument()                   	 // Returns the value of the Align to Stage setting
	document.getCustomFill( [locationOfFill] )      	 // Returns the Fill object of selection or toolbar
	document.getCustomStroke( [locationOfFill] )    	 // Returns the Stroke object or toolbar setting
	document.getDataFromDocument( name )            	 // Returns the value of the named data
	document.getElementProperty( propertyName )     	 // Returns the specified Element property
	document.getElementTextAttr( attrName [, startIndex] [, endIndex] )	 // Returns the specified TextAttrs property
	document.getSelectionRect()                     	 // Returns the bounding rectangle of the selection
	document.getTextString( [startIndex] [, endIndex] )	 // Returns the text string of the selected text
	document.getTimeline()                          	 // Returns the current timeline
	document.getTransformationPoint()               	 // Returns the location of the transformation point
	document.group()                                	 // Converts the selection to a group
	document.importPublishProfile( fileURI )        	 // Imports a publish profile from file
	document.importSWF( fileURI )                   	 // Imports a SWF into the document
	document.match( bWidth, bHeight [, bUseDocumentBounds] )	 // Makes the size of selected objects equal
	document.mouseClick( position, bToggleSel, bShiftSel )	 // Performs a mouse click
	document.mouseDblClk( position, bAltDown, bShiftDown, bShiftSelect )	 // Performs a mouse double click
	document.moveSelectedBezierPointsBy( delta )    	 // Moves the selected Bezier points
	document.moveSelectionBy( distanceToMove )      	 // Moves the selection
	document.optimizeCurves( smoothing, bUseMultiplePasses )	 // Opimizes the curves of the selected shape
	document.publish()                              	 // Publishes a document
	document.removeDataFromDocument( name )         	 // Removes persistent data from document
	document.removeDataFromSelection( name )        	 // Removes persistent data from selected objects
	document.renamePublishProfile( [profileNewName] )	 // Renames the current publish profile
	document.renameScene( name )                    	 // Renames the selected scene
	document.reorderScene( sceneToMove, sceneToPutItBefore )	 // Reorders specified scene
	document.resetTransformation()                  	 // Resets the transformation matrix
	document.revert()                               	 // Reverts the specified document
	document.rotateSelection( angle [, rotationPoint] )	 // Rotates a selection
	document.save( [bOkToSaveAs] )                  	 // Saves document
	document.saveAndCompact( [bOkToSaveAs] )        	 // Saves and compacts document
	document.scaleSelection( xScale, yScale [, whichCorner] )	 // Scales a selection
	document.selectAll()                            	 // Selects all items on the Stage
	document.selectNone()                           	 // Deselects all items on the Stage
	document.setAlignToDocument( bToStage )         	 // If true, objects are aligned, distributed, sized, or spaced to the Stage
	document.setCustomFill( fill )                  	 // Sets the current fill settings of selection or toolbar
	document.setCustomStroke( stroke )              	 // Sets the current stroke settings of selection or toolbar
	document.setElementProperty( property, value )  	 // Sets the specified property of an Element object
	document.setElementTextAttr( attrName, attrValue [, startIndex] [, endIndex] )	 // Sets the specified property of the selected text items
	document.setFillColor( color )                  	 // Changes the fill color of a selection
	document.setInstanceAlpha( opacity )            	 // Sets the opacity of an instance
	document.setInstanceBrightness( brightness )    	 // Sets the brightness of an instance
	document.setInstanceTint( color, strength )     	 // Sets the tint of an instance
	document.setSelectionBounds( boundingRectangle )	 // Moves and resizes a selection
	document.setSelectionRect( rect [, bReplaceCurrentSelection] )	 // Sets the selection rectangle
	document.setStroke( color, size, stroke )       	 // Sets stroke properties of selected stroke
	document.setStrokeColor( color )                	 // Changes the stroke color of selected stroke
	document.setStrokeSize( size )                  	 // Changes the stroke width of selected stroke
	document.setStrokeStyle( stroke )               	 // Changes the stroke style of selected stroke
	document.setTextRectangle( boundingRectangle )  	 // Changes the bounding rectangle for the selected text item
	document.setTextSelection( startIndex, endIndex )	 // Sets the text selection of the selected text field
	document.setTextString( text [, startIndex] [, endIndex] )	 // Adds specifed text string to selected text field
	document.setTransformationPoint( transformationPoint )	 // Moves the transformation point of selection
	document.skewSelection( xSkew, ySkew [, whichEdge] )	 // Skews the selection
	document.smoothSelection()                      	 // Smoothes the selected curve of a shape
	document.space( direction [, bUseDocumentBounds] )	 // Spaces the objects of a selection evenly
	document.straightenSelection()                  	 // Straightens the selected curve of a shape
	document.swapElement( name )                    	 // Swaps selected symbol with specifed one
	document.testMovie()                            	 // Test Movie
	document.testScene()                            	 // Test Current Scene
	document.traceBitmap( threshold, minimumArea, curveFit, cornerThreshold )	 // Traces a bitmap
	document.transformSelection( a, b, c, d )       	 // Performs a general transformation
	document.unGroup()                              	 // Ungroups the selected group
	document.unlockAllElements()                    	 // Unlocks all symbols on the current frame
	document.xmlPanel( fileURI )                    	 // Displays the specified XMLUI dialog box

	//: Properties - "Properties of the Document object"
	document.accName                                	 // Name of movie, used by screen reader
	document.autoLabel                              	 // If true, turns on automatic labeling for screen reader
	document.backgroundColor                        	 // A color representing the background
	document.currentPublishProfile                  	 // Sets and returns the name of the active publish profile
	document.currentTimeline                        	 // Represents the active timeline
	document.description                            	 // Description of the main movie, used by screen reader
	document.forceSimple                            	 // If true, the children of the object are not accessible to screen reader
	document.frameRate                              	 // Document´s frames per second
	document.height                                 	 // Height of the document
	document.library                                	 // Represents the document´s Library
	document.livePreview                            	 // If true, visually displays components at authortime
	document.name                                   	 // Name of the document
	document.path                                   	 // The file path of the document
	document.publishProfiles                        	 // An array containing the publish profiles for document
	document.screenOutline                          	 // The current ScreenOutline object for the document
	document.selection                              	 // An array of selected Element objects
	document.silent                                 	 // If true, movie is not read by screen reader
	document.timelines                              	 // An array containing the Timeline objects of the document
	document.width                                  	 // Width of the document


//: DrawingLayer - "Used by tools for temporary drawing while dragging the mouse"

	//: Methods - "Methods of the DrawingLayer object"
	drawingLayer.beginDraw( [persistentDraw] )          	 // Puts Flash into drawing mode
	drawingLayer.beginFrame()                           	 // Starting point to delimit a set of lines
	drawingLayer.cubicCurveTo( x1Ctrl, y1Ctrl, x2Ctl, y2Ctl, xEnd, yEnd )	 // Draws a cubic curve
	drawingLayer.curveTo( x1Clt, y, x2, y2 )            	 // Draws a quadratic curve segment
	drawingLayer.drawPath( path )                       	 // Draws the specified path
	drawingLayer.endDraw()                              	 // Exits drawing mode
	drawingLayer.endFrame()                             	 // Erases the paths drawn by DrawingLayer object
	drawingLayer.lineTo( x, y )                         	 // Draws a line
	drawingLayer.moveTo( x, y )                         	 // Sets the current drawing position
	drawingLayer.newPath()                              	 // Returns a new path object
	drawingLayer.setColor( color )                      	 // Sets the color of subsequently drawn data


//: Edge - "Represents an edge of an object on the Stage"

	//: Methods - "Methods of the Edge object"
	edge.getControl( int i )                    	 // Returns the control point of the specified Edge object
	edge.getHalfEdge( index )                   	 // Returns a HalfEdge object
	edge.setControl( index, x, y )              	 // Sets the control point of an edge
	edge.splitEdge( t )                         	 // Divides specified Edge object into two

	//: Properties - "Properties of the Edge object"
	edge.id                                     	 // An unique identifier for the Edge object
	edge.isLine                                 	 // If true, Edge is a straight line


//: Effect - "An instance of an effect"

	//: Properties - "Properties of the Effect object"
	effect.effectName                             	 // Name of an effect, used to create menu item
	effect.groupName                              	 // Name of an effect group, used to create the menu item
	effect.sourceFile                             	 // Name of JSFL source file
	effect.symbolType                             	 // Name of symbolType to create during initial application of the effect
	effect.useXMLToUI                             	 // If true, displays a XMLUI dialog box


//: Element - "Represents all objects on the Stage"

	//: Methods - "Methods of the Element object"
	element.getPersistentData( name )              	 // Returns the value of the named data
	element.hasPersistentData( name )              	 // If true, data with specified name is attached to object
	element.removePersistentData( name )           	 // Removes persistent data attached to object
	element.setPersistentData( name, type, value ) 	 // Stores specified data with an object

	//: Properties - "Properties of the Element object"
	element.depth                                  	 // Returns the drawing order of the objects on stage
	element.elementType                            	 // Type of Element object
	element.height                                 	 // Height of the Element
	element.left                                   	 // Left side of Element
	element.locked                                 	 // If true, the Element is locked
	element.matrix                                 	 // References the TransformationMatrix object
	element.name                                   	 // Instance Name of Element
	element.top                                    	 // Top side of Element
	element.width                                  	 // Width of the Element


//: EmbeddedVideoInstance - "Subclass of Instance; an embedded video instance on the Stage"


//: Refer to Instance object for properties or methods - "Refer to Instance object for properties or methods"


//: Fill - "Fill settings for the selection or Toolbar"

	//: Properties - "Properties of the Fill object"
	fill.color                                  	 // The fill color
	fill.colorArray                             	 // An array of colors in a gradient
	fill.posArray                               	 // Indicates the position of the corresponding color in a gradient
	fill.style                                  	 // The fill style


//: Flash - "The Flash application"

	//: Methods - "Methods of the Flash object"
	fl.browseForFileURL( browseType [, title] [, previewArea] )	 // Brings up an Open or Save dialog box
	fl.closeAll()                             	 // Closes all open documents
	fl.closeDocument( documentObject [, bPromptToSaveChanges] )	 // Closes the specified document
	fl.createDocument( [docType] )            	 // Opens a new document
	fl.enableImmediateUpdates()               	 // If true, updates to the timeline display when executing an effect. Only used for debugging effect.
	fl.fileExists( fileURI )                  	 // Returns true if specified file exists
	fl.findDocumentIndex( name )              	 // Returns the specified Document object´s index
	fl.findScreenType( name [, version] )     	 // Returns the specified ScreenType
	fl.getDocumentDOM()                       	 // Returns the active Document object
	fl.invokeScreenType( name [, version] )   	 // Invokes a ScreenType
	fl.openDocument( fileURI )                	 // Opens specified FLA file
	fl.quit( [bPromptIfNeeded] )              	 // Quits Flash
	fl.reloadEffects()                        	 // Reloads all effects descriptors
	fl.reloadTools()                          	 // Rebuilds the Toolbar
	fl.revertDocument( documentObject )       	 // Reverts specified document
	fl.runScript( fileURI [, funcName] [, arg] )	 // Executes a JavaScript file
	fl.saveAll()                              	 // Saves all open documents
	fl.saveDocument( document [, fileURI] )   	 // Saves specified document
	fl.saveDocumentAs( document )             	 // Displays the Save As dialog
	fl.setActiveWindow( document [, bActivateFrame] )	 // Sets the active window to be the specified document
	fl.trace( message )                       	 // Sends a test string to the Output panel

	//: Properties - "Properties of the Flash object"
	fl.activeEffect                           	 // The effect descriptor
	fl.componentsPanel                        	 // Reference to the Components panel
	fl.configDirectory                        	 // Contains the full path name for local user´s Configuration directory
	fl.configURI                              	 // Returns the URI to the local user´s config directory
	fl.documents                              	 // An array of Document objects
	fl.effects                                	 // An array of effect descriptors
	fl.Math                                   	 // Reference to a Math object
	fl.outputPanel                            	 // Reference to Output panel object
	fl.screenTypes                            	 // An array of all ScreenType objects in the system
	fl.tools                                  	 // An array of ToolsObj objects
	fl.version                                	 // Returns the Flash authoring tool´s version
	fl.viewMatrix                             	 // References the TransformationMatrix object
	fl.xmlui                                  	 // References a XMLUI dialog box


//: FolderItem - "Subclass of Item; a folder in the Library"


//: Refer to Item object for properties or methods - "Refer to Item object for properties or methods"


//: FontItem - "Subclass of Item; a font symbol in the Library"


//: Refer to Item object for properties or methods - "Refer to Item object for properties or methods"


//: Frame - "A frame on the Timeline"

	//: Properties - "Properties of the Frame object"
	frame.actionScript                           	 // String containing the ActionScript on a frame
	frame.duration                               	 // Number of frames in a frame span
	frame.elements                               	 // An array of Element objects
	frame.labelType                              	 // This specifies the type of frame label
	frame.motionTweenOrientToPath                	 // If true, object tweens oriented to path
	frame.motionTweenRotate                      	 // Specifies if the object rotates during tween
	frame.motionTweenRotateTimes                 	 // Number of rotations
	frame.motionTweenScale                       	 // If true, object scales while tweening
	frame.motionTweenSnap                        	 // If true, object snaps to motion guide
	frame.motionTweenSync                        	 // If true, tween synchronizes symbols
	frame.name                                   	 // Label of the frame
	frame.shapeTweenBlend                        	 // Specifieds the blend setting for a shape tween
	frame.soundEffect                            	 // The effects on the sound
	frame.soundLibraryItem                       	 // Library item used to instantiate a sound
	frame.soundLoop                              	 // Specifies the number of times a sound loops
	frame.soundLoopMode                          	 // Specifies whether sound should loop or repeat indefinitely
	frame.soundName                              	 // Name of sound
	frame.soundSync                              	 // Specifies the sync behavior of a sound
	frame.startFrame                             	 // The frame number of the first frame in a span
	frame.tweenEasing                            	 // The amount of easing
	frame.tweenType                              	 // The type of tween


//: Functions - "Flash JavaScript functions"
	activate()                              	 // Called when tool becomes active
	configureTool()                         	 // Called when the tool is loaded at launch
	deactivate()                            	 // Called when tool becomes inactive
	keyDown()                               	 // When tool is active, called if key is pressed
	keyUp()                                 	 // When tool is active, called if a key is released
	mouseDoubleClick()                      	 // When tool is active, called if mouse button double clicked
	mouseDown( pt )                         	 // When tool is active, called when the mouse button is pressed
	mouseMove( pt )                         	 // When tool is active, called if mouse moves over the Stage
	mouseUp()                               	 // When tool is active, called if mouse button is released on the Stage
	notifySettingsChanged()                 	 // Notifies tool if user changes options in the PI
	setCursor()                             	 // Allows the tool to set custom cursors


//: HalfEdge - "Half of an edge of a contour"

	//: Methods - "Methods of the HalfEdge object"
	halfEdge.getEdge()                              	 // Returns the Edge object that contains the HalfEdge
	halfEdge.getNext()                              	 // Returns the next HalfEdge
	halfEdge.getOppositeHalfEdge()                  	 // Returns the oposite HalfEdge object
	halfEdge.getPrev()                              	 // Returns the preceding HalfEdge
	halfEdge.getVertex()                            	 // Returns the vertex of the HalfEdge

	//: Properties - "Properties of the HalfEdge object"
	halfEdge.id                                     	 // An unique identifier for the HalfEdge
	halfEdge.index                                  	 // The index of the HalfEdge in the parent Edge


//: Instance - "Subclass of Element; an instance on the Stage"

	//: Properties - "Properties of the Instance object"
	instance.instanceType                           	 // Type of Instance
	instance.libraryItem                            	 // Library item used to instantiate Instance


//: Item - "Items in the Library"

	//: Methods - "Methods of the Item object"
	item.addData( name, type, data )            	 // Adds persistent data to Item
	item.getData( name )                        	 // Returns the value of the named data
	item.hasData( name )                        	 // If true, the Library item has the named data
	item.removeData( name )                     	 // Removes persistent data from the Library item

	//: Properties - "Properties of the Item object"
	item.itemType                               	 // The symbol type of the Item
	item.linkageClassName                       	 // Specifies an ActionScript 2 class to associate with symbol
	item.linkageExportForAS                     	 // If true, the Item will be exported for ActionScript
	item.linkageExportForRS                     	 // If true, the Item will be exported for runtime sharing
	item.linkageExportInFirstFrame              	 // If true, the Item will be exported in the first frame
	item.linkageIdentifier                      	 // The name of the symbol when referenced by ActionScript or runtime sharing
	item.linkageImportForRS                     	 // If true, the Item will be imported for runtime sharing
	item.linkageURL                             	 // Location of the shared asset SWF
	item.name                                   	 // Name of the Library item


//: Layer - "A layer on the Timeline"

	//: Properties - "Properties of the Layer object"
	layer.color                                  	 // The color used to outline objects on the layer
	layer.frameCount                             	 // Total number of frames in the Layer
	layer.frames                                 	 // An array of Frame objects
	layer.height                                 	 // Height of the Layer
	layer.layerType                              	 // Specifies the Layer type
	layer.locked                                 	 // If true, Layer is locked
	layer.name                                   	 // Name of the Layer
	layer.outline                                	 // If TRUE, Layer is displayed as outlines
	layer.parentLayer                            	 // Defines the Layers´s parent Layer
	layer.visible                                	 // If true, Layer is visible


//: Library - "The Library panel"

	//: Methods - "Methods of the Library object"
	library.addItemToDocument( position [, namePath] )	 // Adds an Item from the Library to the document
	library.addNewItem( type [, namePath] )        	 // Creates a new Item
	library.deleteItem( [namePath] )               	 // Deletes an Item
	library.duplicateItem( [namePath] )            	 // Makes a copy of the currently selected Item
	library.editItem( [namePath] )                 	 // Returns true if the specified Item is editable
	library.expandFolder( bExpand [, bRecurseNestedParents] [, namePath] )	 // If true, expands folder; if false collapses it
	library.findItemIndex( namePath )              	 // Returns an object containing the index of the Item
	library.getItemProperty( property )            	 // Returns specified property for a selected Item
	library.getItemType( [namePath] )              	 // Returns the type of the specified Item
	library.getSelectedItems()                     	 // Returns an array containing the selected Items
	library.importEmbeddedSWF( linkageName, swfData [, libName] )	 // Imports a contained SWF to the Library
	library.itemExists( namePath )                 	 // Returns true if the specified Item exists
	library.moveToFolder( folderPath [, itemToMove] [, replace] )	 // Moves Item into a folder
	library.newFolder( [namePath] )                	 // Creates a new Folder
	library.renameItem( namePath )                 	 // Renames selected Item
	library.selectAll( [] )                        	 // Selects all Items
	library.selectItem( namePath [, bReplaceCurrentSelection] [, bSelect] )	 // Selects specified Item
	library.selectNone()                           	 // Deselects all Items
	library.setItemProperty( property, value )     	 // Sets specified property for the currently selected Items
	library.updateItem( [namePath] )               	 // Updates specified Item

	//: Properties - "Properties of the Library object"
	library.items                                  	 // An array containing all Item objects in the Library


//: LinkedVideoInstance - "Subclass of Instance; a linked video instance on the Stage"


//: Refer to Instance object for properties or methods - "Refer to Instance object for properties or methods"


//: Math - "Used to do common mathematical operations"

	//: Methods - "Methods of the Math object"
	Math.concatMatrix( mat1, mat2 )             	 // Performs concatenates the specified Matrix objects
	Math.invertMatrix( mat )                    	 // Returns the inverse of specified Matrix
	Math.pointDistance( pt1, pt2 )              	 // Computes the distance between specified points


//: Matrix - "The transformation matrix"

	//: Properties - "Properties of the Matrix object"
	matrix.a                                      	 // The scale factor to the x axis
	matrix.b                                      	 // Skews object by moving right edge along vertical axis
	matrix.c                                      	 // Skews object by moving bottom edge along horizontal axis
	matrix.d                                      	 // The scale factor to the y axis
	matrix.tx                                     	 // The location of the object along the x axis
	matrix.ty                                     	 // The location of the object along the y axis


//: OutputPanel - "The Output panel"

	//: Methods - "Methods of the OutputPanel object"
	outputPanel.clear()                                	 // Clears contents from the panel
	outputPanel.save( fileURI [, bAppendToFile] )      	 // Saves the contents of the Output Panel to a file
	outputPanel.trace( message )                       	 // Sends a test string to the Output panel


//: Parameter - "Parameters for a Screen or Component"

	//: Methods - "Methods of the Parameter object"
	parameter.insertItem( index, name, value, type ) 	 // Inserts Parameter into a list, object, or array
	parameter.removeItem( index )                    	 // Deletes Parameter from a list, object, or array

	//: Properties - "Properties of the Parameter object"
	parameter.category                               	 // Groups items in the Components panel, or organizes Screens
	parameter.listIndex                              	 // The value of the specified item; for type list only
	parameter.name                                   	 // The name of Parameter
	parameter.value                                  	 // The value of the property
	parameter.valueType                              	 // The property´s value type
	parameter.verbose                                	 // Determines if Parameter appears in Properties Inspector


//: Path - "Contains a defined sequence of line segments"

	//: Methods - "Methods of the Path object"
	newPath.addCubicCurve( xAnchor, yAnchor, x1, y1, x2, y, x4, y4 )	 // Appends a cubic Bezier curve segment to Path
	newPath.addCurve( x0, y0, x1, y1 )             	 // Appends a quadratic Bezier segment to Path
	newPath.addPoint( x, y )                       	 // Adds a point to the Path
	newPath.clear()                                	 // Removes all points from the Path
	newPath.close()                                	 // Appends a point at the location of the first point of the Path
	newPath.makeShape( [bSupressFill] [, bSupressStroke] )	 // Creates a shape
	newPath.newContour()                           	 // Starts a new Contour in the Path

	//: Properties - "Properties of the Path object"
	newPath.nPts                                   	 // Returns integer representing the number of points in the Path


//: Screen - "A Screen in the ScreenOutline"

	//: Properties - "Properties of the Screen object"
	screen.accName                                	 // Name of an object, used by screen reader
	screen.childScreens                           	 // An array of child Screens
	screen.description                            	 // Description of the object, used by screen reader
	screen.forceSimple                            	 // If true, the children of the object are not accessible to screen reader
	screen.hidden                                 	 // If true, Screen is not visible by any other Screens
	screen.instanceName                           	 // The Screen´s instance name
	screen.name                                   	 // The name of the Screen
	screen.nextScreen                             	 // The next sibling in a childScreen array
	screen.parameters                             	 // The properties in the Screen´s Property Inspector
	screen.parentScreen                           	 // A Screen which has childScreens
	screen.prevScreen                             	 // The previous sibling in a childScreen array
	screen.screenType                             	 // The ScreenType which created the Screen
	screen.screenTypeVersion                      	 // The template version which created the Screen
	screen.silent                                 	 // If true, object is not read by screen reader
	screen.tabIndex                               	 // tabIndex value of an object
	screen.timeline                               	 // The Timeline object for a Screen


//: ScreenOutline - "The Screen Outline pane"

	//: Methods - "Methods of the ScreenOutline object"
	screenOutline.copyScreenFromFile( fileURI [, screenName] )	 // Inserts all Screens from specified URI
	screenOutline.deleteScreen( [screenName] )           	 // Deletes a Screen
	screenOutline.duplicateScreen( [screenName] )        	 // Duplicates a Screen
	screenOutline.getSelectedScreens()                   	 // Returns an array of selected Screens
	screenOutline.insertNestedScreen( [name] [, referenceScreen] [, screenTypeName] )	 // Inserts a child screen
	screenOutline.insertScreen( [name] [, referenceScreen] [, screenTypeName] )	 // Adds a new Screen
	screenOutline.moveScreen( screenToMove, referenceScreen, position )	 // Relocates a Screen
	screenOutline.renameScreen( newScreenName [, oldScreenName] [, bDisplayError] )	 // Changes Screen´s name
	screenOutline.setCurrentScreen( name )               	 // Sets current screen
	screenOutline.setScreenProperty( property, value )   	 // Sets specified property´s value
	screenOutline.setSelectedScreens( selection, bReplaceCurrentSelection )	 // Selects one or more Screens

	//: Properties - "Properties of the ScreenOutline object"
	screenOutline.currentScreen                          	 // The focused Screen in the Screen Outline pane and on the Stage
	screenOutline.screens                                	 // An array of Screens


//: ScreenType - "A single ScreenType"

	//: Methods - "Methods of the ScreenType object"
	screenType.closeWizardDialog()                    	 // Closes the prior wizard
	screenType.getJSFLContext()                       	 // Calls a method defined within a Flash JavaScript document
	screenType.invoke()                               	 // Invokes a ScreenType wizard
	screenType.openWizardDialog()                     	 // Opens a ScreenType´s wizard dialog

	//: Properties - "Properties of the ScreenType object"
	screenType.name                                   	 // The name of the ScreenType
	screenType.version                                	 // The version of the ScreenType


//: Shape - "Subclass of Element; represents a shape on the Stage"

	//: Methods - "Methods of the Shape object"
	shape.beginEdit()                            	 // Defines the start of an edit session
	shape.deleteEdge( index )                    	 // Deletes the specified Edge
	shape.endEdit()                              	 // Defines the end of an edit session

	//: Properties - "Properties of the Shape object"
	shape.contours                               	 // An array of Contour objects
	shape.edges                                  	 // An array of Edge objects
	shape.isGroup                                	 // Returns true if selected element is a group
	shape.vertices                               	 // An array of Vertex objects


//: SoundItem - "Subclass of Item; a sound in the Library"

	//: Properties - "Properties of the SoundItem object"
	soundItem.bitRate                                	 // MP3 compression bitrate
	soundItem.bits                                   	 // Type of ADPCM compression
	soundItem.compressionType                        	 // Type of compression
	soundItem.convertStereoToMono                    	 // If true, converts a stereo sound to mono
	soundItem.quality                                	 // MP3 compression quality setting
	soundItem.sampleRate                             	 // The sample rate
	soundItem.useImportedMP3Quality                  	 // If true, the imported MP3 quality is used


//: Stroke - "Stroke settings for the selection or the Toolbar"

	//: Properties - "Properties of the Stroke object"
	stroke.breakAtCorners                         	 // If true, enables the Sharp Corners setting in Custom Stroke dialog
	stroke.color                                  	 // Stroke color
	stroke.curve                                  	 // Specifies the curved setting; hatch line only
	stroke.dash1                                  	 // Length of solid part of dash
	stroke.dash2                                  	 // Length of space between dashes
	stroke.density                                	 // Density of stippled line
	stroke.dotSize                                	 // Dot size of stippled line
	stroke.dotspace                               	 // Spacing between dots of dotted line
	stroke.hatchThickness                         	 // Thickness of hatches in hatched line
	stroke.jiggle                                 	 // Jiggle style of hatched line
	stroke.length                                 	 // Length of hatches in hatched line
	stroke.pattern                                	 // Pattern of ragged line
	stroke.rotate                                 	 // Rotation style of hatched line
	stroke.space                                  	 // Length of spaces between hatches of a hatched line
	stroke.style                                  	 // Stroke style setting
	stroke.thickness                              	 // Width of Stroke
	stroke.variation                              	 // Variation style of stippled line
	stroke.waveHeight                             	 // Wave style of ragged line


//: SymbolInstance - "Subclass of Instance; a symbol instance on the Stage"

	//: Properties - "Properties of the SymbolInstance object"
	symbolInstance.accName                                	 // Name of an object, used by screen reader
	symbolInstance.actionScript                           	 // String representing the ActionScript on an instance
	symbolInstance.buttonTracking                         	 // Sets button options
	symbolInstance.colorAlphaAmount                       	 // Reduces or increases tint and alpha values by a constant amount
	symbolInstance.colorAlphaPercent                      	 // Reduces or increases tint and alpha values by percentage
	symbolInstance.colorBlueAmount                        	 // Reduces or increases the blue tint by specified value
	symbolInstance.colorBluePercent                       	 // Reduces or increases the blue tint by specified percentage
	symbolInstance.colorGreenAmount                       	 // Reduces or increases the green tint by specified value
	symbolInstance.colorGreenPercent                      	 // Reduces or increases the green tint by specified percentage
	symbolInstance.colorMode                              	 // The color mode as identified in the Instance PI
	symbolInstance.colorRedAmount                         	 // Reduces or increases the red tint by specified value
	symbolInstance.colorRedPercent                        	 // Reduces or increases the red tint for selected instance by specified percentage
	symbolInstance.description                            	 // Description of the object, used by screen reader
	symbolInstance.firstFrame                             	 // Specifies which frame of a graphic symbol to display first
	symbolInstance.forceSimple                            	 // If true, the children of the object are not accessible to screen reader
	symbolInstance.loop                                   	 // Specifies the loop setting for a graphic symbol
	symbolInstance.shortcut                               	 // An object´s shortcut key
	symbolInstance.silent                                 	 // If true, object is not read by screen reader
	symbolInstance.symbolType                             	 // Specifies the symbol type of an instance
	symbolInstance.tabIndex                               	 // tabIndex value of an object


//: SymbolItem - "Subclass of Item; a symbol in the Library"

	//: Methods - "Methods of the SymbolItem object"
	symbolItem.convertToCompiledClip()                	 // Converts a symbol to a compiled clip
	symbolItem.exportSWC( outputURI )                 	 // Exports a symbol to a SWC
	symbolItem.exportSWF( outputURI )                 	 // Exports a symbol to a SWF

	//: Properties - "Properties of the SymbolItem object"
	symbolItem.sourceAutoUpdate                       	 // If true, Shared Library symbol updates when published
	symbolItem.sourceFilePath                         	 // Source path for Shared Library symbol
	symbolItem.sourceLibraryName                      	 // Name of the symbol in source file
	symbolItem.symbolType                             	 // Specifies the symbol type
	symbolItem.timeline                               	 // The Timeine object for the symbol


//: Text - "Subclass of Element; a text field on the Stage"

	//: Methods - "Methods of the Text object"
	text.getTextAttr( attrName [, startIndex] [, endIndex] )	 // Returns the specified text attribute
	text.getTextString( startIndex, endIndex )  	 // Returns the text string contained in the specified range
	text.setTextAttr( attrName, attrValue [, startIndex] [, endIndex] )	 // Sets the specified text attribute
	text.setTextString( text [, startIndex] [, endIndex] )	 // Sets the text string within the text object

	//: Properties - "Properties of the Text object"
	text.accName                                	 // Name of an object, used by screen reader
	text.autoExpand                             	 // If true, the bounding width expands to display all text
	text.border                                 	 // If true, displays a border around dynamic or input text
	text.description                            	 // Description of the object, used by screen reader
	text.embeddedCharacters                     	 // Embeds all specified characters
	text.embedRanges                            	 // Specifies ranges of characters to embed
	text.length                                 	 // The number of characters in a text object
	text.lineType                               	 // The type of text line
	text.maxCharacters                          	 // Specifies the maximum characters
	text.orientation                            	 // Specifies the orientation of the text
	text.renderAsHTML                           	 // If true, text renders as HTML
	text.scrollable                             	 // If true, text can be scrolled
	text.selectable                             	 // If true, text can be selected
	text.selectionEnd                           	 // Offset of the end of a text subselection
	text.selectionStart                         	 // Offset of the beginning of a text subselection
	text.shortcut                               	 // An object´s shortcut key
	text.silent                                 	 // If true, object is not read by screen reader
	text.tabIndex                               	 // tabIndex value of an object
	text.textRuns                               	 // An array of TextRun objects
	text.textType                               	 // The type of text field
	text.useDeviceFonts                         	 // If true, renders text using device font
	text.variableName                           	 // Stores the contents of text field in a variable name


//: TextAttrs - "Subclass of TextRun; contains properties applicable to a subselection"

	//: Properties - "Properties of the TextAttrs object"
	textAttrs.aliasText                              	 // If true, text renders aliased
	textAttrs.alignment                              	 // Paragraph justification
	textAttrs.autoKern                               	 // If true, pair kerning is used
	textAttrs.bold                                   	 // If true, text is displayed as bold
	textAttrs.characterPosition                      	 // The vertical position of text
	textAttrs.characterSpacing                       	 // Integer representing the space between characters
	textAttrs.face                                   	 // The name of the font
	textAttrs.fillColor                              	 // A hexadecimal color string
	textAttrs.indent                                 	 // Paragraph indentation
	textAttrs.italic                                 	 // If true, text is displayed in italics
	textAttrs.leftMargin                             	 // A paragraph´s left margin
	textAttrs.lineSpacing                            	 // A paragraph´s line spacing
	textAttrs.rightMargin                            	 // A paragraph´s right margin
	textAttrs.rotation                               	 // If true, characters are rotated 90 degrees
	textAttrs.size                                   	 // The size of the font
	textAttrs.target                                 	 // The string for the target
	textAttrs.url                                    	 // A string representing an URL


//: TextRun - "Subclass of Text; a string of characters"

	//: Properties - "Properties of the TextRun object"
	textRun.characters                             	 // The text contained in a TextRun object
	textRun.textAttrs                              	 // TextAttrs object containing the attributes of a run of text


//: Timeline - "The Timeline"

	//: Methods - "Methods of the Timeline object"
	timeline.addMotionGuide()                       	 // Adds a motion guide layer
	timeline.addNewLayer( [name] [, layerType] [, bAddAbove] )	 // Adds a new layer
	timeline.clearFrames( [startFrame] [, endFrame] )	 // Deletes all the contents from within a frame
	timeline.clearKeyframes( [startFrame] [, endFrame] )	 // Converts keyframe to a regular frame and deletes its contents
	timeline.convertToBlankKeyframes( [startFrame] [, endFrame] )	 // Converts specified frame to a blank keyframe
	timeline.convertToKeyframes( [startFrame] [, endFrame] )	 // Converts specified frames to keyframes
	timeline.copyFrames( [startFrame] [, endFrame] )	 // Copies specified frames to the clipboard
	timeline.createMotionTween( [startFrame] [, endFrame] )	 // Creates a motion tween, converts frame´s contents into a symbol if it isn´t one
	timeline.cutFrames( [startFrame] [, endFrame] ) 	 // Cuts specified frames to the clipboard
	timeline.deleteLayer( [index] )                 	 // Deletes layer in timeline
	timeline.expandFolder( bExpand [, bRecurseNestedParents] [, index] )	 // If true, expands layer folder; if false, collapses it
	timeline.findLayerIndex( name )                 	 // Returns an array of indices for Layers with specified name
	timeline.getFrameProperty( property )           	 // Returns the specified Frame property
	timeline.getLayerProperty( property )           	 // Returns the specified Layer property
	timeline.getSelectedFrames()                    	 // Returns an array containing the indices of the selected Frames
	timeline.getSelectedLayers()                    	 // Returns an array containing the indices of the selected Layers
	timeline.insertBlankKeyframe( [frameNum] )      	 // Inserts a blank keyframe
	timeline.insertFrames( [numFrames] [, bAllLayers] [, frameNum] )	 // Inserts specified number of frames
	timeline.insertKeyframe( [frameNum] )           	 // Inserts a keyframe
	timeline.pasteFrames( [startFrame] [, endFrame] )	 // Pastes frames from the clipboard into a range of frames
	timeline.removeFrames( [startFrame] [, endFrame] )	 // Deletes the frame
	timeline.reorderLayer( layerToMove, layerToPutItBy [, bAddBefore] )	 // Moves the specified layer
	timeline.reverseFrames( [startFrame] [, endFrame] )	 // Reverses a range of frames
	timeline.selectAllFrames()                      	 // Selects all the frames in the current timeline
	timeline.setFrameProperty( property, value [, startFrame] [, endFrame] )	 // Sets the specified frame property
	timeline.setLayerProperty( property, value [, layersToChange] )	 // Sets the specified layer property
	timeline.setSelectedFrames( startFrame, endFrame [, bReplaceCurrentSelection] )	 // Selects specified frames in the current layer
	timeline.setSelectedFrames( selectionList [, bReplaceCurrentSelection] )	 // Selects the frames specified in the selection array
	timeline.setSelectedLayers( index [, bReplaceCurrentSelection] )	 // Selects specified layers and all the frames in those layers
	timeline.showLayerMasking( [layer] )            	 // If true, displays layer masking

	//: Properties - "Properties of the Timeline object"
	timeline.currentFrame                           	 // Frame index for the location of playhead
	timeline.currentLayer                           	 // The currently active layer
	timeline.frameCount                             	 // Number of frames in the longest layer in specified timeline
	timeline.layerCount                             	 // The number of layers in specified Timeline
	timeline.layers                                 	 // An array of Layer objects
	timeline.name                                   	 // Name of the Timeline; same as Scene name


//: ToolObj - "Represents an individual tool"

	//: Methods - "Methods of the ToolObj object"
	toolObj.enablePIControl( control, enable )     	 // Enables or disables a control in the PI
	toolObj.setIcon( file )                        	 // Specifies PNG file to use as tool icon
	toolObj.setMenuString( menuStr )               	 // Sets the string for pop menu of tool
	toolObj.setOptionsFile( xmlFIle )              	 // Sets the options file for a tool
	toolObj.setPI( pi )                            	 // Sets which PI to use with a tool
	toolObj.setToolName( name )                    	 // Sets the name of the tool
	toolObj.setToolTip( toolTip )                  	 // Sets the tooltip for the tool
	toolObj.showPIControl( control, show )         	 // Shows or hides specified control in the PI
	toolObj.showTransformHandles( show )           	 // If true, free transform handles are displayed when tool is active

	//: Properties - "Properties of the ToolObj object"
	toolObj.depth                                  	 // Location of the tool in popup menu
	toolObj.iconID                                 	 // Resource ID of the tool
	toolObj.position                               	 // Location of the tool in toolbar


//: Tools - "Records input from keyboard and mouse"

	//: Methods - "Methods of the Tools object"
	tools.getKeyDown()                           	 // Returns the last key pressed
	tools.setCursor( cursor )                    	 // Sets which cursor the tool uses

	//: Properties - "Properties of the Tools object"
	tools.activeTool                             	 // Returns the ToolObj object for the currently active tool
	tools.altIsDown                              	 // If TRUE, alt key is pressed
	tools.constrainPoint                         	 // Allows Tools movements to be constrained
	tools.ctlIsDown                              	 // If TRUE, control key is down
	tools.mouseIsDown                            	 // If TRUE, left mouse button is pressed
	tools.penDownLoc                             	 // The position of the last mouse down event
	tools.penLoc                                 	 // The current location of the mouse
	tools.shiftIsDown                            	 // If TRUE, shift key is pressed
	tools.snapPoint                              	 // If a snap setting is on, returns the point which snaps
	tools.toolObjs                               	 // An array of ToolObj objects


//: Vertex - "Contains the coordinate data of a shape"

	//: Methods - "Methods of the Vertex object"
	vertex.getHalfEdge()                          	 // Returns the HalfEdge that shares a vertex
	vertex.setLocation( x, y )                    	 // Sets the location of a vertex

	//: Properties - "Properties of the Vertex object"
	vertex.x                                      	 // The x location of the vertex
	vertex.y                                      	 // The y location of the vertex


//: VideoItem - "Subclass of Item; a video in the Library"


//: Refer to Item object for properties or methods - "Refer to Item object for properties or methods"


//: XMLUI - "XMLUI dialog box"

	//: Methods - "Methods of the XMLUI object"
	xmlui.accept()                               	 // Exits XMLUI dialog with an accept state
	xmlui.cancel()                               	 // Exits XMLUI dialog with a cancel state
	xmlui.get( name )                            	 // Returns specified property´s value in the XMLUI dialog box
	xmlui.set( name, value )                     	 // Sets specified property´s value in the XMLUI dialog box
