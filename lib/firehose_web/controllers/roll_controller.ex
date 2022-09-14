defmodule FirehoseWeb.RollController do
  use FirehoseWeb, :controller    # Bring in "controller stuff"
  require Logger

  def index(conn, params) do   # From ":index" in router.ex
    Logger.info("From router.ex", params)
    num = :rand.uniform(6)
    render(conn, "index.json", roll: num)
  end
end
