class Blog < ApplicationRecord
    validates :name , presence: true ,length: {maximum: 140}
    validates :title , presence: true ,length: {maximum: 140}
    validates :content , presence: true ,length: {maximum: 140}
end
