defmodule SecretSanta do
  def tags(names) do
    allocate(Enum.shuffle(names), Enum.shuffle(names))
  end

  defp allocate([], []), do: []

  # guard against leaving the same last person in both lists
  defp allocate([from, name], [to, name]) do
    allocate([from, name], [name, to])
  end

  #  if the two heads are the same, shuffle the second list
  defp allocate(from, to) when hd(from) == hd(to) do
    allocate(from, Enum.shuffle(to))
  end

  defp allocate([from | from_tail], [to | to_tail]) do
    [%{from: from, to: to} | allocate(from_tail, to_tail)]
  end
end
