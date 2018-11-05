$(document).ready(function () {

});

function validateForm() {
    var pass = $("#exampleInputPassword1").val();
    if (pass == "") {
        $("#validate-pass").html("Vui lòng nhập mật khẩu");
        return false
    }
}