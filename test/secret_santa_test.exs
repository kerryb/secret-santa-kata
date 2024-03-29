defmodule SecretSantaTest do
  use ExUnit.Case
  use PropCheck

  doctest SecretSanta

  property "returns the same number of tags as supplied names" do
    forall names <- at_least_two_unique_names() do
      length(SecretSanta.tags(names)) == length(names)
    end
  end

  property "includes each name once as a sender" do
    forall names <- at_least_two_unique_names() do
      tags = SecretSanta.tags(names)
      names -- Enum.map(tags, & &1.from) == []
    end
  end

  property "includes each name once as a recipient" do
    forall names <- at_least_two_unique_names() do
      tags = SecretSanta.tags(names)
      names -- Enum.map(tags, & &1.to) == []
    end
  end

  property "does not tag anyone's present as from themself" do
    forall names <- at_least_two_unique_names() do
      tags = SecretSanta.tags(names)
      tags |> Enum.all?(&(&1.from != &1.to))
    end
  end

  defp at_least_two_unique_names do
    such_that(names <- at_least_two_names(), when: length(Enum.uniq(names)) == length(names))
  end

  defp at_least_two_names() do
    let([first <- name(), second <- name(), many <- list(name())],
      do: [first, second | many]
    )
  end

  defp name() do
    let([first <- binary(8), second <- binary(8)], do: first <> " " <> second)
  end
end
