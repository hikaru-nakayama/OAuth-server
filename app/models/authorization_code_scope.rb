class AuthorizationCodeScope < ApplicationRecord
    belongs_to :scope
    belongs_to :authorization_code
end
