defmodule SecretSantaTest do
  use ExUnit.Case
  use PropCheck

  doctest SecretSanta

  property "returns the same number of tags as supplied names" do
    forall names <- list(binary()) do
      length(SecretSanta.tags(names)) == length(names)
    end
  end

  property "includes each name once as a sender" do
    forall names <- list(binary()) do
      tags = SecretSanta.tags(names)
      names -- Enum.map(tags, & &1.from) == []
    end
  end

  property "includes each name once as a recipient" do
    forall names <- list(binary()) do
      tags = SecretSanta.tags(names)
      names -- Enum.map(tags, & &1.to) == []
    end
  end

  test "returns names in a different order each time" do
    names = ["Fred Bloggs", "John Doe"]
    assert SecretSanta.tags(names) != SecretSanta.tags(names)
  end

  property "does not tag anyone's present as from themself" do
    forall names <- list_min_two(binary()) do
      tags = SecretSanta.tags(names)
      tags |> Enum.all?(&(&1.from != &1.to))
    end
  end

  defp list_min_two(gen) do
    such_that(l <- non_empty(list(gen)), when: length(l) > 1)
  end
end
