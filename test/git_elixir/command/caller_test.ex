defmodule GitElixir.Command.CallerTest do

  alias GitElixir.Command
  alias GitElixir.Command.Caller

  use ExSpec
  doctest GitElixir.Command.Caller

  setup do
    repo = %GitElixir.Repo{path: TestHelper.temp_dir}
    GitElixir.Repo.create_dir(repo)
    GitElixir.Repo.init(repo)

    on_exit fn ->
      System.cmd "rm", ["-rf", repo.path]
    end

    {:ok, repo: repo}
  end

  describe "Caller.call" do
    it "it executes the status command", context do
      assert Caller.call(context[:repo], Command.status) == []
    end
  end
end
