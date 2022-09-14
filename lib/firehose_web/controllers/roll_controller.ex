defmodule FirehoseWeb.RollController do
  use FirehoseWeb, :controller    # Bring in "controller stuff"
  require Logger

  def index(conn, params) do   # From ":index" in router.ex
    Logger.info("From router.ex", params)
    num = :rand.uniform(6)
    render(conn, "index.json", roll: %{value: num})
  end

  def show(conn, %{"num_dice" => num_dice}) do
    rolls = case Integer.parse(num_dice) do
      {num, _} -> for x <- 1..num do
        %{die: x, value: :rand.uniform(6)}
      end
      _ -> :error
    end
    render(conn, "show.json", rolls: rolls)
  end
end
