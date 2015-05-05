defmodule TestHelper do
  def temp_dir do
    tmp_dir = System.tmp_dir!
    chars = ?a..?z
    :random.seed(:erlang.now)
    reducer = fn (_, acc) ->
      acc <> << Enum.at(chars, round(Float.floor(:random.uniform * Enum.count(chars)))) >>
    end
    tmp_dir <> "/" <> (1..10 |> Enum.reduce("git_elixir_", reducer))
  end
end

ExUnit.start()