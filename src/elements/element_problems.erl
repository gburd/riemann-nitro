%% -*- mode: nitrogen -*-
-module (element_problems).
-compile(export_all).
-include_lib("nitrogen_core/include/wf.hrl").
-include("records.hrl").

reflect() -> record_info(fields, problems).

render_element(_Record = #problems{}) ->
    #h2 { text="Problems" }.
