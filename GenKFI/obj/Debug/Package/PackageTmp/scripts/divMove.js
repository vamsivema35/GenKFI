/* @#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#
	movement and coloring functions for scrolling around the image
   @#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#*/


intMove = 0;
function startMove(strDirection, markerToo)
{
	intMove = setInterval("changeDirection('" + strDirection + "', " + markerToo + ")", 10);

}
function stopMove()
{
	window.clearInterval(intMove);
}
function changeDirection(strDirection, markerToo)
{
	// Moves image when the arrow key is pressed - usually when a bad scan occurs. 
	// Adds value to hidden variable to retain positioning for future controls 
	var intLeft = $("#divImageDrag img").position().left;
    var intTop = $("#divImageDrag img").position().top;

	switch(strDirection)
	{
		case "up":
		{
			$("#divImageDrag").offset({ top: $("#divImageDrag").offset().top - 1 });
			if(markerToo == true)
				$("#divMarker").offset({ top: $("#divMarker").offset().top - 1 });
			$("#hidTop").val(parseInt($("#hidTop").val()) - 1);
			break;
		}
		case "down":
		{
            $("#divImageDrag").offset({ top: $("#divImageDrag").offset().top + 1 });
			if(markerToo == true)
				$("#divMarker").offset({ top: $("#divMarker").offset().top + 1 });
			$("#hidTop").val(parseInt($("#hidTop").val()) + 1);
			break;
		}
		case "left":
		{
			$("#divImageDrag").offset({ left: $("#divImageDrag").offset().left - 1 });
			if(markerToo == true)
				$("#divMarker").offset({ left: $("#divMarker").offset().left - 1 });
			$("#hidLeft").val(parseInt($("#hidLeft").val()) - 1);
			break;
		}
		case "right":
		{
			$("#divImageDrag").offset({ left: $("#divImageDrag").offset().left + 1 });
			if(markerToo == true)
				$("#divMarker").offset({ left: $("#divMarker").offset().left + 1 });
			$("#hidLeft").val(parseInt($("#hidLeft").val()) + 1);
			break;
		}

		default:
		{
			break;
		}
	}
}
// Keep List of Required Fields that have been Touched


function CtlMove(intValue, intTopBot)
{
	//This function scrolls the control block on focus
	//@#@#var intScrollPosition = parseInt(intValue);
    //@#@#document.getElementById("divControls").scrollTop = intScrollPosition;   - (2 * parseInt($('#imageOffsetHID').val())   - (2 * parseInt($('#markerOffsetHID').val())

//    console.log('CtlMove: ', intValue, ' ', intTopBot);

	$("#divControls").scrollLeft(0);
	$("#divControls").scrollTop(intValue);

	if ($("*:focus") != null)
	{
	    var id = "#" + $("*:focus").attr("id");
//    check position
//	    console.log('Position: ', $(id).position().top);

	    var k = id.substring(id.length - 2, id.length);

	    if (isNaN(k))
	        k = id.substring(id.length - 1, id.length);

	    if (!isNaN(k)) {


//	    console.log('Ctl Values: ', parseInt(k), ' ', intTopBot, ' ', parseInt($('#divOffsetHID').val()));

//    	    if ((parseInt(k) * intTopBot) != parseInt($('#divOffsetHID').val()))
//	        {
//	        var alignToIt = "tableCtrl" + k.toString();

//	        $('#divImageDrag').offset({ top: $('#divImageDrag').position().top + $('#' + alignToIt).offset().top + $(id).position().top });
//	        $('#divMarker').offset({ top: $('#divMarker').offset().top + $('#' + alignToIt).offset().top + $(id).position().top });
//	    }

	             $('#divOffsetHID').val((parseInt(k) * intTopBot).toString());
                 $("#divControls").scrollTop(intValue + parseInt($('#divOffsetHID').val()));
//	        } 

	    }

	    if ($(id).position() != null)
		{
			if($(id).position().top > $("#divControls").height())
			    $("#divControls").scrollTop($("#divControls").scrollTop() + $(id).position().top - $("#divControls").height() + 30);
        }
	}
}

