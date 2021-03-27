defmodule Events.Users.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :name, :string
    field :email, :string
    field :password_hash, :string
    field :password, :string, virtual: true

    has_many :posts, Events.Posts.Post
    has_many :comments, Events.Comments.Comment
    has_many :votes, Events.Votes.Vote

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    password = attrs["password"]
    user
    |> cast(attrs, [:name, :email, :password])
    |> validate_password
    |> hash_password
    |> validate_required([:name, :email, :password_hash])
  end

  def hash_password(cset) do
    pass = get_field(cset, :password)
    if pass do
      change(cset, Argon2.add_hash(pass))
    else
      cset
    end
  end

  def validate_password(cset) do
    pass = get_field(cset, :password)
    if pass && String.length(pass) < 8 do
      add_error(cset, :password, "too short")
    else
      cset
    end
  end
end
