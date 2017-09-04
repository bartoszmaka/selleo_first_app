describe Post do
  before(:each) do
    @user = FactoryGirl.create(:user)
    @post = FactoryGirl.create(:post, owner: @user)
  end

  subject { @post }

  it { should respond_to(:owner) }

  it '#owner returns associated user' do
    expect(@post.owner).to eq(@user)
  end
end
