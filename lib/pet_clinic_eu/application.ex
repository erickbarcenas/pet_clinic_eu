defmodule PetClinicEu.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      PetClinicEu.Repo,
      # Start the Telemetry supervisor
      PetClinicEuWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: PetClinicEu.PubSub},
      # Start the Endpoint (http/https)
      PetClinicEuWeb.Endpoint
      # Start a worker by calling: PetClinicEu.Worker.start_link(arg)
      # {PetClinicEu.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: PetClinicEu.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    PetClinicEuWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
