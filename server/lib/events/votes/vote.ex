defmodule Events.Votes.Vote do
  use Ecto.Schema
  import Ecto.Changeset

  schema "votes" do
    field :value, :integer
    belongs_to :user, Events.Users.User
    belongs_to :post, Events.Posts.Post

    timestamps()
  end

  @doc false
  def changeset(vote, attrs) do
    vote
    |> cast(attrs, [:value, :user_id, :post_id])
    |> validate_required([:value, :user_id, :post_id])
  end
end
