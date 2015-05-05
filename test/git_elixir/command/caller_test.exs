defmodule GitElixir.Command.CallerTest do
  use ExUnit.Case
  doctest GitElixir.Command.Caller

  setup_all do
    _tmp_dir = System.tmp_dir!
    chars = ?a..?z
    :random.seed(:erlang.now)
    reducer = fn (_, acc) ->
      acc <> << Enum.at(chars, round(Float.floor(:random.uniform * Enum.count(chars)))) >>
    end
    dir_name = 1..10 |> Enum.reduce("git_elixir_", reducer)
    System.cmd "mkdir", [dir_name]
    System.cmd "git", ["init"], cd: dir_name

    {:ok, dir_name: dir_name}
  end

  test "it executes a command", context do
    assert GitElixir.Command.Caller.call(["status", "--porcelain"], cd: context[:dir_name]) == [""]
  end
end
