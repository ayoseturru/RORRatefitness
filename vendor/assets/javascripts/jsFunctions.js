var wantToAddOpinion = false;

function registLoginModalEvents() {
    $("#loginModal button").on("click", login);
    $("#loginModal .close").on("click", function () {
        $("#opinionModal").modal("hide");
        wantToAddOpinion = false;
    })
}

function logout() {
    localStorage.removeItem("login");
    $("#users_area_text a").html("usuarios");
    $("#edit_profile").hide();
    $("#logout").hide();
    $("#signin").show();
    wantToAddOpinion = false;
}

function changeUserContext() {
    $("#users_area_text a").html("Hola, " + localStorage.getItem("login"));
    $("#signin").hide();
    $("#logout").show();
    $("#edit_profile").show();
}

function login() {
    if (($("#username").val() != "ayose") || ($("#pwd").val() != "ayose")) {
        $("#loginModal .alert").html("<p>Compruebe que te llamas ayose y tu password es ayose</p>");
        $("#loginModal .alert").show();
    } else {
        localStorage.setItem("login", $("#username").val());
        changeUserContext();
        $("#loginModal").modal("hide");
        if (wantToAddOpinion) {
            $("#opinionModal").modal("show");
        }
    }
}

function getDate() {
    var today = new Date();
    var dd = today.getDate();
    var mm = today.getMonth() + 1;
    var yyyy = today.getFullYear();

    if (dd < 10) {
        dd = '0' + dd
    }

    if (mm < 10) {
        mm = '0' + mm
    }

    today = dd + '/' + mm + '/' + yyyy;
    return today;
}

function clearOpinionModal() {
    $("#rate_title").val("");
    $("#opinion").val("");
    $("#calidad-instalaciones").val("0");
    $("#calidad-actividades").val("0");
    $("#calidad-monitores").val("0");
    $("#calidad-limpieza").val("0");
    $("#calidad-vestuarios").val("0");
}

function addStars(media) {
    for( var i = 0; i < media; i++) {
        $("#rating ul li:last-child .stars").append("<i class='fa fa-star'></i>");
    }
}
function addOpinion() {
    var data = {}
    media = (parseFloat($("#calidad-instalaciones").val()) + parseFloat($("#calidad-actividades").val()) + parseFloat($("#calidad-monitores").val()) + parseFloat($("#calidad-limpieza").val()) + parseFloat($("#calidad-vestuarios").val())) / 5.0;
    data.username = localStorage.getItem("login");
    data.title = $("#rate_title").val();
    data.opinion = $("#opinion").val();
    data.rate = media;
    data.date = getDate();
    var template = Handlebars.compile($("#opinion-template").html());
    $("#rating ul").append(template(data));
    $("#opinionModal").modal("hide");
    addStars(media);
    clearOpinionModal();
}

function opinionModalIsValid() {
    if (($("#opinion").val() === "") || ($("#rate_title").val() === "") || (parseFloat($("#calidad-instalaciones").val()) == 0 ||
        (parseFloat($("#calidad-actividades").val())) == 0 || (parseFloat($("#calidad-monitores").val())) == 0 ||
        (parseFloat($("#calidad-limpieza").val())) == 0 || (parseFloat($("#calidad-vestuarios").val() == 0)))){
        $("#opinionModal .alert").html("Rellene todos los campos");
        $("#opinionModal .alert").show();
        return false;
    } else {
        return true;
    }
}

function createOpinion() {
    if (opinionModalIsValid() && localStorage.getItem("login")) {
        addOpinion();
    }

}

function checkUsernameIsAvailable() {
    var username = $("#user").val();
    $.ajax({
        url: "ajax.php",
        type: "GET",
        data: {
            username: username
        }
    }).done(function (data) {
        if (data) {
            $("#sign_up_form .alert").html("El username está ocupado");
            $("#sign_up_form .alert").show();
            $("#sign_up_form button").css("pointer-events", "none");
        } else {
            $("#sign_up_form button").css("pointer-events", "all");
            $("#sign_up_form .alert").hide();
        }
    });
}
function registOpinionModalEvents() {
    $("#opinionModal button").on("click", createOpinion);
    $("#rating button").on("click", function () {
        if (!localStorage.getItem("login")) {
            $("#loginModal").modal("show");
            wantToAddOpinion = true;
        } else {
            $("#opinionModal").modal("show");
        }
    });
}

function registFitnessCenterEvents() {
    registUserAreaEvents();
    registOpinionModalEvents();
}

function checkSignUpFields() {
    var filter = /[\w-\.]{3,}@([\w-]{2,}\.)*([\w-]{2,}\.)[\w-]{2,4}/;
    if ($("#password").val().length < 8) {
        $("#sign_up_form .alert").html("La password debe tener al menos 8 caracteres");
        $("#sign_up_form .alert").show();
        return false;
    } else if ($("#password").val() != $("#password_again").val()) {
        $("#sign_up_form .alert").html("Las passwords no coinciden");
        $("#sign_up_form .alert").show();
        return false;
    } else if (!filter.test($("#new_email").val())) {
        $("#sign_up_form .alert").html("Email inválido");
        $("#sign_up_form .alert").show();
        return false;
    }

    return true;
}

function showAdviseDialog() {
    dialogo = $('<div></div>');
    dialogo.text("Al decidir registrarse en nuestra página suponemos que ha leído y acepta nuestra política de privacidad");
    dialogo.dialog({
        title: 'Borrar usuario',
        width: 600,
        height: 300,
        modal: true,
        buttons: {
            'Sí': function () {
                $(this).dialog('close');
            },
            'No la he leído o no estoy de acuerdo, quiero revisarla': function () {
                $("#policyModal").modal("show");
                $(this).text("Los usuarios pueden ejercitar los derechos de oposición, acceso e información, rectificación, cancelación y revocación de su autorización a la utilización de sus datos personales. Es ta recogida de datos es general ya que en la mayoría de las páginas web que se visitan en la actualidad se recogen los datos relativos a l usuario, ya que los datos personales son elemento imprescindible para la realización de cualquier gestión, o en la relación a distancia con distribuidor, comercio... Por ello se puso en marcha la LOPD , con el fin de regular el tratamiento de estos datos pe rsonales . D icha ley obliga a informar sobre el tratamiento de é stos y los fines por los que la empresa los requiere. Esta información es la que se refleja en los textos donde se recoge la política de privacidad");
                dialogo.dialog('option', 'buttons', {
                    'Aceptar': function () {
                        $(this).dialog('close');
                    }
                });
            }
        }
    });
}

function registUsersEvents() {
    registUserAreaEvents();

    $("#sign_up_form").on("submit", function () {
        if (checkSignUpFields()) {
            showAdviseDialog();
        }
        return false;
    });

    $("#user").on("keyup", checkUsernameIsAvailable);
}

function registUserAreaEvents() {
    registLoginModalEvents();
    $("#signin").on("click", function () {
        $("#loginModal").modal("show");
    });
    $("#logout").on("click", function () {
        logout();
    });
}