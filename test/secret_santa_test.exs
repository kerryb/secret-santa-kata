defmodule SecretSantaTest do
  use ExUnit.Case
  doctest SecretSanta

  test "greets the world" do
    assert SecretSanta.hello() == :world
  end
end
