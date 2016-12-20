class Donation < ActiveRecord::Base
	belongs_to :campaign

	validates_numericality_of :amount, greater_than: 0
end
