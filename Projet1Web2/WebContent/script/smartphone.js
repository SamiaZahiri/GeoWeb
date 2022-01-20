$(document).ready(function() {

    $.ajax({
        url: "SmartPhoneController",
        data: { op:"load" },
        method: "POST",
        success: function(data) {
            remplir(data);
        }
    });

	$("#add").click(function() {
		var imei = $("#imei").val();
		var utilisateur = $("#utilisateur").val();
		
		
		$.ajax({
			url: "SmartPhoneController",
			data: {imei: imei, utilisateur: utilisateur },
			method: "POST",
			success: function(data) {
				$("#utilisateur option").filter(function() {
                  return this.text == data.utilisateur.nom; 
         }).attr('selected', true);
				remplir(data);
			}
		});
	});

	function remplir(data) {
		var ligne = "";
		data.forEach(e => {
			ligne += '<tr><td>' + e.id + '</td><td>' + e.imei + '</td><td>' + e.utilisateur.nom + '</td>\n\
<td><button class="btn btn-rounded btn-danger mb-3" id="delete" indice="' + data[i].id + '">Supprimer</button></td>\n\
<td><button class="btn btn-rounded btn-info mb-3" id="update" indice="' + data[i].id + '">Modifier</button></td></tr>';

		});
		$("#content").html(ligne);

	}

});