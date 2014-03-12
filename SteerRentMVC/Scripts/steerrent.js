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
            $('.error_msg_sm').attr("style", "display:none");
            $('#GLookupSuccessMsg').attr("style", "display:none");

            $("#txtGLookupValue").attr("maxlength", 50)
            $("#txtGLookupValue").bind("keypress", function (e) {
                $.ErrorHide();
                var str = /[a-zA-Z0-9 _-]/;
                return globalValidation(e, str);
            });
        });

        $('#ddlCategory').change(function () {
            $.ErrorHide();
            if ($('#ddlCategory').val() > 0) {
                $('#spnGLookupSelValue').text($("#ddlCategory option:selected").text());
                RefreshGrid('Select');
            }
        });

        $('#btnSubmitA1').click(function () {
            if ($('#ddlCategory').val() > 0 && $('#txtGLookupValue').val() != '') {
                RefreshGrid('Insert');
            }
            else {
                $('.ErrorMsg').attr("style", "display:block");
                $('#GLookupFailImg').attr("style", "display:block");
                $('#GLookupReq').attr("style", "display:block");
                slidetabs.setContentHeight();
            }
        });
    
        $.ErrorHide = function () { $('.ErrorMsg').attr("style", "display:none"); $('#GLookupSuccessMsg').attr("style", "display:none"); }


    /* END:  MASTER*/

});