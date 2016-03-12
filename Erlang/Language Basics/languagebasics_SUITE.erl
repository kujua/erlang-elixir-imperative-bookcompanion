-module(languagebasics_SUITE).
      -compile(export_all).

      all() ->
          [mod_exists].

      mod_exists(_) ->
          {module,listsexample} = code:load_file(listsexample).
