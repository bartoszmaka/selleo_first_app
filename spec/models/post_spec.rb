describe Comment do
  before(:each) do
    @user = FactoryGirl.create(:user)
    @post = FactoryGirl.create(:post, owner: @user)
    @comment = FactoryGirl.create(:comment, post: @post, owner: @user)
  end

  subject { @comment }

  it { should respond_to(:owner) }

  it '#owner returns associated user' do
    expect(@comment.owner).to eq(@user)
  end
end
