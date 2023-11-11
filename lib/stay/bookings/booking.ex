defmodule Stay.Bookings.Booking do
  use Ecto.Schema
  import Ecto.Changeset

  schema "bookings" do
    field :status, :string
    field :check_in_date, :date
    field :check_out_date, :date
    field :number_of_guests, :integer
    field :total_price, :decimal
    field :user_id, :id
    field :listing_id, :id

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(booking, attrs) do
    booking
    |> cast(attrs, [
      :check_in_date,
      :check_out_date,
      :number_of_guests,
      :total_price,
      :status
    ])
    |> validate_required([
      :check_in_date,
      :check_out_date,
      :number_of_guests,
      :total_price,
      :status
    ])
  end
end
