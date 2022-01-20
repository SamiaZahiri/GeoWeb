$(document).ready(function() {

    $.ajax({
        url: "PositionController",
        data: { op:"load" },
        method: "POST",
        success: function(data) {
            remplir(data);
        }
    });

	$("#add").click(function() {
		var latitude = $("#latitude").val();
		var langitude = $("#langitude").val();
		var date = $("#date").val();
		var smartphone = $("#smartphone").val();
		$.ajax({
			url: "PositionController",
			data: {latitude: latitude, langitude: langitude, date: date,smartphone: smartphone },
			method: "POST",
			success: function(data) {
				$("#smartphone option").filter(function() {
                  return this.text == data.smartphone.nom; 
         }).attr('selected', true);
				remplir(data);
			}
		});
	});

	function remplir(data) {
		var ligne = "";
		data.forEach(e => {
			ligne += '<tr><td>' + e.code + '</td><td>' + e.latitude + '</td><td>' + e.langitude + '</td><td>' + e.date + '</td><td>' + e.smartphone + '</td>\n\
<td><button class="btn btn-rounded btn-danger mb-3" id="delete" indice="' + data[i].id + '">Supprimer</button></td>\n\
<td><button class="btn btn-rounded btn-info mb-3" id="update" indice="' + data[i].id + '">Modifier</button></td></tr>';

		});
		$("#content").html(ligne);

	}

});