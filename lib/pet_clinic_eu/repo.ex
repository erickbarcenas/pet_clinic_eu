defmodule PetClinicEu.Repo do
  use Ecto.Repo,
    otp_app: :pet_clinic_eu,
    adapter: Ecto.Adapters.Postgres
end
