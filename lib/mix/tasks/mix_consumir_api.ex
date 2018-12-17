defmodule Mix.Tasks.MixConsumirApi do
    use Mix.Task
    require Logger

    def run(_) do
        start_ms = System.monotonic_time(:milliseconds)
        ConsumirApi.bitcoin
        end_ms = System.monotonic_time(:milliseconds)
        diff = end_ms - start_ms
        Logger.info "La respuesta a la api fue en #{diff} ms"
    end
end