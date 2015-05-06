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

  @doc """
  Remove a node from the stage and put in the working tree

  Example
    iex> GitElixir.Command.unstage
    ["reset", "HEAD"]

    iex> GitElixir.Command.unstage("src/")
    ["reset", "HEAD", "src/"]
  """
  def unstage(what \\ nil)
  def unstage(what) when is_nil(what), do: ~w{ reset HEAD }
  def unstage(what), do: ~w{ reset HEAD #{what} }


  @doc """
  Commit the current staged files

  Example
    iex> GitElixir.Command.commit("")
    ** (ArgumentError) empty commit message

    iex> GitElixir.Command.commit(" ")
    ** (ArgumentError) empty commit message

    iex> GitElixir.Command.commit("test message")
    ["commit", "-m", "test message"]

    iex> GitElixir.Command.commit("test message", true)
    ["commit", "-a", "-m", "test message"]

    iex> GitElixir.Command.commit("test message", true, "matteo")
    ["commit", "-a", "--author", "matteo", "-m", "test message"]

    iex> GitElixir.Command.commit("test message", true, "matteo", true)
    ["commit", "-a", "--author", "matteo", "--allow-empty", "-m", "test message"]
  """
  def commit(msg, all \\ false, author \\ nil, allow_empty \\ false)
  def commit(msg, all, author, allow_empty) do
    if (String.strip(msg) == "") do
      raise ArgumentError, message: "empty commit message"
    end
    args = ~w{commit}
    if all, do: args = args ++ ~w{-a}
    unless is_nil(author), do: args = args ++ ["--author", author]
    if allow_empty, do: args = args ++ ~w{--allow-empty}
    args = args ++ ["-m", msg]
  end

end