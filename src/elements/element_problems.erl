%% -*- mode: nitrogen -*-
-module (element_problems).
-compile(export_all).
-include_lib("nitrogen_core/include/wf.hrl").
-include("records.hrl").

reflect() -> record_info(fields, problems).

render_element(_Record = #problems{}) ->
    #span { class="box", body=[
        #h2 { text="Problems" },
        #list { body=[
            #listitem { text="List Item 1" },
            #listitem { text="List Item 2" },
            #listitem { text="List Item 3" }
        ]}
    ]}.
