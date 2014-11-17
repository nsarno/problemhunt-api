class ProblemSerializer < ActiveModel::Serializer
  attributes :id, :description, :upvote_count, :upvoted, :upvote_id, :author?

  def author?
    User.current.problems.include? object
  end

  def upvote_count 
    object.upvotes.count
  end

  def upvoted
    object.upvotes.where(user: User.current).any?
  end

  def upvote_id
    upv = object.upvotes.where(user: User.current).first
    upv.nil? ? 0 : upv.id
  end
end
