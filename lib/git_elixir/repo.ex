defmodule GitElixir.Repo do
  
  alias GitElixir.Command.Caller
  alias GitElixir.Command
  alias GitElixir.Repo

  defstruct path: "", name: ""

  @doc """
  Given a repository struct creates the containing folder
  """
  def create_dir(%Repo{path: path}) do
    System.cmd "mkdir", [path]
  end

  @doc """
  Given a repository struct calls the init command
  """
  def init(repo = %Repo{}) do
    Caller.call repo, Command.init
  end

  @doc """
  Given a repository and a path, adds the given path to the staging area
  """
  def stage(repo = %Repo{}, path \\ ".") do
    Caller.call repo, Command.add(path)
  end
  
end