class Campaign < ActiveRecord::Base
	belongs_to :user
	has_many :comments
	has_many :donations

	def self.campaigns_categories
		["Animales", "Caridad", "Deportes", "Medica", "Negocios"]
	end

	def self.campaign_complete
		20
	end
end
