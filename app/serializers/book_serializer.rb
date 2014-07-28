class BookSerializer < ActiveModel::Serializer
  attributes :id, :title, :author, :url

  def url 
    book_path(object)
  end
end
