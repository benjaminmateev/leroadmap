# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Leroadmap.Repo.insert!(%Leroadmap.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Leroadmap.{Project, Repo, User}

%{email: "bemateev@microsoft.com", name: "Benjamin", avatar: ""}
|> User.changeset()
|> Repo.insert!()

%{email: "naheraldv@microsoft.com", name: "Nathan", avatar: ""}
|> User.changeset()
|> Repo.insert!()

%{name: "Le Roadmap", start_date: ~D[2018-04-16]}
|> Project.changeset()
|> Repo.insert!()
