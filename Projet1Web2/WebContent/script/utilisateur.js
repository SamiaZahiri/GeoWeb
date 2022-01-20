$(document).ready(function () {



$.ajax({
url: "UserController",
data: {op: "load"},
method: 'GET',
success: function (data) {
remplir(data);



},
error: function (textStatus) {
console.log(textStatus);
}
});



$('#content').on('click', '#update', function () {
var id = $(this).attr("indice");
console.log("update" + id);
$.ajax({
url: "LoadUser",
type: 'GET',
data: {id: id},
success: function (data) {
var now = new Date(data.dateNaissance);
var day = ("0" + now.getDate()).slice(-2);
var month = ("0" + (now.getMonth() + 1)).slice(-2);
var today = now.getFullYear() + "-" + (month) + "-" + (day);

$("#nom").val(data.nom);
$("#prenom").val(data.prenom);
$("#telephone").val(data.telephone);
$("#email").val(data.email);
$("#dateNaissance").val(today);
$("#op").val("update");
$("#op").attr("indice", id);

$("#add").html("Modifier");
alert("****Show Date****"+ now.getFullYear() + "-" + (month) + "-" + (day));
},
error: function (errorThrown) {
console.log("erreur");
}
});
});




$("#add").click(function () {
var nom = $("#nom").val();
var prenom = $("#prenom").val();
var telephone = $("#telephone").val();
var email = $("#email").val();
var dateNaissance = $("#dateNaissance").val();

var op = $("#op").val();
var indice = $("#op").attr("indice");
// alert("OP : " + op + " INDICE : " + indice);
if (op != "update") {
$.ajax({
url: "UserController",
data: {nom: nom, prenom: prenom, telephone:telephone, email:email, dateNaissance:dateNaissance},
method: 'POST',
success: function (data) {
remplir(data);
$("#add").html("Ajouter");
},
error: function (data) {
console.log(data);
}
});
} else {
$.ajax({
url: "UserController",
data: {nom: nom, prenom: prenom, telephone:telephone, email:email, dateNaissance:dateNaissance, op: op, indice: indice},
method: 'POST',
success: function (data) {
remplir(data);
},
error: function (data) {
console.log(data);
}
});
}
vider();
});



$("#content").on('click', '#delete', function () {
var indice = $(this).attr('indice');
$.ajax({
url: "UserController",
data: {op: "delete", indice: indice},
method: 'POST',
success: function (data) {
remplir(data);
},
error: function (data) {
console.log(data);
}
});
vider();
$("#add").html("Ajouter");
});




function vider(){
$("#nom").val("");
$("#prenom").val("");
$("#telephone").val("");
$("#email").val("");
$("#dateNaissance").val("");
}



function remplir(data) {
var ligne = "";
for (i = 0; i < data.length; i++) {
ligne += '<tr><td>' + data[i].id + '</td><td>' + data[i].nom + '</td><td>' + data[i].prenom + '</td>\n\
<td>' + data[i].telephone + '</td><td>' + data[i].email + '</td><td>' + data[i].dateNaissance + '</td>\n\
<td><button class="btn btn-rounded btn-danger mb-3" id="delete" indice="' + data[i].id + '">Supprimer</button></td>\n\
<td><button class="btn btn-rounded btn-info mb-3" id="update" indice="' + data[i].id + '">Modifier</button></td></tr>';
}



$("#content").html(ligne);
}
});