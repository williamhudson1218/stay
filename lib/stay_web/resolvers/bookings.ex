defmodule StayWeb.Resolvers.Bookings do
  alias Stay.Bookings.Booking
  alias Stay.Context.Bookings
  alias Stay.Repo

  # Queries
  def list_bookings(_args, _info) do
    bookings = Stay.Repo.all(Booking)
    {:ok, bookings}
  end

  def get_booking(%{id: booking_id}, _info) do
    case Stay.Repo.get(Booking, booking_id) do
      nil ->
        {:error, "Booking not found"}

      booking ->
        {:ok, booking}
    end
  end

  # Mutations
  def create_booking(%{input: booking_params}, _info) do
    Bookings.create_booking(booking_params)
  end

  def update_booking(%{id: booking_id, input: booking_params}, _info) do
    booking = Repo.get(Booking, booking_id)

    case booking do
      nil ->
        {:error, "Booking not found"}

      _ ->
        changeset = Bookings.update_booking(booking, booking_params)

        case Repo.update(changeset) do
          {:ok, updated_booking} ->
            {:ok, updated_booking}

          {:error, changeset} ->
            {:error, changeset}
        end
    end
  end

  def delete_booking(%{id: booking_id}, _info) do
    booking = Repo.get(Booking, booking_id)

    case booking do
      nil ->
        {:error, "Booking not found"}

      _ ->
        Repo.delete(booking)
        {:ok, booking}
    end
  end
end
