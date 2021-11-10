defmodule Zsonline.Repo do
  use Ecto.Repo,
    otp_app: :zsonline,
    adapter: Ecto.Adapters.Postgres
end
