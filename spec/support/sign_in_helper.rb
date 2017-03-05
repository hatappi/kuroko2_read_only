# spec/support/spec_test_helper.rb

module SignInHelper
  def sign_in
    user = Kuroko2::User.create!(name: 'test', email: 'test@example.com', uid: Digest::SHA2)
    session[:user_id] = user.id
  end
end
