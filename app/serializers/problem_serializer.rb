class ProblemSerializer < ActiveModel::Serializer
  attributes :id, :description, :upvotes_count, :upvoted?, :upvote_id, :author?

  def author?
    User.current.problems.include? object
  end

  def upvotes_count 
    object.upvotes.count
  end

  def upvoted?
    object.upvotes.where(user: User.current).any?
  end

  def upvote_id
    return 0 unless upvoted?
    object.upvotes.where(user: User.current).first.id
  end

  def attributes
    data = super
    data[:upvote_id] = object.upvotes.where(user: User.current).first.id if upvoted?
    data
  end
end
