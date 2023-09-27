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
  @apr = params.fetch("user_apr").to_f.round(4)
  r = (params.fetch("user_apr").to_f / 100 )/ 12
  @years = params.fetch("user_years")
  n = @years.to_f * 12
  d1 = (1 + r)
  d2 = (n *-1)
 
  denominator = 1 - (d1 ** d2)
  @principal = params.fetch("user_pv").to_f
  @payment = (r * @principal)/denominator
  #@payment = @payment.to_s(:currency)
  #@user_apr = params.fetch("user_apr").to_f.to_fs(:percentage, {precision: 4})

  #@apr_result = apr.to_s(:percentage, { :precision => 4})

  erb(:payment_results)
end
