    // Add Stroke to layer      // Javier Aroche                  // Set color as HEX      var strokeColor = new RGBColor();      strokeColor.hexValue = '000000';      addStroke(1, strokeColor, 100, 'inside');                  /*      * Add Stroke Effect      * @param {Number} size : 1 - 250      * @param {Object} color : RGBColor object      * @param {Number} opacity : 0 - 100      * @param {Number} position : center / outside / inside      */      function addStroke(size, color, opacity, position) {          var strokePosCharID;                    switch(position) {              case 'center':                  strokePosCharID = 'CtrF';                  break;              case 'outside':                  strokePosCharID = 'OutF';                  break;              case 'inside':                  strokePosCharID = 'InsF';                  break;              default: break;           }                    var desc = new ActionDescriptor();          var ref190 = new ActionReference();                    ref190.putProperty( charIDToTypeID( "Prpr" ), charIDToTypeID( "Lefx" ) );          ref190.putEnumerated( charIDToTypeID( "Lyr " ), charIDToTypeID( "Ordn" ), charIDToTypeID( "Trgt" ) );          desc.putReference( charIDToTypeID( "null" ), ref190 );                      var fxDesc = new ActionDescriptor();                    var fxPropDesc = new ActionDescriptor();          fxPropDesc.putBoolean( charIDToTypeID( "enab" ), true );          fxPropDesc.putBoolean( stringIDToTypeID( "present" ), true );          fxPropDesc.putBoolean( stringIDToTypeID( "showInDialog" ), true );          fxPropDesc.putEnumerated( charIDToTypeID( "Styl" ), charIDToTypeID( "FStl" ), charIDToTypeID( strokePosCharID ) );          fxPropDesc.putEnumerated(  charIDToTypeID( "PntT" ),  charIDToTypeID( "FrFl" ), charIDToTypeID( "SClr" ) );          fxPropDesc.putEnumerated( charIDToTypeID( "Md  " ), charIDToTypeID( "BlnM" ), charIDToTypeID( "Nrml" ) );          fxPropDesc.putUnitDouble( charIDToTypeID( "Opct" ), charIDToTypeID( "#Prc" ), opacity );          fxPropDesc.putUnitDouble( charIDToTypeID( "Sz  " ), charIDToTypeID( "#Pxl") , size );                      var colorDesc = new ActionDescriptor();          colorDesc.putDouble( charIDToTypeID( "Rd  " ), color.red);          colorDesc.putDouble( charIDToTypeID( "Grn " ), color.green );          colorDesc.putDouble( charIDToTypeID( "Bl  " ), color.blue );          fxPropDesc.putObject( charIDToTypeID( "Clr " ), charIDToTypeID( "RGBC" ), colorDesc );                      fxPropDesc.putBoolean( stringIDToTypeID( "overprint" ), false );          fxDesc.putObject( charIDToTypeID( "FrFX" ), charIDToTypeID( "FrFX" ), fxPropDesc );          desc.putObject( charIDToTypeID( "T   " ), charIDToTypeID( "Lefx" ), fxDesc );          executeAction( charIDToTypeID( "setd" ), desc, DialogModes.NO );      }  