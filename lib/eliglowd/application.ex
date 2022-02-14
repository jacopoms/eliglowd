defmodule Eliglowd.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Eliglowd.Repo,
      # Start the Telemetry supervisor
      EliglowdWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Eliglowd.PubSub},
      # Start the Endpoint (http/https)
      EliglowdWeb.Endpoint
      # Start a worker by calling: Eliglowd.Worker.start_link(arg)
      # {Eliglowd.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Eliglowd.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    EliglowdWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
