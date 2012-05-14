%% -*- mode: nitrogen -*-
-module (index).
-compile(export_all).
-include_lib("nitrogen_core/include/wf.hrl").
-include("../include/records.hrl").

main() ->
    case wf:role(managers) of
        true ->
            #template { file="./site/templates/bare.html" };
        false ->
            wf:redirect_to_login("/login")
    end.

title() -> "Dashboard".

iso_8601_fmt(DateTime) ->
    {{Year,Month,Day},{Hour,Min,Sec}} = DateTime,
    io_lib:format("~4.10.0B-~2.10.0B-~2.10.0B ~2.10.0B:~2.10.0B:~2.10.0B",
        [Year, Month, Day, Hour, Min, Sec]).

body() ->
    [
        #h1 { text="Dashboard" },
        #span { style="position: absolute; top: 4px; right: 4px;", body=[
            " Welcome, ", #span { class=description, text=wf:user() }, " ",
            #button { text="Logout", postback=logout },
            " (", iso_8601_fmt(erlang:localtime()), ") "
        ]},
        inner_body()
    ].

inner_body() ->
    [
        #p{}, "Hello, here's the scoop",
        #problems {}, #health {}, #everything {}
    ].

event(logout) ->
    wf:logout(),
    wf:redirect_to_login("/login").
