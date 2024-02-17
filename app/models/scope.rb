class Scope < ApplicationRecord
    has_many :authorization_code_scopes
    has_many :authorization_codes, through: :authorization_code_scopes
    
    has_many :access_tokens_scopes
    has_many :access_tokens, through: :access_tokens_scopes
end
