$(document).ready(function () {
    var formsubmit = false;

    $("#txt-name").blur(function () {
        if ($("#txt-name").val() === "") {
            $("#validate-name").html("Bạn chưa nhập tên, vui lòng cung cấp thông tin này");
            formsubmit = false;
            return;
        }
        $("#validate-name").html("");
        formsubmit = true;
    });

    $("#txt-email").blur(function () {
        var emailReg = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
        if ($("#txt-email").val() == "") {
            $("#validate-email").html("Bạn chưa nhập email, vui lòng cung cấp thông tin này");
            formsubmit = false;
            return;
        }

        var emailReg = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
        if (!emailReg.test($("#txt-email").val())) {
            $("#validate-email").html("Bạn nhập email chưa chính xác, vui lòng cung cấp đúng thông tin này");
            formsubmit = false;
            return;
        }
        $("#validate-email").html("");
        formsubmit = true;
    });

    $("#txt-phone").blur(function () {
        var phoneReg = /^\+?\d{1,3}?[- .]?\(?(?:\d{2,3})\)?[- .]?\d\d\d[- .]?\d\d\d\d$/;
        if (!phoneReg.test($("#txt-phone").val())) {
            $("#validate-phone").html("Bạn nhập số điện thoại chưa chính xác, vui lòng cung cấp đúng thông tin này");
            formsubmit = false;
            return;
        }
        $("#validate-phone").html("");

        if ($("#txt-message").val() == "") {
            $("#validate-message").html("Bạn chưa nhập message, vui lòng cung cấp thông tin này");
            formsubmit = false;
            return;
        }
        $("#validate-message").html("");
        formsubmit = true;
    });

    $("#txt-message").blur(function () {
        if ($("#txt-message").val() == "") {
            $("#validate-message").html("Bạn chưa nhập message, vui lòng cung cấp thông tin này");
            formsubmit = false;
            return;
        }
        $("#validate-message").html("");
        formsubmit = true;
    });

    $("#btn-send").click(function () {
        return formsubmit;
    });
});