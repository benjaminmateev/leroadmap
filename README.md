# Leroadmap

## Development setup

First, install `brew`.

```sh
$ brew install postgresql elixir node
```

## Project setup

```sh
$ mix deps.get
$ cd assets && npm i
$ mix ecto.reset
```

## Tests

```sh
$ mix test
$ mix test --stale
```

## Dev server

```sh
$ mix phx.server

# or for a development console
$ iex -S mix phx.server
```
