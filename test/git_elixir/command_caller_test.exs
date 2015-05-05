defmodule GitElixir.CommandCallerTest do

  alias GitElixir.Command, as: Command
  alias GitElixir.CommandCaller, as: Caller

  use ExUnit.Case
  doctest GitElixir.CommandCaller

  setup do
    repo = %GitElixir.Repo{path: TestHelper.temp_dir}
    GitElixir.Repo.create_dir(repo)
    GitElixir.Repo.init(repo)

    on_exit fn ->
      System.cmd "rm", ["-rf", repo.path]
    end

    {:ok, repo: repo}
  end

  test "it executes the status command", context do
    assert Caller.call(context[:repo], Command.status) == []
  end
end
