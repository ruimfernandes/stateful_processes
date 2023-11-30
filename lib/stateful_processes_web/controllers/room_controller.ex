defmodule StatefulProcessesWeb.RoomController do
  use StatefulProcessesWeb, :controller

  alias StatefulProcesses.Server

  action_fallback StatefulProcessesWeb.FallbackController

  def index(conn, _params) do
    rooms = Server.list_rooms()
    render(conn, :index, rooms: rooms)
  end

  def create(conn, %{"name" => name}) do
    room = Server.start_room(name)

    conn
    |> put_status(:created)
    |> render(:show, room: room)
  end
end
