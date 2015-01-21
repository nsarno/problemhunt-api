class ProblemSerializer < ActiveModel::Serializer
  attributes :id, :description, :upvotes_count, :upvoted?, :upvote_id, :author?

  def author?
    object.user == scope
  end

  def upvotes_count
    object.upvotes.count
  end

  def upvoted?
    object.upvotes.where(user: scope).any?
  end

  def upvote_id
    return 0 unless upvoted?
    object.upvotes.where(user: scope).first.id
  end
end
