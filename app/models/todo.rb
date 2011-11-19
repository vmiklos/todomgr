class Todo < ActiveRecord::Base
  belongs_to :user
  def self.get_page(page, history, search)
    q = Todo.where("public = 1").where("deadline "+(!history ? ">=" : "<")+" ?", Time.now)
    if !search.eql? nil
      q = q.where("todo like ?", "%#{search}%")
    end
    q = q.order("deadline " + (!history ? "ASC" : "DESC"))
    q.paginate(:page => page, :per_page => 5)
  end
end
