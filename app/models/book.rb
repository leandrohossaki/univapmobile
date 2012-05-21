class Book < ActiveRecord::Base
  belongs_to :category
  belongs_to :unit
  
  has_many :locations
  has_many :student, :through => :locations
  
  def self.find_available(book_id)
    if book_id
      return Book.find(:all,
                     :joins => "LEFT JOIN locations ON books.id = locations.book_id",
                     :conditions => ['books.unit_id = ? AND (locations.returned = ? OR locations.returned IS NULL)', book_id, false],
                     :order => "books.name")
    else
      return Book.find(:all,
                     :joins => "LEFT JOIN locations ON books.id = locations.book_id",
                     :conditions => ['(locations.returned = ? OR locations.returned IS NULL)', false],
                     :order => "books.name")
    end
  end
end