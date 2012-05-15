%% -*- mode: nitrogen -*-
-module (index).
-compile(export_all).
-include_lib("nitrogen_core/include/wf.hrl").
-include("../include/records.hrl").

main() ->
    case wf:user() of
        undefined ->
            wf:redirect_to_login("/login");
        _ ->
            #template { file="./site/templates/bare.html" }
    end.

title() -> "Dashboard".

body() ->
    wf:comet(fun() -> display_server_time() end),
    [
        #h1 { text="Dashboard" },
        #span { style="position: absolute; top: 4px; right: 4px;", body=[
            " Welcome, ", #span { class=description, text=wf:user() }, " ",
            #link { show_if=(wf:user() /= undefined), text="logout", postback=logout },
            " (", #span { id=server_time }, ") "
        ]},
        inner_body()
    ].

display_server_time() ->
    wf:update(server_time, httpd_util:rfc1123_date(erlang:localtime())),
    wf:flush(),
    timer:sleep(1 * 1000),
    display_server_time().

inner_body() ->
    [
        #problems {}, #health {}, #everything {}
    ].

event(logout) ->
    wf:logout(),
    wf:clear_session(),
    wf:redirect_to_login("/login").
