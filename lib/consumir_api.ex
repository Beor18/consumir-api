defmodule ConsumirApi do
    use Application
    def bitcoin do
      HTTPotion.start
      request("https://api.coinmarketcap.com/v1/ticker/bitcoin/")
      |> body
      |> parse_body_to_tuple
      |> get_list_per_tuple
      |> get_map_to_list
      |> create_message
      |> show_message
    end

    def interar do
      abecedario = for n <- ?a..?z, do: << n :: utf8 >>
      map2 = %{
        1 => 1, 2 => 2, 3 => 3, 4 => 4, 5 => 5, 6 => 6, 7 => 7,
        21 => 1, 22 => 2, 23 => 3, 24 => 4, 25 => 5, 26 => 6, 27 => 7,
        11 => 1, 12 => 2, 13 => 3, 14 => 4, 15 => 5, 16 => 6, 17 => 7,
        61 => 1, 62 => 2, 63 => 3, 64 => 4, 65 => 5, 66 => 6, 67 => 7,
        51 => 1, 52 => 2, 53 => 3, 54 => 4, 55 => 5, 56 => 6, 57 => 7,
        41 => 1, 42 => 2, 43 => 3, 44 => 4, 45 => 5, 46 => 6, 47 => 7
      }
      sorted_map = Enum.to_list(map2)
      IO.inspect sorted_map
      IO.puts "Se muestra abecedario de forma ordenada con un for"
      IO.puts abecedario
    end

    defp request(url) do
      HTTPotion.get url
    end

    def body(response) do
      response.body
    end

    defp parse_body_to_tuple(body) do
      Poison.Parser.parse body
    end

    defp get_list_per_tuple(tuple) do
      elem(tuple, 1)
    end

    defp get_map_to_list(list) do
      list |> Enum.at 0
    end

    defp create_message(map) do
      "> #{map["name"]} #{map["symbol"]} tiene un precio actual de #{map["price_usd"]}"
    end

    defp show_message(message) do
      IO.puts message
    end
end
