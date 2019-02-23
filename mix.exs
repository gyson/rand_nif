defmodule RandNif.MixProject do
  use Mix.Project

  def project do
    [
      app: :rand_nif,
      version: "0.1.1",
      elixir: "~> 1.8",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      package: package(),
      compilers: [:rustler] ++ Mix.compilers(),
      rustler_crates: rustler_crates(),
      description: "RandNif is a native implementation (NIF) in Rust for random number generator, similar to :rand module",
      name: "RandNif",
      source_url: "https://github.com/gyson/rand_nif"
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:rustler, "~> 0.19.0"},
      {:benchee, "~> 0.13", only: :dev},
      {:ex_doc, "~> 0.19", only: :dev, runtime: false},
      {:dialyxir, "~> 1.0.0-rc.4", only: :dev, runtime: false}
    ]
  end

  defp rustler_crates do
    [
      randnif: [
        path: "native/randnif",
        mode: :release
      ]
    ]
  end

  def package do
    %{
      files: ~w(lib priv .formatter.exs mix.exs README* readme* LICENSE*
                license* CHANGELOG* changelog* src native)
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/gyson/rand_nif"}
    }
  end
end
