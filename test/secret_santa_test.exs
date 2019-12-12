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
end
