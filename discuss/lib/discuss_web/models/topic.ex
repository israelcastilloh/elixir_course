defmodule Discuss.Topic do
  use Discuss.Web, :model

  schema "topics" do
    field :title, :string
  end

  def changeset(struct, params \\ %{}) do #\\ to define default
    struct
    |> cast(params, [:title]) #cast is a changeset
    |> validate_required([:title]) #validates is a property of field, title/string
  end
end
