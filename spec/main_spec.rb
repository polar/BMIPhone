describe "Application 'BMIPhone'" do
  before do
    @app = UIApplication.sharedApplication
  end

  it "has one window" do
    @app.windows.size.should == 1
  end
  it "has three windows" do
    @app.windows.size.should == 3
  end
end
