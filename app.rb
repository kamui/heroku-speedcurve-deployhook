# encoding: utf-8
require "sinatra"
require "http"

DELAY_TIME = (ENV["DELAY_TIME"] && ENV["DELAY_TIME"].to_i) || 25
DEPLOY_API_URL = "https://api.speedcurve.com/v1/deploy"

post "/deploy/:key/:site_id" do
  json = {
    site_id: params[:site_id],
    detail: %Q{#{params[:app]} #{params[:release]} #{params[:head]} #{params[:git_log]} was deployed to Heroku by #{params[:user]}},
    note: %Q{#{params[:app]} #{params[:release]} #{params[:head]} #{params[:git_log]}},
  }
  sleep DELAY_TIME
  response = HTTP
              .basic_auth(
                user: params[:key],
                pass: "x",
              )
              .post(DEPLOY_API_URL, json: json)
  status response.code
  body response.body.to_s
end
