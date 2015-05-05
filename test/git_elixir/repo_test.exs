defmodule GitElixir.RepoTest do
  use ExSpec, async: true

  describe "struct initialization" do
    it "creates a default repo struct" do
      repo = %GitElixir.Repo{}
      assert repo.name == ""
      assert repo.path == ""
    end
  end
end