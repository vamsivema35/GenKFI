/*
this file contains all functions related to the change to keeping the formatting types
and codes in the DB table 'rfrFormatTypes', and works as follows:

1) The database has the table 'rfrFormatTypes', which defines a format code, that formats 
description, along with the format functions name. This table is loaded on the formBuild page,
and the user is then allowed to select one of these formats for an entry control.
	a) To add a new formatting function, simply add the formatting function to the document.ready
	function below, and put it's name in the database along with a description.
	b) NOTE: ALL formatting functions must be in the following form:
		// obj is the object with the value to format
		function( obj )
		{
			// do your formatting here, whether it's a verification via regEx,
			// a simple trim, or some other kind of processing. When you are done
			// formatting the value, put it back in the obj and return
			// example below is FEIN

			var strValue = currObj.value;
			var objRegExp = new RegExp('([0-9]{2})([0-9]{7})');
			strValue = $.trim(strValue).replace(/ /g, "");
			if(objRegExp.test(strValue))
			{
				strValue = strValue.replace(objRegExp, '$1-$2');
				return true;
				currObj.value = strValue;
			}
			else
			{
				return false;
			}
		}

2) On use of the form (keyEntry page), the control is linked to the doFormat( funcName )
function below, which in turn calls the named function. This allows new formats to be easily
added or removed without having to make any changes to the form building or key entry pages.
@#@# If the fstrDoLookupType column is not null, it will also call the DoLookup
function for that control.

i) initial insert statement
INSERT INTO rfrFormatTypes ( fstrDesc, fstrFJSfuncName, fstrDoLookupType ) VALUES
( 'Currency', 'fmtCur', NULL ),
( 'Percent', 'fmtPerc', NULL ),
( 'FEIN', 'fmtFein', 'FEIN' ),
( 'CRS', 'fmtCrs', 'CRS' ),
( 'SSN', 'fmtSsn', 'SSN' ),
( 'Phone', 'fmtPh', NULL ),
( 'Email', 'fmtEmail', NULL ),
( 'Zip Code', 'fmtZip', NULL ),
( 'Basic String', 'fmtStr', NULL ),
( 'Long Date (MM-DD-YY)', 'fmtDate', NULL ),
( 'Short Date (MM-YY)', 'fmtSdt', NULL ),
( 'Check Box', 'fmtChk', NULL );
*/

// simply filters to tab or enter to allow formatting to take place

