defmodule FirehoseWeb.FreelistView do
  use FirehoseWeb, :view
  require Jason

  def render("show.json", %{resp: resp}) do
    %{entries: resp}
  end
end
