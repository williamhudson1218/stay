defmodule StayWeb.Types do
  use Absinthe.Schema.Notation
  import_types(Absinthe.Type.Custom)

  # base objects
  object :user do
    field :id, :integer
    field :email, :string
    field :password_hash, :string
    field :first_name, :string
    field :last_name, :string
    field :profile_picture, :string
    field :phone_number, :string
    field :date_of_birth, :date
    field :location, :string
    field :bio, :string
    field :inserted_at, :naive_datetime
    field :updated_at, :naive_datetime
  end

  object :listing do
    field :id, :integer
    field :title, :string
    field :description, :string
    field :location, :string
    field :price, :decimal
    field :number_of_bedrooms, :integer
    field :number_of_bathrooms, :integer
    field :property_type, :string
    field :max_guests, :integer
    field :amenities, :string
    field :inserted_at, :naive_datetime
    field :updated_at, :naive_datetime
  end

  object :booking do
    field :id, :integer
    field :check_in_date, :date
    field :check_out_date, :date
    field :number_of_guests, :integer
    field :total_price, :decimal
    field :status, :string
    field :inserted_at, :naive_datetime
    field :updated_at, :naive_datetime
  end

  input_object :user_input do
    field :email, :string
    field :password_hash, :string
    field :first_name, :string
    field :last_name, :string
    field :profile_picture, :string
    field :phone_number, :string
    field :date_of_birth, :date
    field :location, :string
    field :bio, :string
    field :inserted_at, :naive_datetime
    field :updated_at, :naive_datetime
  end

  input_object :listing_input do
    field :title, :string
    field :description, :string
    field :location, :string
    field :price, :decimal
    field :number_of_bedrooms, :integer
    field :number_of_bathrooms, :integer
    field :property_type, :string
    field :max_guests, :integer
    field :amenities, :string
    field :inserted_at, :naive_datetime
    field :updated_at, :naive_datetime
  end

  input_object :booking_input do
    field :check_in_date, :date
    field :check_out_date, :date
    field :number_of_guests, :integer
    field :total_price, :decimal
    field :status, :string
    field :inserted_at, :naive_datetime
    field :updated_at, :naive_datetime
  end
end
