defmodule SecretSantaTest do
  use ExUnit.Case
  use PropCheck

  doctest SecretSanta

  property "returns the same number of tags as supplied names" do
    forall names <- list(binary()) do
      length(SecretSanta.tags(names)) == length(names)
    end
  end
end
