%% -*- mode: nitrogen -*-
-module (element_health).
-compile(export_all).
-include_lib("nitrogen_core/include/wf.hrl").
-include("records.hrl").

reflect() -> record_info(fields, health).

render_element(_Record = #health{}) ->
    #span { class="box", body=[
        #h2 { text="Health" },
        "hello"
    ]}.
