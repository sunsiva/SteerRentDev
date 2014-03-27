﻿$(document).ready(function (e) {

    /* BEGIN:  MASTER*/

    //  BEGIN: General lookup
    // Bind slider
        var slidetabs = $('#slidetabs').slidetabs({
            orientation: 'horizontal',
            autoHeight: true,
            touchSupport: true
        });

        $(function () {
            $('.ErrorMsg').attr("style", "display:none");
            $('.ErrorMsgHLook').attr("style", "display:none");
            $('.ErrorMsgOrg').attr("style", "display:none");
            
            $('#OrgSuccessMsg').attr("style", "display:none");
            $('#GLookupSuccessMsg').attr("style", "display:none");
            $('#HLookupSuccessMsg').attr("style", "display:none");

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

        $.ValidateEmail = function (obj) {
            var email = new RegExp(/^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/);
            if (!obj.match(email)) {
                return false;
            }
            else
                return true;
        }

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

        $.trim = function (text) {
            return text.replace(/^\s+|\s+$/g, '');
        };

        $(function () {
            $(".numeric20").attr("maxlength", 20)
            $(".numeric9").attr("maxlength", 9)
            $(".alpha49").attr("maxlength", 49)
            $(".alphaNum90").attr("maxlength", 95)
            $(".email30").attr("maxlength", 30)

            $(".numeric20").bind("keypress", function (e) {
                var str = /[0-9,.+-]/;
                return globalValidation(e, str);
            });
            $(".numeric20").bind("paste", function (e) {    return false;});
            $(".numeric20").bind("drop", function (e) { return false;});

            $(".numeric9").bind("keypress", function (e) {
                var str = /[0-9,.+-]/;
                return globalValidation(e, str);
            });
            $(".numeric9").bind("paste", function (e) { return false; });
            $(".numeric9").bind("drop", function (e) { return false; });

            $(".alpha49").bind("keypress", function (e) {
                var str = /[a-zA-Z ]/;
                return globalValidation(e, str);
            });

            $(".alphaNum95").bind("keypress", function (e) {
                var str = /[a-zA-Z0-9,./ #]/;
                return globalValidation(e, str);
            });
        });
    /* END:  MASTER*/

    /* BEGIN: General */
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