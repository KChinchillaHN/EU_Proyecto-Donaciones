class Campaign < ActiveRecord::Base
	belongs_to :user
	has_many :comments
	has_many :donations

	def self.campaigns_categories
		["Animales", "Caridad", "Deportes", "Medica", "Negocios"]
	end

	def sum_of_donations
		self.donations.sum(:amount)
	end

	validates_presence_of :title, :review
	validates_numericality_of :goal, greater_than: 0

	before_save:check_photo

	protected

	def check_photo
		if image_url.blank?
			self.image_url = "http://encendo.co/wp-content/uploads/2016/01/Preparing-Digital-Marketing-Campaigns.jpg"
		end
	end

end
