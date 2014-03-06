$(document).ready(function (e) {

    /* BEGIN:  MASTER*/

    //  BEGIN: General lookup

    // bind slider
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

        function RefreshGrid(status) {
            var href = '@Url.Action("GeneralLookupSubmit")';
            $.ajax({
                url: href,
                data: { id: $('#ddlCategory').val(), value: $('#txtGLookupValue').val(), status: status },
                type: "POST",
                datatype: "json",
                traditional: true,
                success: function (data) {
                    $('#GlookupGrdList').replaceWith(data);
                    $('#txtGLookupValue').val('');
                    $('#GLookupSuccessMsg').attr("style", "display:block");
                    $('.ErrorMsg').attr("style", "display:none");
                    slidetabs.setContentHeight();
                    //var items = [];
                    //items.push("<option>--Select Sub-Category--</option>");
                    //alert(data);
                    //$.each(data, function () {
                    //    items.push("<option value=" + this.Value + ">" + this.Text + "</option>");
                    //});
                    //$("#ddlSubCategory").html(items.join(' '));
                    //alert('Glookup');
                },
                error: function (jqXhr, textStatus, errorThrown) {
                    $('#GLookupFailImg').attr("style", "display:block");
                    $('#GLookupErrorMsg').attr("style", "display:block");
                    slidetabs.setContentHeight();
                }
            });
        }

         //Updating Active/Inactive status when clicking on checkbox
        $("input[name=chkGLookup]").change(function () {
            var id = this.id;
            var State = $(this).is(':checked');

            var href = '@Url.Action("GLookupStatusUpdate")';
            $.ajax({
                url: href,
                data: { Id: id, Status: State },
                type: "POST",
                datatype: "json",
                traditional: true,
                success: function () {
                    //if (State == true) {
                    //    $('#dvInActivate-' + id).text('Active').removeClass("error_msg").addClass("label_part");
                    //    $('#dvInActivate-' + id).attr('id', 'dvActivate-' + id);
                    //}
                    //else {
                    //    $('#dvActivate-' + id).text('InActive').removeClass("label_part").addClass("error_msg");
                    //    $('#dvActivate-' + id).attr('id', 'dvInActivate-' + id);
                    //}
                    $('#GLookupSuccessMsg').attr("style", "display:block");
                    $('.ErrorMsg').attr("style", "display:none");
                },
                error: function (jqXhr, textStatus, errorThrown) {
                    $('#GLookupFailImg').attr("style", "display:block");
                    $('#GLookupErrorMsg').attr("style", "display:block");
                }
            });
        });
    /* END:  MASTER*/

});