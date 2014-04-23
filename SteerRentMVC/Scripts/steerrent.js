$(document).ready(function (e) {

    /* BEGIN:  MASTER*/

    // BEGIN: General lookup
    // Bind slider
        var slidetabs = $('#slidetabs').slidetabs({
            orientation: 'horizontal',
            autoHeight: true,
            touchSupport: true
        });

        $(function () {
            $.trim = function (text) {
                return text.replace(/^\s+|\s+$/g, '');
            };

            $('.ErrorMsg').attr("style", "display:none");
            $('.ErrorMsgHLook').attr("style", "display:none");
            $('.ErrorMsgOrg').attr("style", "display:none");
            $('.ErrorMsgLoc').attr("style", "display:none");
            $('.ErrorMsgEmp').attr("style", "display:none");
            $('.ErrorMsgCC').attr("style", "display:none");
            $('.ErrorMsgRole').attr("style", "display:none");

            $('#OrgSuccessMsg').attr("style", "display:none");
            $('#GLookupSuccessMsg').attr("style", "display:none");
            $('#HLookupSuccessMsg').attr("style", "display:none");
            $('#LocSuccessMsg').attr("style", "display:none");
            $('#EmpSuccessMsg').attr("style", "display:none");
            $('#CCSuccessMsg').attr("style", "display:none");
            $('#RoleSuccessMsg').attr("style", "display:none");

            $("#txtGLookupValue").attr("maxlength", 50)
            $("#txtGLookupValue").bind("keypress", function (e) {
                var str = /[a-zA-Z0-9 _-]/;
                return globalValidation(e, str);
            });

            $("#txtHLookupCat").attr("maxlength", 50)
            $("#txtHLookupCat").bind("keypress", function (e) {
                var str = /[a-zA-Z0-9 _-]/;
                return globalValidation(e, str);
            });

            $("#txtHLookupSubCat").attr("maxlength", 50)
            $("#txtHLookupSubCat").bind("keypress", function (e) {
                var str = /[a-zA-Z0-9 _-]/;
                return globalValidation(e, str);
            });
        });

        $.ErrorHide = function () {
            $('.ErrorMsg').attr("style", "display:none");
            $('#GLookupSuccessMsg').attr("style", "display:none");
            $('#GLookupFailImg').attr("style", "display:none");
            $('#GLookupExist').attr("style", "display:none");
            $('#GLookupReq').attr("style", "display:none");
            $('#GLookupErrorMsg').attr("style", "display:none");
        }

        $.ErrorHideHLookup = function () {
            $('.ErrorMsgHLook').attr("style", "display:none");
            $('#HLookupSuccessMsg').attr("style", "display:none");
            $('#HLookupFailImg').attr("style", "display:none");
            $('#HLookupExist').attr("style", "display:none");
            $('#HLookupReq').attr("style", "display:none");
            $('#HLookupErrorMsg').attr("style", "display:none");
        }

        $.ErrorHideOrg = function () {
            $('.ErrorMsgOrg').attr("style", "display:none");
            $('#OrgSuccessMsg').attr("style", "display:none");
            $('#OrgFailMsg').attr("style", "display:none");
            $('#OrgReqMsg').attr("style", "display:none");
            $('#OrgInvalidMailMsg').attr("style", "display:none");
            $('#OrgRequestErrorMsg').attr("style", "display:none");
        }

        $.ErrorHideLoc = function () {
            $('.ErrorMsgLoc').attr("style", "display:none");
            $('#LocSuccessMsg').attr("style", "display:none");
            $('#LocReqMsg').attr("style", "display:none");
            $('#LocFailMsg').attr("style", "display:none");
            $('#LocExistMsg').attr("style", "display:none");
            $('#LocSpecialChrMsg').attr("style", "display:none");
            $('#LocInvalidMailMsg').attr("style", "display:none");
            $('#LocNonNumMsg').attr("style", "display:none");
            $('#LocNetworkErrMsg').attr("style", "display:none");
        }

        $(function () {
            $(".numeric20").attr("maxlength", 20)
            $(".numeric19").attr("maxlength", 19)
            $(".numeric9").attr("maxlength", 9)

            $(".numOnly9").attr("maxlength", 9)

            $(".alpha49").attr("maxlength", 49)
            $(".alpha29").attr("maxlength", 29)
            $(".alpha19").attr("maxlength", 19)
            $(".alpha9").attr("maxlength", 9)
            
            $(".alphaNum90").attr("maxlength", 90)
            $(".alphaNum49").attr("maxlength", 49)
            $(".alphaNum29").attr("maxlength", 29)
            $(".alphaNum9").attr("maxlength", 9)

            $(".email30").attr("maxlength", 30)

            $(".numeric20").bind("keypress", function (e) {
                var str = /[0-9,.+-]/;
                return globalValidation(e, str);
            });
            $(".numeric20").bind("paste", function (e) {    return false;});
            $(".numeric20").bind("drop", function (e) { return false;});
            $(".numeric19").bind("keypress", function (e) {
                var str = /[0-9,.+-]/;
                return globalValidation(e, str);
            });
            $(".numeric19").bind("paste", function (e) { return false; });
            $(".numeric19").bind("drop", function (e) { return false; });
            $(".numeric9").bind("keypress", function (e) {
                var str = /[0-9,.+-]/;
                return globalValidation(e, str);
            });
            $(".numeric9").bind("paste", function (e) { return false; });
            $(".numeric9").bind("drop", function (e) { return false; });
            $(".numOnly9").bind("keypress", function (e) {
                var str = /[0-9.]/;
                return globalValidation(e, str);
            });
            $(".numOnly9").bind("paste", function (e) { return false; });
            $(".numOnly9").bind("drop", function (e) { return false; });

            $(".alpha49").bind("keypress", function (e) {
                var str = /[a-zA-Z ]/;
                return globalValidation(e, str);
            });
            $(".alpha29").bind("keypress", function (e) {
                var str = /[a-zA-Z ]/;
                return globalValidation(e, str);
            });
            $(".alpha19").bind("keypress", function (e) {
                var str = /[a-zA-Z ]/;
                return globalValidation(e, str);
            });
            $(".alpha9").bind("keypress", function (e) {
                var str = /[a-zA-Z ]/;
                return globalValidation(e, str);
            });

            $(".alphaNum9").bind("keypress", function (e) {
                var str = /[a-zA-Z0-9,./ #]/;
                return globalValidation(e, str);
            });

            $(".alphaNum49").bind("keypress", function (e) {
                var str = /[a-zA-Z0-9,./ #]/;
                return globalValidation(e, str);
            });

            $(".alphaNum29").bind("keypress", function (e) {
                var str = /[a-zA-Z0-9,./ #]/;
                return globalValidation(e, str);
            });

            $(".alphaNum95").bind("keypress", function (e) {
                var str = /[a-zA-Z0-9,./ #]/;
                return globalValidation(e, str);
            });

            $(".alphaNum9").bind("keypress", function (e) {
                var str = /[a-zA-Z0-9 ]/;
                return globalValidation(e, str);
            });
            
        });
    /* END:  MASTER*/

    /* BEGIN: General */

        $.ValidateEmail = function (obj) {
            var email = new RegExp(/^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/);
            if (!obj.match(email)) {
                return false;
            }
            else
                return true;
        }

        $.isCurrentDateGreater = function (obj) {
            var date = obj.substring(0, 2);
            var month = obj.substring(3, 5);
            var year = obj.substring(6, 10);
            var myDate = new Date(year, month - 1, date);
            var today = new Date();
           
            if (myDate.toDateString() <= today.toDateString()) {
                return true;
            }
            else {
                return false;
            }
        }

        $.isDoJValid = function (oDoB, oDoJ) {
            if (oDoJ > oDoB) {
                return true;
            }
            else {
                return false;
            }
        }

        $.isDoLValid = function (oDoJ, oDoL) {
            if (oDoL > oDoJ) {
                //alert("DoJ is greater/equal to DoB");
                return true;
            }
            else {
                //alert("Entered date is less than today's date ");
                return false;
            }
        }

        function disposeStorage() {
            sessionStorage.removeItem('tabClick');
        }

        function globalValidation(e, str) {
            var charCode = (e.which) ? e.which : e.keyCode;
            if (charCode == 8) return true;
            var keynum;
            var keychar;
            if (window.event) // IE
            {
                keynum = e.keyCode;
            }
            else {
                if (e.which) // Netscape/Firefox/Opera
                {
                    keynum = e.which;
                }
                else return true;
            }
            keychar = String.fromCharCode(keynum);
            return str.test(keychar);
        }

        function lengthRange(inputtxt, minlength, maxlength) {
            var userInput = inputtxt.value;
            if (userInput.length >= minlength && userInput.length <= maxlength) {
                return true;
            }
            else {
                alert("Please input between " + minlength + " and " + maxlength + " characters");
                return false;
            }
        }
    /* END: General */
});