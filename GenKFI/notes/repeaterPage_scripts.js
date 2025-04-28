// this will add enough space on the bottom of the control div to scroll the last 'row' up to about the center of the screen
// by definition all the tables are the same height
$('#ctrlSizer').height( $('#tableCtrl0').height() * ( $('[id*="tableCtrl"]').length + 1 ) );
$('#divControls').scrollTop( $('#tableCtrl0').height() * $('[id*="tableCtrl"]').length );





// this will get the max control table number, and adjust the top of the divImageDrag to line up the marker with the top of the control table
$('#firstCtrl').on( 'focus', function() {
maxNum = -1;
$('[id*=tableCtrl]').each( function( index )
{
	num = parseInt( $( this ).attr( 'id' ).substring( $( this ).attr( 'id' ).length - 1, $( this ).attr( 'id' ).length ) );
	if( num > maxNum )
	{
		maxNum = num;
	}
} );


$('#divImageDrag').offset({ top: $('#divImageDrag').offset().top + ( $('#tableCtrl' + maxNum ).offset().top - $('#divMarker').offset().top ) });
} );

// now we have to figure out how to provide this offset to the image whenever we are on a repeater page, because otherwise it tries to set with it's own values
// however, we still want the marker to do it's movements, we just need to stop the CtrlMove
// and provide an offset to the divImageDrag movements (moveStuff)
