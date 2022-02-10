require "sinatra"
require "sinatra/reloader" if development?
require "pry-byebug"
require "better_errors"
configure :development do
  use BetterErrors::Middleware
  BetterErrors.application_root = File.expand_path(__dir__)
end

require_relative "config/application"

set :views, (proc { File.join(root, "app/views") })
set :bind, '0.0.0.0'



get '/' do
  # TODO
  # 1. fetch posts from database.
  @posts = Post.order(:votes).reverse

  # @posts.by_most_popular
  # 2. Store these posts in an instance variable
  # 3. Use it in the `app/views/posts.erb` view
  erb :posts # Do not remove this line
end

post "/posts" do
  @post = Post.new
  @post.title = params[:title]
  @post.url = params[:url]
  @post.user = User.first
  @post.save

  if @post.save
    redirect '/'
  else
    erb :error_post
  end
end

put "/posts/:id/upvote" do
  @post = Post.find(params[:id])
  @post.votes += 1
  @post.save

  redirect to '/'
end
