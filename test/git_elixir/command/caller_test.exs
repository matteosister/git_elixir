defmodule GitElixir.Command.CallerTest do
  use ExUnit.Case
  doctest GitElixir.Command.Caller

  setup_all do
    #tmp_dir = System.tmp_dir!
    chars = ?a..?z
    :random.seed(:erlang.now)
    reducer = fn (_, acc) ->
      acc <> << Enum.at(chars, round(Float.floor(:random.uniform * Enum.count(chars)))) >>
    end
    random_name = 1..10 |> Enum.reduce("git_elixir", reducer)

    {:ok, repo: random_name}
  end

  test "it executes a command", context do
    IO.puts context[:repo]
    assert GitElixir.Command.Caller.call(["status", "--porcelain"]) == [""]
  end
end
