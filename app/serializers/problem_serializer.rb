class ProblemSerializer < ActiveModel::Serializer
  attributes :id, :description, :upvote_count, :upvoted, :upvote_id

  delegate :current_user, to: :scope

  def upvote_count 
    object.upvotes.count
  end

  def upvoted
    object.upvotes.where(user: current_user).any?
  end

  def upvote_id
    upv = object.upvotes.where(user: current_user).first
    upv.nil? ? 0 : upv.id
  end
end
