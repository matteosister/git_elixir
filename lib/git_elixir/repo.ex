defmodule GitElixir.Repo do
  
  alias GitElixir.CommandCaller, as: Caller
  alias GitElixir.Command, as: Command

  defstruct path: "", name: ""

  @doc """
  Given a repository struct creates the containing folder
  """
  def create_dir(%GitElixir.Repo{path: path}) do
    System.cmd "mkdir", [path]
  end

  @doc """
  Given a repository struct calls the init command
  """
  def init(repo = %GitElixir.Repo{}) do
    Caller.call repo, Command.init
  end
  
end