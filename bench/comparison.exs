defmodule RandNif.Bench.Comparison do
  @n 100
  @x 10000

  def uniform() do
    Benchee.run(
      %{
        ":rand.uniform/0" => fn ->
          unquote(
            for _ <- 1..@n do
              quote do
                :rand.uniform()
              end
            end
          )
        end,
        ":rand.uniform/1" => fn ->
          unquote(
            for _ <- 1..@n do
              quote do
                :rand.uniform(@x)
              end
            end
          )
        end,
        "RandNif.uniform/0" => fn ->
          unquote(
            for _ <- 1..@n do
              quote do
                RandNif.uniform()
              end
            end
          )
        end,
        "RandNif.uniform_noop/0" => fn ->
          unquote(
            for _ <- 1..@n do
              quote do
                RandNif.uniform_noop()
              end
            end
          )
        end,
        "RandNif.uniform/1" => fn ->
          unquote(
            for _ <- 1..@n do
              quote do
                RandNif.uniform(@x)
              end
            end
          )
        end
      },
      time: 10,
      memory_time: 5
    )
  end
end

RandNif.Bench.Comparison.uniform()
