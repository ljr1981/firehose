defmodule FirehoseWeb.FreelistController do
  use FirehoseWeb, :controller

  def freelist_index(conn, _params) do
    resp = hd(tl(Map.values(HTTPoison.get!("https://api.publicapis.org/entries"))))
    render(conn, "show.json", %{resp: resp})
  end

  def catfacts_index(conn, _params) do
    resp = hd(tl(Map.values(HTTPoison.get!("https://catfact.ninja/fact"))))
    render(conn, "show.json", %{resp: resp})
  end

  def coindesk_index(conn, _params) do
    resp = hd(tl(Map.values(HTTPoison.get!("https://api.coindesk.com/v1/bpi/currentprice.json"))))
    render(conn, "show.json", %{resp: resp})
  end

  def agify_index(conn, %{"name" => name}) do
    resp = hd(tl(Map.values(HTTPoison.get!("https://api.agify.io/?name=" <> name))))
    render(conn, "show.json", %{resp: resp})
  end

  def joke_show(conn, _params) do
    resp = hd(tl(Map.values(HTTPoison.get!("https://official-joke-api.appspot.com/random_joke"))))
    render(conn, "show.json", %{resp: resp})
  end

  def rnd_user(conn, _params) do
    resp = hd(tl(Map.values(HTTPoison.get!("https://randomuser.me/api/"))))
    render(conn, "show.json", %{resp: resp})
  end

end
