defmodule Stay.Repo.Migrations.CreateBookings do
  use Ecto.Migration

  def change do
    create table(:bookings) do
      add :check_in_date, :date
      add :check_out_date, :date
      add :number_of_guests, :integer
      add :total_price, :decimal
      add :status, :string
      add :user_id, references(:users, on_delete: :nothing)
      add :listing_id, references(:listings, on_delete: :nothing)

      timestamps(type: :utc_datetime)
    end

    create index(:bookings, [:user_id])
    create index(:bookings, [:listing_id])
  end
end
