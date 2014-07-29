class Post < ActiveRecord::Base
  has_many :comment, dependent: :destroy
  belongs_to :user
  belongs_to :topic
  has_many :votes, dependent: :destroy

  default_scope { order ('created_at DESC')}

    validates :title, length: { minimum: 5 }, presence: true
    validates :body, length: { minimum: 20 }, presence: true
    


  def markdown_title
    render_as_markdown title
  end

  def markdown_body
    render_as_markdown title
  end

  mount_uploader :image, ImageUpLoader

  def up_votes
    votes.where(value: 1).count
  end

  def down_votes
    votes.where(value: -1).count
  end

  def points
    votes.sum(:value).to_i
  end

  
  end

  # def update_rank
  #   age = (created_at - Time.new(1970,1,1)) / (60 * 60 * 24) # 1 day in seconds
  #   new_rank = points + age
 
  #   update_attribute(:rank, new_rank)
  # end



