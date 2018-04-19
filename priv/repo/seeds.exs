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


%{email: "bemateev@microsoft.com", name: "Benjamin", avatar: ""}
|> Leroadmap.User.changeset()
|> IO.inspect()
|> Leroadmap.Repo.insert!()

%{email: "naheraldv@microsoft.com", name: "Nathan", avatar: ""}
|> Leroadmap.User.changeset()
|> Leroadmap.Repo.insert!()
