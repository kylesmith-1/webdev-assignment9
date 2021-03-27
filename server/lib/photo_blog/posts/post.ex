defmodule PhotoBlog.Posts.Post do
  use Ecto.Schema
  import Ecto.Changeset

  schema "posts" do
    field :date, :string
    field :title, :string
    field :body, :string

    belongs_to :user, PhotoBlog.Users.User
    has_many :comments, PhotoBlog.Comments.Comment
    has_many :votes, PhotoBlog.Votes.Vote

    timestamps()
  end

  @doc false
  def changeset(post, attrs) do
    post
    |> cast(attrs, [:date, :title, :body, :user_id])
    |> validate_required([:date, :title, :user_id])
  end
end
