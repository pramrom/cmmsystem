$(document).ready(function () {
    $('.phoneclick').on('click', function(){
        let data = {};
        data.phone = $(this).data('phone');
        data.phone_type = $(this).data('type');

        $.ajax({
            method: "POST",
            url: "/click/phone",
            dataType: "json",
            data: data
        }).always(function() {})
    });
});
