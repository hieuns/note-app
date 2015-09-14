require "sinatra"
require "sinatra/activerecord"
require "./models/note"

set :database, {adapter: "sqlite3", database: "noteapp.sqlite3"}

get "/" do
  @notes = Note.all
  erb :home
end

post "/notes" do
  @note = Note.new content: params[:content]
  @note.save
  redirect "/"
end

get "/notes/:id/edit" do
  @note = Note.find params[:id]
  erb :edit
end

put "/notes/:id" do
  @note = Note.find params[:id]
  if @note.update_attributes(content: params[:content], done: params[:done])
    redirect "/"
  else
    erb :edit
  end
end

delete "/notes/:id" do
  Note.destroy params[:id]
  redirect "/"
end
