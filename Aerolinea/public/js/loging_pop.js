function popup() {
    window.login_popup();
}
window.login_popup = function() {

    var label_message_user = "Usuario:";
    var label_message_pass = "Contraseña:"
    var button_message = "Ingresar";
    var width = 250;
    var height = 200;
    var callback = function(password){};

    var submit = function() {
        callback(input.value);
        document.body.removeChild(div);
        window.removeEventListener("resize", resize, false);
    };
    var resize = function() {
        div.style.left = ((window.innerWidth / 2) - (width / 2)) + "px";
        div.style.top = ((window.innerHeight / 2) - (height / 2)) + "px";
    };

    var div = document.createElement("div");
    div.id = "password_prompt";
    div.style.background = "white";
    div.style.color = "black";
    div.style.border = "1px solid black";
    div.style.width = width + "px";
    div.style.height = height + "px";
    div.style.padding = "16px";
    div.style.position = "fixed";
    div.style.left = ((window.innerWidth / 2) - (width / 2)) + "px";
    div.style.top = ((window.innerHeight / 2) - (height / 2)) + "px";

    var label = document.createElement("label");
    label.id = "user_prompt_label_user";
    label.innerHTML = label_message_user;
    label.for = "user_prompt_input_user";
    div.appendChild(label);
    
    div.appendChild(document.createElement("br"));
    
    var input = document.createElement("input");
    input.id = "user_prompt_input";
    input.type = "text";
    div.appendChild(input);
    
    div.appendChild(document.createElement("br"));
    
    label = document.createElement("label");
    label.id = "password_prompt_label_pass";
    label.innerHTML = label_message_pass;
    label.for = "password_prompt_input_pass";
    div.appendChild(label);

    div.appendChild(document.createElement("br"));

    input = document.createElement("input");
    input.id = "password_prompt_input";
    input.type = "password";
    input.addEventListener("keyup", function(e) {
        if (event.keyCode == 13) submit();
    }, false);
    div.appendChild(input);

    div.appendChild(document.createElement("br"));
    div.appendChild(document.createElement("br"));

    var button = document.createElement("button");
    button.innerHTML = button_message;
    button.addEventListener("click", submit, false);
    div.appendChild(button);

    document.body.appendChild(div);
    window.addEventListener("resize", resize, false);
};