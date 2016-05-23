defmodule Mix.Tasks.Kujua.AddHeader do
  use Mix.Task

  @shortdoc "Generates a file header"
  @moduledoc """
  Generates a file header.

    Usage: *mix kujua.add_header path/to/file.ex*

  This command will write an empty header to *file.ex*.

  If a header exists it will be overwritten.
  Only headers generated with this task can be deleted!

  ## Options

  The following options fill fields in @moduledoc:
  * `--description Description` (default: "")
  * `--author Author` (default: "")
  * `--authoremail Email` (default: "")

  The following options fill fields in @doc:
  * `--documentation` (default: "")

  The following option does not ask for confirmation:
  * `-- silent true` (default: false)
  """

  def run(args) do
    {options, filename, _} = OptionParser.parse args
    fname = List.first filename
    if fname == nil, do: display_usage
    if !File.exists?(fname), do: exit_gracefully
    text = header_text options
    silent = String.to_atom(Keyword.get options,:silent, "false")

    Mix.shell.info """
      The following header will be added to #{fname}:
      "#{text}"
    """
    case overwrite? fname, silent do
      true -> write_header fname,text
      false -> Mix.shell.info "No changes were made"
    end
  end

  defp header_text(options) do
    """
    @moduledoc \"\"\"
    Author: #{Keyword.get options,:author,""}
    Email: #{Keyword.get options,:authoremail,""}
    Date: #{Keyword.get options,:date,""}
    #{Keyword.get options,:description,""}
    \"\"\"
    @doc \"\"\"
    #{Keyword.get options,:documentation,""}
    \"\"\"
    """
  end

  defp write_header(filename, text) do
    {:ok, file} = File.read filename
    # if String.contains?(file,"@moduledoc, @doc"), do: l = get_header_endline file
    # File.write filename, text <> file
    # Mix.shell.info inspect delete_any_header(file)
    File.write filename, text <> delete_existing_header(file, String.contains?(file,"@moduledoc"))
  end

  defp exit_gracefully() do
    Mix.shell.info "File does not exist. No changes were made."
    exit(:shutdown)
  end

  defp display_usage() do
    Mix.shell.info """
      Usage: mix kujua.add_header path/to/file.ex
    """
    exit(:shutdown)
  end

  defp overwrite?(filename, false) do
    Mix.Utils.can_write?(filename)
  end
  defp overwrite?(_filename, true) do
    true
  end

  def delete_existing_header(file, true) do
    split = String.split(file,"\"\"\"")
    Enum.at(split,4)
  end
  def delete_existing_header(file, false) do
    file
  end
end
