module DiariesHelper
  def choose_new_or_edit
    if action_name == 'new' || action_name == 'create'
      diaries_path
    elsif action_name == 'edit' || action_name == 'update'
      diary_path
    end
  end
end
