class Todo < ActiveRecord::Base
  belongs_to :user
  def self.get_page(page)
    Todo.where("deadline > ?", Time.now).order("deadline ASC").paginate( :page => page, :per_page => 5)
  end
end
