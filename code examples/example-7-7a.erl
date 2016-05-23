{description, "EUnit Test Suite"}.
{variables, [
  {name, "eunittestsuite"}
]}.
{dir, "tests"}.
{template, "kujua_eunit.erl", "tests/{{name}}_tests.erl"}.
