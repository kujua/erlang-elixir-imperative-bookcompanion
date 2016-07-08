defmodule TimexExamples do
  # use Timex
  def get_datetime do
    Timex.DateTime.now |> Timex.format!("{ISO:Extended}")
  end
end
