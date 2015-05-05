defmodule GitElixir.Command.Caller do
  @doc """
  Given a command, execute it and returns a list of output lines
  """
  def call(args, opts \\ []) do
    git_call(args, opts)
  end

  defp git_call(args, opts) do
    System.cmd("git", args, opts)
    |> split_lines
  end

  @doc """
  Split lines of an output command
  """
  defp split_lines({output, 0}), do: String.split(output, ~r{\n}, trim: true)
  defp split_lines(_), do: raise "Command error"

end
