defmodule RandNifTest do
  use ExUnit.Case
  doctest RandNif

  test "greets the world" do
    assert RandNif.hello() == :world
  end
end
