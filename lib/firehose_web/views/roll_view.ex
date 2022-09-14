defmodule FirehoseWeb.RollView do
  use FirehoseWeb, :view

  def render("index.json", %{roll: roll}) do
    %{data: render_one(roll, __MODULE__, "roll.json")}
  end

  def render("roll.json", %{roll: %{die: die, value: num}}) when is_integer(num) do
    %{die: die, value: num}
  end

  def render("roll.json", %{roll: %{value: num}}) when is_integer(num) and num > 0 do
    %{value: num}
  end

  def render("show.json", %{rolls: rolls}) do
    rolls |> IO.inspect(label: "rolls")
    %{data: render_many(rolls, __MODULE__, "roll.json")}
  end
end
