defmodule GitElixir.Command do

  @doc """
  Retuns the status command args

  Example
    iex> GitElixir.Command.status
    ["status", "--porcelain"]
  """
  def status, do: ~w{ status --porcelain }

  @doc """
  Retuns the init command args

  Example
    iex> GitElixir.Command.init
    ["init"]
    iex> GitElixir.Command.init(true)
    ["--bare", "init"]
    iex> GitElixir.Command.init(100)
    ["init"]
  """
  def init(bare \\ false)
  def init(bare) when bare == true, do: ~w{ --bare init }
  def init(_), do: ~w{ init }

  @doc """
  Adds elements to the index.
  The argument gets passed to the git add "..." command, so you can use wildcartd etc.

  Example
    iex> GitElixir.Command.add
    ["add", "."]
    iex> GitElixir.Command.add("src/")
    ["add", "src/"]
  """
  def add(what \\ "."), do: ~w{ add #{what} }

end