class AuthorizationController < ApplicationController
  def index
    @client = Client.find_by(uid: params[:client_id])

    if @client.nil?
      raise "client_id is wrong."
    end

    redirect_uri = params[:redirect_uri]

    if redirect_uri.nil? || @client.redirect_uri != redirect_uri
      head :bad_request
    end

    if params['response_type'] != 'code'
      head :bad_request
    end

    state = params['state'].nil? ? '' : params['state']

    accept_scopes = Scope.all.map(&:name)

    @scopes = params[:scope].split(/\s+/).find_all { |scope| accept_scopes.include?(scope) }

    session[:client]       = @client
    session[:state]        = state
    session[:scopes]       = @scopes
    session[:redirect_uri] = redirect_uri
  end
end


