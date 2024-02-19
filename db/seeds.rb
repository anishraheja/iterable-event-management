%w[firstuser@gmail.com seconduser@gmail.com].each do |email|
  User.create(email: email, password: 'Password')
end
