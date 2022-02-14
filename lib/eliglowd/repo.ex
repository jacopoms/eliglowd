defmodule Eliglowd.Repo do
  use Ecto.Repo,
    otp_app: :eliglowd,
    adapter: Ecto.Adapters.Postgres
end
