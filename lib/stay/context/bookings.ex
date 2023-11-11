defmodule Stay.Context.Bookings do
  import Ecto.Query, warn: false

  alias Stay.Repo
  alias Stay.Bookings.Booking

  def list_bookings do
    Repo.all(Booking)
  end

  def get_booking(id) do
    Repo.get(Booking, id)
  end

  def create_booking(attrs) do
    changeset =
      %Booking{}
      |> Booking.changeset(attrs)

    case Repo.insert(changeset) do
      {:ok, booking} ->
        {:ok, booking}

      {:error, changeset} ->
        {:error, changeset}
    end
  end

  def update_booking(booking, attrs) do
    booking
    |> Booking.changeset(attrs)
    |> Repo.update()
  end

  def delete_booking(booking) do
    Repo.delete(booking)
  end
end
