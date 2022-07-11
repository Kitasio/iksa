defmodule Iksa.Repo do
  use Ecto.Repo,
    otp_app: :iksa,
    adapter: Ecto.Adapters.Postgres
end
