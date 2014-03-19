$(document).ready(function (e) {

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
            //$('.error_msg_sm').attr("style", "display:none");
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
            $('.OrdErrorMsg').attr("style", "display:none");
            $('#OrgSuccessMsg').attr("style", "display:none");
            $('#OrgFailImg').attr("style", "display:none");
            $('#OrgReqMsg').attr("style", "display:none");
            $('#OrgInvalidMailMsg').attr("style", "display:none");
            $('#OrgRequestErrorMsg').attr("style", "display:none");
        }

        $.trim = function (text) {
            return text.replace(/^\s+|\s+$/g, '');
        };

        $(function () {
            $(".numeric").attr("maxlength", 11)
            $(".alpha").attr("maxlength", 20)
            $(".email").attr("maxlength", 20)
            $(".alphaNum").attr("maxlength", 30)

            $(".numeric").bind("keypress", function (e) {
                var str = /[0-9,.+-]/;
                return globalValidation(e, str);
            });

            $(".numeric").bind("paste", function (e) {
                return false;
            });
            $(".numeric").bind("drop", function (e) {
                return false;
            });

            $(".alpha").bind("keypress", function (e) {
                var str = /[a-zA-Z ]/;
                return globalValidation(e, str);
            });

            $(".alphaNum").bind("keypress", function (e) {
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
    /* END: General */
});