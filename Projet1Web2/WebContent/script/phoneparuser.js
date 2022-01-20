	$(document).ready(function () {

    $("#recherche").click(function () {
        var utilisateur = $("#utilisateur").val();
        
        $.ajax({
            url: "PhoneParUser",
            data: {utilisateur: utilisateur, op: "recherche"},
            method: 'POST',
            success: function (data) {
                remplir(data);
                
            },
            error: function (data) {
                console.log(data);
            }
        });
        return false;
    });

    function remplir(data) {
        var ligne = "";
        for (i = 0; i < data.length; i++) {
            ligne += '<tr><td>' + data[i].id + '</td><td>' + data[i].imei + '</td>';
        }

        $("#content").html(ligne);
    }
});