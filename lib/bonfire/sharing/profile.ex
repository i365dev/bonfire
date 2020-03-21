defmodule Bonfire.Sharing.Profile do
  @moduledoc """
  A database schema representing user profiles.
  """

  use Ecto.Schema
  import Ecto.Changeset

  @min_share_key_len 4

  schema "profiles" do
    field :share_key, :string
    field :timezone, :string
    belongs_to :user, Bonfire.Users.User

    timestamps()
  end

  @doc false
  def creating_changeset(profile, attrs) do
    profile
    |> cast(attrs, [:share_key, :user_id, :timezone])
    |> validate_length(:share_key, min: @min_share_key_len)
    |> unique_constraint(:share_key)
  end

  @doc false
  def updating_changeset(profile, attrs) do
    profile
    |> cast(attrs, [:share_key, :timezone])
    |> validate_length(:share_key, min: @min_share_key_len)
    |> unique_constraint(:share_key)
  end
end
