module RelationshipsHelper
  def logged_in?
    current_user.present?
  end
end
