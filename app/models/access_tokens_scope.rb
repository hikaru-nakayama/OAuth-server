class AccessTokensScope < ApplicationRecord
    belongs_to :access_token
    belongs_to :scope
end
