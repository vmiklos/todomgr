class Todo < ActiveRecord::Base
  belongs_to :user
  def self.get_page(page, history)
    if !history
      Todo.where("public = 1").where("deadline >= ?", Time.now).order("deadline ASC").paginate( :page => page, :per_page => 5)
    else
      Todo.where("public = 1").where("deadline < ?", Time.now).order("deadline DESC").paginate( :page => page, :per_page => 5)
    end
  end
end
