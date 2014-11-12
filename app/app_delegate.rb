class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @window.backgroundColor = UIColor.blueColor
    @window.makeKeyAndVisible
    @window.rootViewController = HelloViewController.alloc.init
    true
  end
  def doit
    c= CLLocation.alloc.initWithLatitude(43, longitude: -76.0)
    p c.description
    p c.coordinate  
  end
end
