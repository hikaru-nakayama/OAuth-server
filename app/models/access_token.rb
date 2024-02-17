class AccessToken < ApplicationRecord
    has_many :access_tokens_scopes
    has_many :scopes, through: :access_tokens_scopes
end
