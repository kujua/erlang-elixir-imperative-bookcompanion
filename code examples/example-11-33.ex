defp run_composite(inputfiles, optionlist) do
  args = ~w(#{optionlist} #{inputfiles})
  System.cmd "composite", args, stderr_to_stdout: true
end
