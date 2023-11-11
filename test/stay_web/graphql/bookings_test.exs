defmodule StayWeb.Graphql.BookingsTest do
  use StayWeb.ConnCase, async: true

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
end
