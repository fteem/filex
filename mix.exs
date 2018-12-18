defmodule Filex.MixProject do
  use Mix.Project

  def project do
    [
      app: :filex,
      version: "0.1.0",
      elixir: "~> 1.7",
      name: "Filex",
      source_url: "https://github.com/fteem/filex",
      start_permanent: Mix.env() == :prod,
      test_coverage: [tool: ExCoveralls],
      preferred_cli_env: [
        coveralls: :test,
        "coveralls.detail": :test,
        "coveralls.post": :test,
        "coveralls.html": :test
      ],
      deps: deps()
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
      {:httpoison, "~> 1.5.0"},
      {:poison, "~> 4.0.1"},
      {:ex_doc, "~> 0.19.1"},
      {:excoveralls, "~> 0.10.3", only: :test}
    ]
  end
end
