defmodule StatefulProcesses.ServerTest do
  use StatefulProcesses.DataCase

  alias StatefulProcesses.Server

  describe "rooms" do
    alias StatefulProcesses.Server.Room

    import StatefulProcesses.ServerFixtures

    @invalid_attrs %{}

    test "list_rooms/0 returns all rooms" do
      room = room_fixture()
      assert Server.list_rooms() == [room]
    end

    test "get_room!/1 returns the room with given id" do
      room = room_fixture()
      assert Server.get_room!(room.id) == room
    end

    test "create_room/1 with valid data creates a room" do
      valid_attrs = %{}

      assert {:ok, %Room{} = room} = Server.create_room(valid_attrs)
    end

    test "create_room/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Server.create_room(@invalid_attrs)
    end

    test "update_room/2 with valid data updates the room" do
      room = room_fixture()
      update_attrs = %{}

      assert {:ok, %Room{} = room} = Server.update_room(room, update_attrs)
    end

    test "update_room/2 with invalid data returns error changeset" do
      room = room_fixture()
      assert {:error, %Ecto.Changeset{}} = Server.update_room(room, @invalid_attrs)
      assert room == Server.get_room!(room.id)
    end

    test "delete_room/1 deletes the room" do
      room = room_fixture()
      assert {:ok, %Room{}} = Server.delete_room(room)
      assert_raise Ecto.NoResultsError, fn -> Server.get_room!(room.id) end
    end

    test "change_room/1 returns a room changeset" do
      room = room_fixture()
      assert %Ecto.Changeset{} = Server.change_room(room)
    end
  end
end