function chkAction(isCheck, currObj) {
    // Check if Mavro Image Key
    switch (window.event.keyCode) {
        case 33:            //Pg Up
            {
                rtnMavCap("Up")
                event.returnValue = false;
                return false;
            }
        case 34:          //Pg Down
            {
                rtnMavCap("Down")
                event.returnValue = false;
                return false;
            }
        case 35:          //End
            {
                rtnMavCap("End")
                event.returnValue = false;
                return false;
            }
        case 36:          //Home
            {
                rtnMavCap("Home")
                event.returnValue = false;
                return false;
            }
        case 123:          //F12
            {
                rtnMavCap("F12")
                event.returnValue = false;
                return false;
            }
    }
    // if enter or tab, cancel the called event (to prevent postback) and return true
    // if space and isCheck, don't cancel (need to check the box) and return true
    // in this case, the called event is onkeydown, so in essence, don't send the key to the control
    // then the script (stored in the DB) if this returns true, formats the control text and selects the next control


    if (window.event.keyCode == 13 || (window.event.keyCode == 9 || (window.event.keyCode == 32 && isCheck == '1')))
        //   && (!window.event.shiftKey)))
    {
        // don't cancel the checkbox
//        if (isCheck != '1') 
            event.returnValue = false;
        return true;
    }
    else return false;
}


    // the main format function, which will call the ones below by name
    // takes the object for format, the format function name,
    //@#@# implement after formatting
    //@#@# and a string of the lookup value for a TP's info, if desired
    function doFormat(obj, funcName, DoLookup, acctType) {
        // we'll see if this works, i think it will
        // var callMe = eval('(' + funcName + ')');
        if (DoLookup != '' && obj.value != '' && obj.value != '999999999') {
            // lVal = $("#txtName").val() + $("#txtStreet").val() + $("#txtCity").val() + $("#txtState").val() + $("#txtZipCode").val();
            // lVal = $.trim(lVal).replace(/ /g, "");
            // if(DoLookup != 0 && lVal.length == 0)
            rtnLookUp($.trim(obj.value.replace(/-/g, '')), DoLookup, obj.name, acctType);
        }
        //callMe(obj);
        // we don't to make the function, just treat the name as a function
        // callMe broke in IE8, but this works in IE8, IE9, and Chrome

        //	alert("Call " & obj.name);

        funcName(obj);
    }

    function selNext(obj) {

        obj.focus();
        if (obj.type != "submit") {
            obj.select();
        }
    }

    // Checkbox and the Mouse was click
    function chkClick(currObj) {
        if (currObj.checked) {
            currObj.value = "1";
            currObj.checked = true;
            //        currObj.checked = "checked";
        }
        else {
            currObj.value = "0";
            currObj.checked = false;
        }
        return true;
    }


    //*******************************************************************************
    // setup the individual formatting functions
    //*******************************************************************************

    // currency
    function fmtCur(currObj) {
        // check it is only digits
        var objRegExp = new RegExp('[0-9]+');
        var strValue = currObj.value;
        if (!objRegExp.test(strValue))
            return false;

        // okay, check and format for commas
        strValue = $.trim(strValue).replace(/ /g, "");
        objRegExp = new RegExp('(-?[0-9]+)([0-9]{3})');
        //check for match to search criteria addCommas
        while (objRegExp.test(strValue)) {
            //replace original string with first group match, 
            //a comma, then second group match
            strValue = strValue.replace(objRegExp, '$1,$2');
            currObj.value = strValue;
        }
        return true;
    }

    // percent
    // XX.X, YY, {0}.ZZ, adds zero if needed
    function fmtPerc(currObj) {
        var strValue = currObj.value;
        var objRegExp = /(^-?\d\d*\.\d*$)|(^-?\d\d*$)|(^-?0?\.\d\d*$)/;
        strValue = $.trim(strValue).replace(/ /g, "");
        if (strValue.substring(0, 1) == ".")
            strValue = "0" + strValue;
        //check for numeric characters
        if (objRegExp.test(strValue)) {
            currObj.value = strValue;
            return true;
        }
        else
            return false;
    }

    // FEIN
    //@#@# has DoLookup
    function fmtFein(currObj) {
        var strValue = currObj.value;
        var objRegExp = new RegExp('([0-9]{2})([0-9]{7})');
        strValue = $.trim(strValue).replace(/ /g, "");
        if (objRegExp.test(strValue)) {
            strValue = strValue.replace(objRegExp, '$1-$2');
            currObj.value = strValue;
            return true;
        }
        else
            return false;
    }

    // CRS
    //@#@# has DoLookup
    function fmtCrs(currObj) {
        var strValue = currObj.value;
        objRegExp = new RegExp('(0[0-9])([0-9]{6})(00[0-9])');
        strValue = $.trim(strValue).replace(/ /g, "");
        if (objRegExp.test(strValue)) {
            strValue = strValue.replace(objRegExp, '$1-$2-$3');
            currObj.value = strValue;
            return true;
        }
        else
            return false;
    }

    // BTID
    //@#@# has DoLookup
    function fmtBtid(currObj) {
        var strValue = currObj.value;
        objRegExp = new RegExp('(0[0-9])([0-9]{6})(00[0-9])');
        strValue = $.trim(strValue).replace(/ /g, "");
        if (objRegExp.test(strValue)) {
            strValue = strValue.replace(objRegExp, '$1-$2-$3');
            currObj.value = strValue;
            return true;
        }
        else
            return false;
    }

    // WDT
    //@#@# has DoLookup
    function fmtWdt(currObj) {
        var strValue = currObj.value;
        objRegExp = new RegExp('(0[0-9])([0-9]{6})(00[0-9])');
        strValue = $.trim(strValue).replace(/ /g, "");
        if (objRegExp.test(strValue)) {
            strValue = strValue.replace(objRegExp, '$1-$2-$3');
            currObj.value = strValue;
            return true;
        }
        else
            return false;
    }

    // EAN
    //@#@# has DoLookup
    function fmtEan(currObj) {
        var strValue = currObj.value;
        currObj.value = strValue;
        return true;
    }

    // SSN
    //@#@# has DoLookup
    function fmtSsn(currObj) {
        var strValue = currObj.value;
        objRegExp = new RegExp('([0-9]|[Pp]{1})([0-9]{2})([0-9]{2})([0-9]{4})');
        strValue = $.trim(strValue).replace(/ /g, "").toUpperCase();
        if (objRegExp.test(strValue)) {
            strValue = strValue.replace(objRegExp, '$1$2-$3-$4');
            currObj.value = strValue;
            return true;
        }
        else
            return false;
    }

    // phone
    function fmtPh(currObj) {
        var strValue = currObj.value;
        // check for 7 or 10 digits
        if (strValue.length == 10) {
            objRegExp = new RegExp('([0-9]{3})([0-9]{3})([0-9]{4})');
            strValue = $.trim(strValue).replace(/ /g, "");
            if (objRegExp.test(strValue)) {
                strValue = strValue.replace(objRegExp, '$1-$2-$3');
                currObj.value = strValue;
                return true;
            }
            else
                return false;
        }
        else if (strValue.length == 7) {
            objRegExp = new RegExp('([0-9]{3})([0-9]{4})');
            strValue = $.trim(strValue).replace(/ /g, "");
            if (objRegExp.test(strValue)) {
                strValue = strValue.replace(objRegExp, '$1-$2');
                currObj.value = "505-" + strValue;
                return true;
            }
            else
                return false;
        }
    }

    // email
    function fmtEmail(currObj, focObj) {
        var objregex = new RegExp(/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/);
        var strValue = currObj.value;
        strValue = $.trim(strValue).replace(/ /g, "");
        if (objregex.test(strValue)) {
            currObj.value = strValue;
            return true;
        }
        else
            return false;
    }

    // zip code
    function fmtZip(currObj) {
        var strValue = currObj.value
        strValue = $.trim(strValue).replace(/ /g, "");

        if (strValue.length > 5) {
            var objRegExp = new RegExp('([0-9]{5})([0-9]+)');
            if (objRegExp.test(strValue)) {
                strValue = strValue.replace(objRegExp, '$1-$2');
                currObj.value = strValue;
                return true;
            }
            else
                return false;
        }
        else if (strValue.length = 5) {
            var objRegExp = new RegExp('([0-9]{5})');
            if (objRegExp.test(strValue)) {
                strValue = strValue.replace(objRegExp, '$1-0000')
                currObj.value = strValue;
                return true;
            }
            else
                return true;
        }
        // something else is wrong
        return false;

    }

    // basic string
    function fmtStr(currObj) {
        var strValue = currObj.value;
        // removed "replace all spaces", strings will need their spaces in the middle
        // still trim the whitespace though
        strValue = $.trim(strValue);
        // also trim to max length
        //	strValue = strValue.substring(0, $(currObj).attr('maxlength'));
        currObj.value = strValue.toUpperCase();
        return true;
    }

    // long date
    // MM-dd-yy
    function fmtDate(currObj, focObj) {
        var strValue = currObj.value;
        var objRegExp;
        strValue = $.trim(strValue).replace(/ /g, "");
        objRegExp = new RegExp('([0-9]{2})([0-9]{2})([0-9]{2})');
        if (objRegExp.test(strValue)) {
            strValue = strValue.replace(objRegExp, '$1/$2/$3');
            currObj.value = strValue;
            return true;
        }
        else
            return false;
    }

    // Start Short Date
    // mm-yy
    // first of month for now
    // in the future there will be no more short dates, they will all be full dates
    function fmtSdt(currObj, focObj) {
        var strValue = currObj.value;
        var intYr;
        var intMth;
        var intDay;
        var strMth;
        var intHld;
        var intPrevYr;
        var strPrevYr;
        var strYr;
        var curDate = new Date();
        var tempYr = String(curDate.getFullYear());
        var datePatTen = /^(\d{1,2})(\/|-)(\d{1,2})(\/|-)(\d{4})$/;
        var strPass = 'NO';

        //	var objRegExp;
        strValue = $.trim(strValue).replace(/ /g, "");
        switch (strValue.length) {
            case (4): {
                intYr = parseInt(strValue.substring(2, 4), 10);
                intMth = parseInt(strValue.substring(0, 2), 10);
                intDay = "01";
                strYr = strValue.substring(2, 4);
                intHld = parseInt(tempYr.substring(2, 4));
                intHld = intHld + 1;

                if (intYr > intHld) {
                    intPrevYr = parseInt(tempYr.substring(0, 2));
                    intPrevYr = intPrevYr - 1;
                    strPrevYr = intPrevYr.toString();
                    strYr = strPrevYr.concat(strYr);
                }
                else {
                    strYr = tempYr.substring(0, 2).concat(strYr);
                }

                if (intMth < 1 || intMth > 12) {
                    alert("Month must be between 01 and 12");
                }
                if (intMth < 10) {
                    strMth = "0".concat(intMth);
                }
                else {
                    strMth = intMth;
                }
                strValue = strMth + "/" + intDay + "/" + strYr;
                strPass = "YES";
                break;
            }
            case (10): {
                var matchArray = strValue.match(datePatTen);    // is the format ok?
                if (matchArray == null) {
                    alert("Please enter date MMYY");
                    strValue = "";
                    return false;
                }

                intMth = matchArray[1]; // p@rse date into variables
                intDay = matchArray[3];
                intYr = matchArray[5];

                if (intMth < 1 || intMth > 12) { // check month range
                    alert("Month must be between 1 and 12.");
                    return false;
                }

                if (intDay < 1 || intDay > 31) {
                    alert("Day must be between 1 and 31.");
                    return false;
                }

                if ((intMth == 4 || intMth == 6 || intMth == 9 || intMth == 11) && intDay == 31) {
                    alert("Month " + intMth + " doesn`t have 31 days!")
                    return false;
                }

                if (intMth == 2) { // check for february 29th
                    var isleap = (intYr % 4 == 0 && (intYr % 100 != 0 || intYr % 400 == 0));
                    if (intDay > 29 || (intDay == 29 && !isleap)) {
                        alert("February " + intYr + " doesn`t have " + intDay + " days!");
                        return false;
                    }
                }
                break;
            }
            default: {
                alert("Invalid Date - Enter MMYY");
                break;
            }
        }

        // strValue = strValue.ToString("MM/DD/YYYY");     // what if wrong
        if (strPass == "YES")
            currObj.value = strValue;
        return true;

        //	objRegExp = new RegExp('([0-9]{2})([0-9]{2})');
        //	if(objRegExp.test(strValue))
        //	{
        //		strValue = strValue.replace(objRegExp, '$1/01/$2');
        //		currObj.value = strValue;
        //		return true;
        //	}
        //	else
        //		return false;
    }

    // End Short Date  MMYY
    // mm-yy
    // Last of month for now
    // in the future there will be no more short dates, they will all be full dates
    function fmtEdt(currObj, focObj) {
        var strValue = currObj.value;
        var intYr;
        var intMth;
        var intDay;
        var strMth;
        var intHld;
        var intPrevYr;
        var strPrevYr;
        var strYr;
        var curDate = new Date();
        var tempYr = String(curDate.getFullYear());
        var datePatTen = /^(\d{1,2})(\/|-)(\d{1,2})(\/|-)(\d{4})$/;
        var strPass = 'NO';

        strValue = $.trim(strValue).replace(/ /g, "");          // Trim

        switch (strValue.length) {
            case (4): {
                intYr = parseInt(strValue.substring(2, 4), 10);
                intMth = parseInt(strValue.substring(0, 2), 10);
                intDay = 31;
                strYr = strValue.substring(2, 4);
                intHld = parseInt(tempYr.substring(2, 4));
                intHld = intHld + 1;

                if (intYr > intHld) {
                    intPrevYr = parseInt(tempYr.substring(0, 2));
                    intPrevYr = intPrevYr - 1;
                    strPrevYr = intPrevYr.toString();
                    strYr = strPrevYr.concat(strYr);
                }
                else {
                    strYr = tempYr.substring(0, 2).concat(strYr);
                }
                if (intMth < 1 || intMth > 12) {
                    alert("Month must be between 01 and 12");
                }
                if (intMth == 4 || intMth == 6 || intMth == 9 || intMth == 11) {
                    intDay = 30
                }
                if (intMth == 2) {
                    intDay = 28;
                    if (intYr % 4 == 0 && (intYr % 100 != 0 || intYr % 400 == 0))    // leap year - Century
                    {
                        intDay = 29;
                    }
                }
                if (intMth < 10) {
                    strMth = "0".concat(intMth);
                }
                else {
                    strMth = intMth;
                }
                strValue = strMth + "/" + intDay + "/" + strYr;
                strPass = "YES";
                break;
            }
            case (10): {
                var matchArray = strValue.match(datePatTen);    // is the format ok?
                if (matchArray == null) {
                    alert("Please enter date MMYY");
                    strValue = "";
                    return false;
                }

                intMth = matchArray[1]; // p@rse date into variables
                intDay = matchArray[3];
                intYr = matchArray[5];

                if (intMth < 1 || intMth > 12) { // check month range
                    alert("Month must be between 1 and 12.");
                    return false;
                }

                if (intDay < 1 || intDay > 31) {
                    alert("Day must be between 1 and 31.");
                    return false;
                }

                if ((intMth == 4 || intMth == 6 || intMth == 9 || intMth == 11) && intDay == 31) {
                    alert("Month " + intMth + " doesn`t have 31 days!")
                    return false;
                }

                if (intMth == 2) { // check for february 29th
                    var isleap = (intYr % 4 == 0 && (intYr % 100 != 0 || intYr % 400 == 0));
                    if (intDay > 29 || (intDay == 29 && !isleap)) {
                        alert("February " + intYr + " doesn`t have " + intDay + " days!");
                        return false;
                    }
                }
                break;
            }
            default: {
                alert("Invalid Date - Enter MMYY");
                break;
            }
        }

        // strValue = strValue.ToString("MM/DD/YYYY");     // what if wrong
        if (strPass == "YES")
            currObj.value = strValue;
        return true;

    }

    // check box
    function fmtChk(currObj) {
        if (window.event.keyCode == 32) {
            if (currObj.value == "1") {
                //		    event.returnValue = false;
                currObj.checked = false;
                currObj.value = "0";
                //			window.event.keyCode = 13;
            }
            else {
                //		    event.returnValue = false;
                currObj.checked = true;
                currObj.value = "1";
                //			window.event.keyCode = 13;
            }

            //  Invalid		Thread.sleep(100);
            //		window.event.cancelBubble = true;
            //		window.event.keyCode = "";
            //		event.returnValue = false;
            //		return false;
        }
        //	if(currObj.checked)
        //	{
        //		currObj.value = "1";
        //		currObj.checked = true;
        //		window.event.keyCode = 13;
        //    }
        //	else
        //	{
        //		currObj.value = "0";
        //		currObj.checked = false;
        //		window.event.keyCode = 13;
        //    }
        //	if((window.event.keyCode == 13 || window.event.keyCode == 9 || window.event.keyCode == 32) && (!window.event.shiftKey))
        //	{
        //	    event.returnValue = false;
        //	    return false;   -- added
        //	}
        // changed from true
        return true;
    }
