class Recipe < ActiveRecord::Base
	before_save :sanitize_ingredients_text
	after_initialize :create_ingredients	

	belongs_to :user

	acts_as_taggable_on :categories

	attr_accessor :ingredients

	validates :title, presence: true, length: { maximum: 255 }
	validates :description, presence: true, length: { maximum: 600 }
	validates :ingredients_text, presence: true, length: { maximum: 1800 }
	validates :directions, presence: true, length: { maximum: 1800 }
	validates :servings, length: { maximum: 50 }
	validates :prep_time, presence: true, length: { maximum: 100 }
	validates :prep_time_increment, presence: true, inclusion: { :in => %w( Seconds Minutes Hours Days ) }
	validates :cook_time, presence: true, length: { maximum: 100 }
	validates :cook_time_increment, presence: true, inclusion: { :in => %w( Seconds Minutes Hours Days ) }
	validates :servings, presence: true

  def ingredients
    @ingredients ||= []
  end

  def create_ingredients
    if !self.ingredients_text.blank?
      self.ingredients_text.split("\n").each do |i|
        ingredients << Ingredient.new(i)
      end
    end  
  end

  def sanitize_ingredients_text
    self.ingredients_text = ingredients_text.gsub("\r", "").gsub(/\sof/, '').gsub(/\n{2,}/, "\n") unless ingredients_text.blank?
  end

	def validate_ingredients
		if ingredients.any? { |ingredient| !ingredient.valid? }
			errors.add(:ingredients_text, "You have entered an invalid ingredient.  Check the list above and correct the error.")
		end
	end
end
