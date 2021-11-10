defmodule Zsonline.CMS.Author do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "authors" do
    field :bio, :string
    field :genre, :string
    field :role, :string
    belongs_to :user, Zsonline.Acounts.User
    has_many :pages, Zsonline.CMS.Page

    timestamps()
  end

  @doc false
  def changeset(author, attrs) do
    author
    |> cast(attrs, [:bio, :role, :genre])
    |> validate_required([:bio, :role, :genre])
    |> unique_constraint(:user_id)
  end
end