// check box Boolean Translate
    function fmtBoolTrans(currObj) {
        if (window.event.keyCode == 32) {
            if (currObj.value == "1") {
                currObj.checked = false;
                currObj.value = "0";
            }
            else {
                currObj.checked = true;
                currObj.value = "1";
            }

        }
        return true;
    }
    // just pass through, for checkboxes, will be convered on GenTax insert
    function fmtTrans(currObj, focObj) {
        return true;
    }

    // full date with century
    function fmtFullDate(currObj, focObj) {
        var strValue = currObj.value;
        var objRegExpCCYY, objRegExpYY;
        strValue = $.trim(strValue).replace(/ /g, "");
        objRegExpCCYY = new RegExp('([0-9]{2})([0-9]{2})([0-9]{4})');
        objRegExpYY = new RegExp('([0-9]{2})([0-9]{2})([0-9]{2})');
        if (objRegExpCCYY.test(strValue)) {
            strValue = strValue.replace(objRegExpCCYY, '$1/$2/$3');
            currObj.value = strValue;
            return true;
        }
        else if (objRegExpYY.test(strValue)) {
            strValue = strValue.replace(objRegExpYY, '$1/$2/$3');
            currObj.value = strValue;
            return true;
        }
        else
            return false;

    }

    function fmtDateMMCCYY(currObj, focObj) {
        var strValue = currObj.value;
        var objRegExp;
        strValue = $.trim(strValue).replace(/ /g, "");
        objRegExp = new RegExp('([0-9]{2})([0-9]{4})');
        if (objRegExp.test(strValue)) {
            strValue = strValue.replace(objRegExp, '$1/$2');
            currObj.value = strValue;
            return true;
        }
        else
            return false;
    }

    function fmtPerc3places(currObj, focObj) {
        var strValue = currObj.value;
        var objRegExp = /^0?\.\d{0,3}?$/;
        strValue = $.trim(strValue).replace(/ /g, "");
        if (strValue.substring(0, 1) == ".")
            strValue = "0" + strValue;
        //check for numeric characters
        if (objRegExp.test(strValue)) {
            while (strValue.length < 5)
                strValue = strValue + "0";
            currObj.value = strValue;
            return true;
        }
        else
            return false;
    }

    // Decimal - Money Currency with decimal
    function fmtDecimal(currObj) {
        var strValue = currObj.value;
        var objRegExp = /(\d+)(\d{3})/;
        strValue = $.trim(strValue).replace(/ /g, "");
        var x = strValue.split('.');
        var x1 = x[0];
        var x2 = x.length > 1 ? '.' + x[1] : '';

        if (!x2) { x2 = ".00"; }
        while (x2.length < 3) { x2 = x2 + "0"; }

        while (objRegExp.test(x1)) {
            x1 = x1.replace(objRegExp, '$1' + ',' + '$2');
        }
        strValue = x1 + x2;
        if (strValue.substring(0, 1) == ".")
            strValue = "0" + strValue;
        //check for numeric characters
        currObj.value = strValue;
        return true;
    }

    // interger - quantity
    function fmtInt(currObj) {
        // check it is only digits
        var objRegExp = new RegExp('[0-9]+');
        var strValue = currObj.value;
        if (!objRegExp.test(strValue))
            return false;

        // okay, check and format for commas
        strValue = $.trim(strValue).replace(/ /g, "");
        objRegExp = new RegExp('(-?[0-9]+)([0-9]{3})');
        //check for match to search criteria addCommas
        while (objRegExp.test(strValue)) {
            //replace original string with first group match, 
            //a comma, then second group match
            strValue = strValue.replace(objRegExp, '$1,$2');
            currObj.value = strValue;
        }
        return true;
    }

    // FIS - Format for FEIN, ITIN, SSN
    function fmtFis(currObj) {

        return true;
    }
    // OGT - format for OGRID / OGT - ACC (Account)
    function fmtOgt(currObj) {

        return true;
    }
    //*******************************************************************************
    //*******************************************************************************