function MarkMove(intLeft, intTop)
{
//    console.log('MarkMove: ', intLeft, ' ', intTop);
	$("#divMarker").animate({ left: intLeft + $(window).width() / 2, top: intTop }, 150);
}

function ImgMove(intLeft, intTop)
{
//    console.log('ImgMove: ', intLeft, ' ', intTop);
    $("#divImageDrag").animate({ left: intLeft, top: intTop }, 150);
	document.getElementById("imgScroll").style.visibility = "visible";
}

// imageMove and markerMove are booleans indicating if that movement should be performed
function moveStuff(imgLand, imgLeft, imgTop, imageMove, markLeft, markTop, markerMove, alignToControlName, repeatOffset)
{
//    console.log('MoveStuff: ', imgLeft, ' ', imgTop, ' ', markTop, ' ', parseInt($("#hidTop").val()), ' ', parseInt($("#dragToffsetHID").val()));
    // check if a value was passed
	alignToControlName = typeof alignToControlName !== 'undefined' ? alignToControlName : "";
	repeatOffset = typeof repeatOffset !== 'undefined' ? repeatOffset : -1;
//    console.log('MoveStuff: ', imgLeft, ' ', imgTop, ' ', markTop, ' ', parseInt($("#hidTop").val()), ' ', parseInt($("#dragToffsetHID").val()));
//	console.log('More: ', parseInt($("#hidLeft").val()), ' ', parseInt($("#dragLoffsetHID").val()));
//	console.log('ImageOffsetHID: ', parseInt($('#imageOffsetHID').val()));
//	console.log('alignToControlName: ', alignToControlName);
//	console.log('markerOffsetHID: ', parseInt($('#markerOffsetHID').val()));
//	console.log('Align index: ', $('#tableOffsetNameHID').val().indexOf(alignToControlName))
//	console.log('divImageDrag Top: ', $('#divImageDrag').offset().top)
    // check the original zoom factor
	if(origFoomZactor == -1)
		origFoomZactor = foomZactor;


	$('#hidLand').val(imgLand);

	if (imgLand == "0") {
		console.log('Inside imgLand = 0');
		// adjust values if the marker falls off the window
		if (markLeft > $(window).width() / 2 - 25) {
			//	    console.log('Width: ');
			imgLeft -= markLeft - $(window).width() / 2 + 25;
			markLeft = $(window).width() - 25 - $(window).width() / 2;
		}
		if (markTop > $(window).height() - 100) {
			//	    console.log('Height: ');
			imgTop -= markTop - $(window).height() + 100;
			markTop = $(window).height() - 100;
		}

		if (imageMove) {
			// adjust only the top of the image with the zoom
			$("#divImageDrag").css({ top: (markTop - ((markTop - imgTop) / origFoomZactor) * foomZactor) + parseInt($("#hidTop").val()) + parseInt($("#dragToffsetHID").val()) + 'px', left: (imgLeft) + parseInt($("#hidLeft").val()) + parseInt($("#dragLoffsetHID").val()) + 'px' });
			$("#dragTHID").val($("#divImageDrag").css("top").replace("px", ""));
			$("#dragLHID").val($("#divImageDrag").css("left").replace("px", ""));
			document.getElementById("imgScroll").style.visibility = "visible";
		}
		if (markerMove) {
			// adjust only the left ofthe marker with zoom
			$("#divMarker").css({ top: markTop + parseInt($("#dragToffsetHID").val()) + 'px', left: (markLeft / origFoomZactor) * foomZactor + parseInt($("#dragLoffsetHID").val()) + 'px' });
		}

		// not passed, then leave   ($('#divImageDrag').position().top))
		if (alignToControlName == "" || repeatOffset == -1)
			return;
		//	console.log('ImageOffsetHID: ', parseInt($('#imageOffsetHID').val()));
		//	console.log('alignToControlName: ', alignToControlName);
		//	console.log('markerOffsetHID: ', parseInt($('#markerOffsetHID').val()));
		//	console.log('Align index: ', $('#tableOffsetNameHID').val().indexOf(alignToControlName))
		//	console.log('divImageDrag Top: ', $('#divImageDrag').offset().top)


		// only do this once, save the table name in the hidden control, and each new table will reinit for that offset
		if ($('#tableOffsetNameHID').val().indexOf(alignToControlName) == -1) {
			$('#tableOffsetNameHID').val(alignToControlName);
			$('#divImageDrag').offset({ top: $('#divImageDrag').offset().top - $('#divMarker').offset().top + $('#' + alignToControlName).offset().top + 17 });
			$('#divMarker').offset({ top: $('#' + alignToControlName).offset().top + 17 });
			// save the offset from where it want's to be to where we just put it, top values only
			$('#markerOffsetHID').val($('#divMarker').offset().top - markTop);
			$('#imageOffsetHID').val($('#divImageDrag').offset().top - imgTop);
			//		$('#imageOffsetHID').val(0);
			//		$('#markerOffsetHID').val(-74);
		}
		// else, we already inited, use the saved offsets with the passed values
		else {
			// move it from where we just put it, with the offsets
			$('#divImageDrag').offset({ top: $('#divImageDrag').position().top + parseInt($('#imageOffsetHID').val()) });
			$('#divMarker').offset({ top: $('#divMarker').offset().top + parseInt($('#markerOffsetHID').val()) });
		}

	}
	else {
		$("#divImageDrag").css({ top: ((imgTop / origFoomZactor) * foomZactor) + 'px', left: (imgLeft) + 'px' });
		$("#divMarker").css({ top: markTop + 'px', left: (markLeft / origFoomZactor) * foomZactor + 'px' });

    }
	// alternate version, just line up with the control, always
	/*
	$('#divImageDrag').offset({ top: $('#divImageDrag').offset().top - $('#divMarker').offset().top + $('#' + $(':focus').attr('id')).offset().top });
	$('#divMarker').offset({ top: $('#' + $(':focus').attr('id')).offset().top });
	*/
}


