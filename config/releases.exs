import Config

config :opentelemetry,
       :processors,
       ot_batch_processor: %{
         exporter: {:opentelemetry_exporter, %{endpoints: [{:http, 'otel', 55681, []}]}}
       }
