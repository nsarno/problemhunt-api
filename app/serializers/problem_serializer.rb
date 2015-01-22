class ProblemSerializer < ActiveModel::Serializer
  attributes :id, :description, :upvotes_count, :upvoted?, :upvote_id, :author?

  def author?
    object.created_by? scope
  end

  def upvotes_count
    object.upvotes.length
  end

  def upvoted?
    object.upvoted_by? scope
  end

  def upvote_id
    upvoted? ? object.upvote_for(scope).id : 0
  end
end
