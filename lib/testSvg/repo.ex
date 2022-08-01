defmodule TestSvg.Repo do
  use Ecto.Repo,
    otp_app: :testSvg,
    adapter: Ecto.Adapters.Postgres
end
