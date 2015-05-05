defmodule GitElixir.CommandCaller do
  @doc """
  Given a command, execute it and returns a list of output lines
  """
  def call(%GitElixir.Repo{path: path}, args) do
    git_call(args, [cd: path])
  end

  defp git_call(args, opts) do
    System.cmd("git", args, opts)
    |> split_lines
  end

  
  defp split_lines({output, 0}), do: String.split(output, ~r{\n}, trim: true)
  defp split_lines(_), do: raise "Command error"

end
