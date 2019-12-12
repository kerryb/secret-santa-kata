defmodule SecretSanta do
  def tags(names) do
    names |> Enum.map(&%{from: &1, to: &1})
  end
end
