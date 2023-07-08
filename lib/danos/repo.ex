defmodule Danos.Repo do
  use Ecto.Repo,
    otp_app: :danos,
    adapter: Ecto.Adapters.Postgres
end
