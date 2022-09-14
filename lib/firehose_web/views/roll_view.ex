defmodule FirehoseWeb.RollView do
  use FirehoseWeb, :view

  # Ref RollController def index
  #
  def render("index.json", %{roll: num}) when is_integer(num) do
    %{status: "ok", roll: num}
  end
end
