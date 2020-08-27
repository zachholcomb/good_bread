defmodule GoodBread.Repo do
  use Ecto.Repo,
    otp_app: :good_bread,
    adapter: Ecto.Adapters.Postgres
end
