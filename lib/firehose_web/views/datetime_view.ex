defmodule FirehoseWeb.DatetimeView do
  use FirehoseWeb, :view

  def render("show.json", %{resp: resp}) do
    %{date_time: resp}
  end

end
