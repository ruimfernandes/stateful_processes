defmodule StatefulProcesses.Repo do
  use Ecto.Repo,
    otp_app: :stateful_processes,
    adapter: Ecto.Adapters.Postgres
end
