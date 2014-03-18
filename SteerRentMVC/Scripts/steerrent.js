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

        $.trim = function (text) {
            return text.replace(/^\s+|\s+$/g, '');
        };

    /* END:  MASTER*/

});