class Post < ActiveRecord::Base
  has_many :comments
  belongs_to :user
  belongs_to :topic

  default_scope { order ('created_at DESC')}

    validates :title, length: { minimum: 5 }, presence: true
    validates :body, length: { minimum: 20 }, presence: true
    validates :topic, presence: true
    validates :user, presence: true

<<<<<<< HEAD
  def markdown_title
    render_as_markdown title
  end

  def markdown_body
    render_as_markdown title
  end

=======
>>>>>>> 67aa8ade2fe733a2f0535a9fafe4217b510edc52
end
