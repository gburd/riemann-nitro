%% -*- mode: nitrogen -*-
-module (element_everything).
-compile(export_all).
-include_lib("nitrogen_core/include/wf.hrl").
-include("records.hrl").

reflect() -> record_info(fields, everything).

render_element(_Record = #everything{}) ->
    #span { class="box", body=[
        #h2 { text="Everything" },
        "hello"
    ]}.
