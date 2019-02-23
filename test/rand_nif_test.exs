defmodule RandNifTest do
  use ExUnit.Case
  doctest RandNif

  test "RandNif.uniform/0" do
    result = RandNif.uniform()

    assert result >= 0.0
    assert result < 1.0
  end

  test "RandNif.uniform/1" do
    assert_raise ArgumentError, fn ->
      RandNif.uniform("hello")
    end

    assert_raise ArgumentError, fn ->
      RandNif.uniform(0)
    end

    assert_raise ArgumentError, fn ->
      RandNif.uniform(1.0)
    end

    assert_raise ArgumentError, fn ->
      RandNif.uniform(-1)
    end

    assert RandNif.uniform(1) == 1
    assert RandNif.uniform(10) <= 10
    assert RandNif.uniform(100) <= 100
  end
end