// be sure to load the rotate script on the master page before this
/*
<script type="text/javascript">
	//Rotate the image 90 degrees
	// grabbed from here
	// https://code.google.com/p/jqueryrotate/
	$.getScript("<% ResolveClientUrl( "~/scripts/jQueryRotate.2.2.js" ) %>");
</script>
*/
function fncImageRotate()
{
	var intRotate = parseInt($("#hidRotate").val());
	intRotate = (intRotate + 1) % 4;
	$('#divImageDrag img').rotate(90 * intRotate);
	$("#hidRotate").val(intRotate.toString());
}


	//@#@# var intRotate = parseInt(document.getElementById("hidRotate").value);

	// if(intRotate >= 3) intRotate = 0;
	// else intRotate = parseInt(intRotate) + 1;
	// document.getElementById("imgImage").style["-webkit-transform"] = "(" + ( 90 * intRotate ) + "deg)";
	// document.getElementById("imgImage").style["filter"] = "progid:DXImageTransform.Microsoft.BasicImage(rotation=" + intRotate + ");";

//	$("#imgWHID").val($("#<%= imgImage.ClientID %>").width());
//	$("#imgHHID").val($("#<%= imgImage.ClientID %>").height());
//	$("#dragTHID").val($("#divImageDrag").css("top").replace("px", ""));
//	$("#dragLHID").val($("#divImageDrag").css("left").replace("px", ""));



/* @#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#
	other general functions related to the controls 
   @#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#*/
function ChangeColor(tableRow, highlight)
{
	if(highlight)
	{
		tableRow.style.background = 'olive';         //'#dcfac9';
	}
	else
	{
		tableRow.style.background = 'aqua';
	}
}

// moved to chkAction() formattingDB.js