defmodule RandNif do
  @moduledoc """
  RandNif is a native implementation (NIF) in Rust for random number generator, similar to `:rand` module.
  """

  use Bitwise
  use Rustler, otp_app: :rand_nif, crate: :randnif

  @doc """
  Return a random float distributed in range between 0.0 (inclusive) and 1.0 (exclusive), similary to `:rand.uniform/0`.
  """

  @spec uniform() :: float()

  def uniform(), do: :erlang.nif_error(:nif_not_loaded)

  @doc """
  Return a positive integer within specified range, similar to `:rand.uniform/1`.

  Note that `n` should be a positive number less than `2^32`.
  """

  @spec uniform(1..unquote((1 <<< 32) - 1)) :: pos_integer()

  def uniform(_n), do: :erlang.nif_error(:nif_not_loaded)
end
