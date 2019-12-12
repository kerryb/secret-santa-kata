defmodule SecretSanta do
  def tags(names) do
    Enum.shuffle(names)
    |> Enum.zip(Enum.shuffle(names))
    |> Enum.map(fn {from, to} -> %{from: from, to: to} end)
  end
end
