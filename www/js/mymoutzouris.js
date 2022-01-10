var me = {};
var game_status={};

$(function (){

    $('#moutzouris_login').click(login_to_game);

}
);

function login_to_game(){
    if($('#username').val()==''){
        alert('You have to set a username');
    }
    var p_select = $('#pselect').val();

    $.ajax({url: "moutzouris.php/players/"+p_select,
            method: 'PUT',
            dataType: "json",
            contentType: 'application/json',
            data: JSON.stringify({username: $('#username').val(),player: p_select}),
        success: login_result,
        error: login_error});
}

function login_result(data){
    me = data[0];
    $('#game_initializer').hide();
}

function login_error(data,y,z,c){
    var x = data.responseJSON;
    alert(x.errormesg);
}