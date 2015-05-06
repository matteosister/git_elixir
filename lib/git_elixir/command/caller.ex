defmodule GitElixir.Command.Caller do
  @doc """
  Given a command, execute it and returns a list of output lines
  """
  def call(%GitElixir.Repo{path: path}, args) do
    pid = spawn_link(__MODULE__, :do_call, [])
    send pid, { self, [args, [cd: path]] }
    receive do
      { :ok, lines } ->
        lines
    end
  end

  defp do_call do
    receive do
      { sender, [args, [cd: path]] } ->
        lines = System.cmd("git", args, [cd: path])
        |> split_lines
        |> Enum.filter(fn (line) -> line != "" end)
        send sender, { :ok, lines }
    end
  end
  
  defp split_lines({output, 0}), do: String.split(output, ~r{\n}, trim: true)
  defp split_lines(_), do: raise "Command error"
end
