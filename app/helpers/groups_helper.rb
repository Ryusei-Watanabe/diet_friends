module GroupsHelper
  def group_new_or_edit
    if action_name == 'new' || action_name == 'create'
      groups_path
    elsif action_name == 'edit' || action_name == 'update'
      group_path
    end
  end
end
