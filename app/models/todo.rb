class Todo < ActiveRecord::Base
  belongs_to :user
  def self.get_page(page)
    Todo.order("deadline DESC").paginate( :page => page, :per_page => 5)
  end
end
