defmodule FirehoseWeb.DatetimeController do
  use FirehoseWeb, :controller

  def show(conn, _params) do
    resp = hd(tl(Map.values(HTTPoison.get!("http://time.jsontest.com/"))))
    render(conn, "show.json", %{resp: resp})
  end

end
