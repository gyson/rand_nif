# RandNif

RandNif is a native implementation (NIF) in Rust for random number generator, similar to [`:rand`](http://erlang.org/doc/man/rand.html) module.

It uses Rust's [`rand`](https://github.com/rust-random/rand) library for actual random number generator implementation.

It uses [`rustler`](https://github.com/hansihe/Rustler) for NIF integration.

## Installation

The package can be installed by adding `rand_nif` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:rand_nif, "~> 0.1.0"}
  ]
end
```

Documentation can be found at [https://hexdocs.pm/rand_nif](https://hexdocs.pm/rand_nif).

## Example

```elixir
iex(1)> RandNif.uniform()
0.37072762226882483
iex(2)> RandNif.uniform(10)
5
iex(3)> RandNif.uniform(10)
10
iex(4)> RandNif.uniform(10)
2
```

## Benchmarks

A simple benchmark scirpt to compare `RandNif` and `:rand` module can be found at `bench/comparison.exs`. Result is as following:

```
Compiling NIF crate :randnif (native/randnif)...
    Finished release [optimized] target(s) in 0.06s
Operating System: macOS
CPU Information: Intel(R) Core(TM) i7-3720QM CPU @ 2.60GHz
Number of Available Cores: 8
Available memory: 16 GB
Elixir 1.8.1
Erlang 21.2.4

Benchmark suite executing with the following configuration:
warmup: 2 s
time: 10 s
memory time: 5 s
parallel: 1
inputs: none specified
Estimated total run time: 1.13 min


Benchmarking :rand.uniform/0...
Benchmarking :rand.uniform/1...
Benchmarking RandNif.uniform/0...
Benchmarking RandNif.uniform/1...

Name                        ips        average  deviation         median         99th %
RandNif.uniform/0      145.35 K        6.88 μs   ±192.62%        5.96 μs       14.30 μs
RandNif.uniform/1       71.77 K       13.93 μs    ±38.32%       12.55 μs       22.28 μs
:rand.uniform/0         44.99 K       22.23 μs    ±42.47%       20.53 μs       42.35 μs
:rand.uniform/1         37.81 K       26.45 μs    ±34.67%       24.31 μs       43.62 μs

Comparison:
RandNif.uniform/0      145.35 K
RandNif.uniform/1       71.77 K - 2.03x slower
:rand.uniform/0         44.99 K - 3.23x slower
:rand.uniform/1         37.81 K - 3.84x slower

Memory usage statistics:

Name                 Memory usage
RandNif.uniform/0         3.11 KB
RandNif.uniform/1         1.56 KB - 0.50x memory usage
:rand.uniform/0          11.97 KB - 3.85x memory usage
:rand.uniform/1          10.41 KB - 3.35x memory usage

**All measurements for memory usage were the same**
```

## License

MIT
