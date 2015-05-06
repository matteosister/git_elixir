defmodule GitElixir.CommandCaller do
  @doc """
  Given a command, execute it and returns a list of output lines
  """
  def call(%GitElixir.Repo{path: path}, args) do
    System.cmd("git", args, [cd: path])
    |> split_lines
    |> Enum.filter(fn (line) -> line != "" end)
  end
  
  defp split_lines({output, 0}), do: String.split(output, ~r{\n}, trim: true)
  defp split_lines(_), do: raise "Command error"
end
