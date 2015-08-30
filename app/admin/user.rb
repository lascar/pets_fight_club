ActiveAdmin.register User do
  permit_params :email, :password, :password_confirmation

  after_create do |user|
    puts '#######################################'
    puts 'user : ' + user.to_s
    puts '#######################################'
    UserMailer.welcome_email(user).deliver_later
  end

  index do
    selectable_column
    id_column
    column :email
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    actions
  end

  filter :email
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.inputs "Admin Details" do
      f.input :email
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end

end
