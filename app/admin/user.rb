ActiveAdmin.register User do
  # This determines which attributes of the User model will be displayed in the index page. I have left only username, but feel free to uncomment the rest of the lines or add any other of the User attributes.
  index do
    column :username
    # column :current_sign_in_at
    # column :last_sign_in_at
    # column :sign_in_count
    default_actions
  end

  # Default is :email, but we need to replace this with :username
  filter :username

  # This is the form for creating a new user using the Admin backend. If you have added additional attributes to the User model, you need to include them here.
  form do |f|
    f.inputs "User Details" do
      f.input :username
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end

  # This is related to Rails 4 and the changes it introduced in handling strong parameters. Here we replace :email with :username.
  controller do
    def permitted_params
      params.permit user: [:username, :password, :password_confirmation]
    end
  end
end
