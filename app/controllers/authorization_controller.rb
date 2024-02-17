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

  def decision
    client       = session[:client]
    state        = session[:state]
    scopes       = session[:scopes]
    redirect_uri = session[:redirect_uri]
    session.clear

    location = "#{redirect_uri}?state=#{state}"

    if params['approved'] != 'true'
      redirect_to location + '&error=access_denied' +
        '&error_description=The+request+was+not+approved.', status: 302, allow_other_host: true
    end

    user = User.find_by(login_id: params[:login_id])
    if user.nil? || user.password != params[:password]
      redirect_to location + '&error=access_denied' +
          '&error_description=End-user+authentication-failed.', status: 302, allow_other_host: true
    end

    expires_at = Time.zone.at(Time.now.to_i + 600)

    code = AuthorizationCode.create(
      value: SecureRandom.urlsafe_base64(6),
      user_id: user.id,
      client_id: client['uid'],
      redirect_uri: redirect_uri,
      expierd_at: expires_at
    )
    redirect_to location + '&code=' + code.value, status: 302, allow_other_host: true
  end
end


