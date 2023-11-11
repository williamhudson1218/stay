defmodule StayWeb.Graphql.BookingsTest do
  use StayWeb.ConnCase, async: true
  alias Stay.Context.Bookings

  defp insert_test_booking(attrs) do
    booking_attrs =
      %{
        check_out_date: "2023-02-05",
        number_of_guests: 2,
        total_price: 300.00,
        status: "Confirmed"
      }
      |> Map.merge(attrs)

    {:ok, booking} = Bookings.create_booking(booking_attrs)
    booking
  end

  test "create_booking mutation successfully creates a booking", %{conn: conn} do
    input = %{
      check_in_date: "2023-02-01",
      check_out_date: "2023-02-05",
      number_of_guests: 2,
      total_price: 300.00,
      status: "Confirmed",
      inserted_at: "2023-01-01T12:00:00",
      updated_at: "2023-01-01T12:00:00"
    }

    mutation = """
      mutation CreateBooking($input: BookingInput!) {
        createBooking(input: $input) {
          id
          check_in_date
        }
      }
    """

    variables = %{
      "input" => input
    }

    response =
      post(conn, "/graphql", %{query: mutation, variables: variables})
      |> json_response(200)
      |> Map.get("data")
      |> Map.get("createBooking")

    assert response["id"] != nil
    assert response["check_in_date"] == "2023-02-01"
  end

  test "booking query successfully retrieves a single booking", %{conn: conn} do
    test_booking = insert_test_booking(%{check_in_date: "2023-02-01"})

    query = """
      query GetBooking($id: ID!) {
        booking(id: $id) {
          id
          check_in_date
        }
      }
    """

    variables = %{
      "id" => Integer.to_string(test_booking.id)
    }

    response =
      post(conn, "/graphql", %{query: query, variables: variables})
      |> json_response(200)
      |> Map.get("data")
      |> Map.get("booking")

    assert response["id"] == test_booking.id
    assert response["check_in_date"] == "2023-02-01"
  end
end
