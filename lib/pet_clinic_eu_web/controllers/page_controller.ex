defmodule PetClinicEuWeb.PageController do
  use PetClinicEuWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
