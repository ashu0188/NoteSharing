function checkPass()
{
    var pass1 = document.getElementById('pass1');
    var pass2 = document.getElementById('pass2');
    var message = document.getElementById('confirmMessage');
    var goodColor = "green";
    var badColor = "red";
    if(pass1.value == pass2.value){
        message.style.color = goodColor;
        message.innerHTML = "<b>Passwords Match!</b>"
    }else{
        message.style.color = badColor;
        message.innerHTML = "<b>Passwords Do Not Match!</b>"
    }
}