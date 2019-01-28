20.times do 
  @user = User.create! name: "zekiptg"
  3.times do
    @user.posts.create! title: "happy"
  end
end