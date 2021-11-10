defmodule Zsonline.CMS.Page do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "pages" do
    field :body, :string
    field :title, :string
    field :views, :integer
    belongs_to :author, Zsonline.CMS.Author
    timestamps()
  end

  @doc false
  def changeset(page, attrs) do
    page
    # |> cast(attrs, [:title, :body, :views])
    # |> validate_required([:title, :body, :views])
    |> cast(attrs, [:title, :body])
    |> validate_required([:title, :body])
  end
end
