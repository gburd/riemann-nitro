%% -*- mode: nitrogen -*-
-module (element_health).
-compile(export_all).
-include_lib("nitrogen_core/include/wf.hrl").
-include("records.hrl").

reflect() -> record_info(fields, health).

render_element(_Record = #health{}) ->
    "<b>Hello from health</b>".
