class AuthorizationCode < ApplicationRecord
    has_many :authorization_code_scopes
    has_many :scopes, through: :authorization_code_scopes
end
