# encoding: utf-8
require "sinatra"
require "httparty"

post "/deploy/:key" do
  url = "https://api.speedcurve.com/v1/deploy"
  body = {
    'detail' => "#{params[:app]} #{params[:release]} was deployed to Heroku by #{params[:user]}",
    'note' => "#{params[:app]} #{params[:release]}"
  }
  auth = {
    :username => params[:key],
    :password => 'x'
  }
  response = HTTParty.post(url, :body => body, :basic_auth => auth)
  status response.code
  body response.body
end