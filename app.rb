require "sinatra"
require "sinatra/reloader"

get("/") do
  "
  <h1>Welcome to your Sinatra App!</h1>
  <p>Define some routes in app.rb</p>
  "
  erb(:hi)
end

get("/square/new") do
  
  erb(:square)
end

get("/square/results") do
  @x = params.fetch("user_number").to_f
  @y = @x ** 2


  
  erb(:square_results)
end

get("/square_root/new") do

  erb(:square_roots)
end

get("/square_root/results") do
  @x = params.fetch("user_number").to_f
  @y = Math.sqrt(@x)
  erb(:square_roots_results)
end

get("/payment/new") do

  erb(:payment)
end


get("/random/new") do

  erb(:random)
end

get("/random/results") do
  @x = params.fetch("user_min").to_f
  @y = params.fetch("user_max").to_f
  @z = rand(@x..@y)
  erb(:random_results)
end



get("/payment/results") do
  r = (params.fetch("apr").to_f / 100 )/ 12
  n = params.fetch("years").to_f * 12
  d1 = (1 + r)
  d2 = (n *-1)
 
  denominator = 1 - (d1 ** d2)
  @principal = params.fetch("principal").to_f
  @payment = (r * @principal)/denominator
  @payment= @payment.to_fs(:currency)

  erb(:payment_results)
end
