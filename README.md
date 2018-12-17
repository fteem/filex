# Filex

A Elixir library that wraps [file.io](https://file.io)'s API, allowing 
ephemeral file sharing/uploads via your Elixir apps.

## Installation

The package can be installed by adding `filex` to your list of dependencies in
`mix.exs`:

```elixir
def deps do
  [
    {:filex, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/filex](https://hexdocs.pm/filex).

## Usage

`Filex` has two available functions: `Filex.upload/1` and `Filex.upload/3`:

`Filex.upload/3` takes a `file_path`, an `amount` and a `period` as arguments.
A `period` can be `:week`, `:month` or `:year`, while amount is an `int`
expressing the amount of periods:

```elixir
iex> Filex.upload("/path/to/file.txt", 2, :week)
{ :ok, [url: "https://file.io/UiHJKe", expires: "14 days"]}

iex> Filex.upload("/path/to/file.txt", 3, :month)
{ :ok, [url: "https://file.io/XRpTyW", expires: "90 days"]}

iex> Filex.upload("/path/to/file.txt", 1, :year)
{ :ok, [url: "https://file.io/OLbXRq", expires: "365 days"]}
```

`Filex.upload/1` is an alias for `Filex.upload(file_path, 1, :week)`:

```elixir
iex> Filex.upload("/path/to/file.txt")
{ :ok, [url: "https://file.io/aQbnDJ", expires: "7 days"]}
```

## License

This project is licensed under the MIT License. See [LICENSE](https://github.com/fteem/filex/blob/master/LICENSE).
