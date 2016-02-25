
$(document).ready(function() {


    // from: http://www.developerdrive.com/2013/04/turning-a-form-element-into-json-and-submiting-it-via-jquery/
    function ConvertFormToJSON(form){
        var array = $(form).serializeArray();
        var json = {};

        jQuery.each(array, function() {
            // don't send 'undefined'
            json[this.name] = this.value || '';
        });
        return json;
    }


    function doLogin() {

        var formData = ConvertFormToJSON("#loginForm");
        //console.log("Login data to send: ", formData);

        $.ajax({
            url: "./login.php",
            type: "POST",
            dataType: "JSON",
            data: formData,
            success: function(returnedData) {
                console.log("Login data returned: ", returnedData);

                var status = returnedData['status'];
                if(status == 'error') {
                    msgs = returnedData['msg'];
                    for(msg in msgs) {
                        //console.log(msgs[msg]['text']);

                        $("#AJAXMessages").html("<li class='" + msgs[msg]['type']
                            + "'" + ">" + msgs[msg]['text'] + "</li>");
                    }


                    /* BTW, IF LOGOUT FAILED, IT'S BECAUSE THE SESSION EXPIRED
                       YOU COULD EASILY JUST RESET THE HTML IN THE PAGE
                     */

                } else {
                    // you're in, show profile
                    console.log(returnedData['user']);
                    // THIS SECTION HAS TO BE THE SAME AS index.html, LINE 21
                    $("#profileContainer").html("<div id='userProfile'>"
                        + "<h2>User Profile (only visible when logged in):</h2>\n"
                        + "<span><i>login: </i>" + returnedData['user']['user_name'] + "</span> "
                        + "<span><i>first name: </i>" + returnedData['user']['first_name'] + "</span> "
                        + "<span><i>last name: </i>" + returnedData['user']['last_name'] + "</span>"
                        +"<br/><br/><br/></div>");

                    // remove login form
                    $("#loginForm").remove();

                    // create logout form
                    $("#loginFormContainer").after('<div id="logoutFormContainer"><form id="logoutForm"><fieldset><legend>Logout Form</legend><label for="password">Password: </label><input id="logoutbutton" type="button" value="Logout"/><input type="hidden" value="logout" name="logoutButton"/></fieldset></form></div>');
                    $("#logoutbutton").bind("click", doLogout);

                }


            },
            error: function(jqXHR, textStatus, errorThrown) {
                console.log("AJAX Error", textStatus);
            }
        });
    }

    function doLogout() {
        var formData = {logout: "true"};
        //console.log("Logout data to send: ", formData);

        $.ajax({
            url: "./logout.php",
            type: "POST",
            dataType: "JSON",
            data: formData,
            success: function(returnedData) {
                //console.log("Logout data returned: ", returnedData);

                // RELOAD THE PAGE
                window.location.href = "index.php";

            },
            error: function(jqXHR, textStatus, errorThrown) {
                //console.log(jqXHR.statusText, textStatus, errorThrown);
                console.log(jqXHR.statusText, textStatus);
            }
        });
    }


    // login event
    $("#loginbutton").click(doLogin);

    // logout event
    $("#logoutbutton").click(doLogout);



});
