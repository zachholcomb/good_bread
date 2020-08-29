defmodule GoodBread.Orders do
  import Ecto.Query, warn: false
  alias GoodBread.Repo
  alias GoodBread.Orders.Shipment

  # SHIPMENTS

  def create_shipment(attrs \\ %{}) do
    %Shipment{}
    |> Shipment.changeset(attrs)
    |> Repo.insert()
  end
end
