$ mix dialyzer
Starting Dialyzer
dialyzer --no_check_plt --plt /Users/Wolfgang/.dialyxir_core_18_1.2.5.plt -Wunmatched_returns -Werror_handling -Wrace_conditions -
Wno_opaque .
  Proceeding with analysis...
specifications.ex:12: Function callnumberfunction_1/0 has no local return
specifications.ex:13: The call 'Elixir.Specifications':numberfunction(<<_:8>>) breaks the contract (number()) -> returnvalue()
specifications.ex:16: Function callnumberfunction_2/0 has no local return
specifications.ex:17: The call 'Elixir.Specifications':numberfunction({}) breaks the contract (number()) -> returnvalue()
 done in 0m0.82s
done (warnings were emitted)
