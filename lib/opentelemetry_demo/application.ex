defmodule OpentelemetryDemo.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application
  require Logger

  @impl true
  def start(_type, _args) do
    children = [
      # Starts a worker by calling: OpentelemetryDemo.Worker.start_link(arg)
      {OpentelemetryDemo.Worker, []}
    ]

    OpenTelemetry.register_application_tracer(:opentelemetry_demo)

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: OpentelemetryDemo.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
