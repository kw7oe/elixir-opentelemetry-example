defmodule OpentelemetryDemo.Worker do
  use GenServer
  require Logger
  require OpenTelemetry.Tracer
  require OpenTelemetry.Span

  # Client
  def start_link(default) when is_list(default) do
    OpenTelemetry.Tracer.with_span "start-link" do
      OpenTelemetry.Span.set_attribute("my_attribute", "my_value")
      GenServer.start_link(__MODULE__, default)
    end
  end

  def push(pid, element) do
    GenServer.cast(pid, {:push, element})
  end

  def pop(pid) do
    GenServer.call(pid, :pop)
  end

  # Server (callbacks)
  @impl true
  def init(stack) do
    Logger.info("Starting #{__MODULE__}...")
    {:ok, stack}
  end

  @impl true
  def handle_call(:pop, _from, [head | tail]) do
    {:reply, head, tail}
  end

  @impl true
  def handle_cast({:push, element}, state) do
    {:noreply, [element | state]}
  end
end
