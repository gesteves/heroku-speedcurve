# encoding: utf-8
require "sinatra"
require "httparty"

post "/deploy/:key/:site_id" do
  url = "https://api.speedcurve.com/v1/deploy"
  body = {
    site_id: params[:site_id],
    detail: %Q{#{params[:app]} #{params[:release]} #{params[:head]} #{params[:git_log]} was deployed to Heroku by #{params[:user]}},
    note: %Q{#{params[:app]} #{params[:release]} #{params[:head]} #{params[:git_log]}},
  }
  auth = {
    username: params[:key],
    password: "x",
  }
  sleep 20
  response = HTTParty.post(url, body: body, basic_auth: auth)
  status response.code
  body response.body
end
