function checkPass1()
{
    var pass3 = document.getElementById('pass3');
    var pass4 = document.getElementById('pass4');
    var message = document.getElementById('confirmMessage1');
    var goodColor = "green";
    var badColor = "red";
    if(pass3.value == pass4.value){
        message.style.color = goodColor;
        message.innerHTML = "<b>Passwords Match!</b>"
    }else{
        message.style.color = badColor;
        message.innerHTML = "<b>Passwords Do Not Match!</b>"
    }
}