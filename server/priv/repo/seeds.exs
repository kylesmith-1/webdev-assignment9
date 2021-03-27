# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Events.Repo.insert!(%Events.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Events.Repo
alias Events.Users.User
alias Events.Posts.Post
alias Events.Photos

defmodule Inject do
  def photo(name) do
    photos = Application.app_dir(:events, "priv/photos")
    path = Path.join(photos, name)
    {:ok, hash} = Photos.save_photo(name, path)
    hash
  end

  def user(name, email, pass) do
    hash = Argon2.hash_pwd_salt(pass)
    Repo.insert!(%User{name: name, email: email, password_hash: hash})
  end
end

alice = Inject.user("alice", "alice@gmail.com", "test1")
bob = Inject.user("bob", "bob@gmail.com", "test2")

moon = Inject.photo("moon.jpg")
nature = Inject.photo("nature.jpg")

p1 = %Post{
  user_id: alice.id,
  date: "1-1-1",
  title: "the first fun time",
  body: "Alice says Hi!"
}
Repo.insert!(p1)

p2 = %Post{
  user_id: bob.id,
  date: "2-2-2",
  title: "the second fun time",
  body: "Bob ate Pizza!"
}
Repo.insert!(p2)
