defmodule Danos.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      DanosWeb.Telemetry,
      # Start the Ecto repository
      Danos.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: Danos.PubSub},
      # Start Finch
      {Finch, name: Danos.Finch},
      # Start the Endpoint (http/https)
      DanosWeb.Endpoint
      # Start a worker by calling: Danos.Worker.start_link(arg)
      # {Danos.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Danos.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    DanosWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
