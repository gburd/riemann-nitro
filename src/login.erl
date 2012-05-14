%% -*- mode: nitrogen -*-
-module (login).
-compile(export_all).
-include_lib("nitrogen_core/include/wf.hrl").

main() ->
    #template { file="./site/templates/bare.html" }.

body() ->
    wf:wire(submit, username, #validate { validators=[
        #is_required { text="Required." }
    ]}),
    wf:wire(submit, password, #validate { validators=[
        #is_required { text="Required." }
    ]}),
    #panel { style="margin: 50px;", body=[
        #flash {},
        #label { text="Username" },
        #textbox { id=username, next=password },
        #br {},
        #label { text="Password" },
        #password { id=password, next=submit },
        #br {},
        #button { text="Login", id=submit, postback=login }
    ]}.

event(login) ->
    case wf:q(password) == "password" of
        true ->
            wf:role(managers, true),
            wf:user(wf:q(username)),
            wf:redirect_from_login("/");
        false ->
            wf:flash("Invalid password.")
    end.

