$('#logout').click(function () {
    var url = "General/logout/";
    var posting = $.post(url);
    posting.done(function (data) {
        console.log("Salida del sistema Exitosa.");
    });
    posting.fail(function (xhr, textStatus, errorThrown) {
        alert("error" + xhr.responseText);
    });
});

