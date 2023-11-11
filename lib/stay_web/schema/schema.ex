defmodule StayWeb.Schema do
  use Absinthe.Schema
  alias StayWeb.Resolvers.Bookings
  alias StayWeb.Resolvers.Listings
  alias StayWeb.Resolvers.Users

  import_types(StayWeb.Types)

  query do
    field :user, type: :user do
      arg(:id, non_null(:id))
      resolve(&Users.get_user/2)
    end

    field :users, list_of(:user) do
      resolve(&Users.list_users/2)
    end

    field :listing, type: :listing do
      arg(:id, non_null(:id))
      resolve(&Listings.get_listing/2)
    end

    field :listings, list_of(:listing) do
      resolve(&Listings.list_listings/2)
    end

    field :booking, type: :booking do
      arg(:id, non_null(:id))
      resolve(&Bookings.get_booking/2)
    end

    field :bookings, list_of(:booking) do
      resolve(&Bookings.list_bookings/2)
    end
  end

  mutation do
    field :create_user, type: :user do
      arg(:input, non_null(:user_input))
      resolve(&Users.create_user/2)
    end

    field :update_user, type: :user do
      arg(:id, non_null(:id))
      arg(:input, non_null(:user_input))
      resolve(&Users.update_user/2)
    end

    field :delete_user, type: :user do
      arg(:id, non_null(:id))
      resolve(&Users.delete_user/2)
    end

    field :create_listing, type: :listing do
      arg(:input, non_null(:listing_input))
      resolve(&Listings.create_listing/2)
    end

    field :update_listing, type: :listing do
      arg(:id, non_null(:id))
      arg(:input, non_null(:listing_input))
      resolve(&Listings.update_listing/2)
    end

    field :delete_listing, type: :listing do
      arg(:id, non_null(:id))
      resolve(&Listings.delete_listing/2)
    end

    field :create_booking, type: :booking do
      arg(:input, non_null(:booking_input))
      resolve(&Bookings.create_booking/2)
    end

    field :update_booking, type: :booking do
      arg(:id, non_null(:id))
      arg(:input, non_null(:booking_input))
      resolve(&Bookings.update_booking/2)
    end

    field :delete_booking, type: :booking do
      arg(:id, non_null(:id))
      resolve(&Bookings.delete_booking/2)
    end
  end
end
