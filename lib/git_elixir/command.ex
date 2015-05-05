defmodule GitElixir.Command do
  @doc """
  Retuns the status command args

  Example
    iex> GitElixir.Command.status
    ["status", "--porcelain"]
  """
  def status do
    ["status", "--porcelain"]
  end

  @doc """
  Retuns the init command args

  Example
    iex> GitElixir.Command.init
    ["init"]
  """
  def init do
    ["init"]
  end
end