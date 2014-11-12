class HelloViewController < UIViewController
  def loadView
    self.view = UIImageView.alloc.init
  end

  def viewDidLoad
    view.backgroundColor = UIColor.lightGrayColor
    @label = makeLabel
    view.addSubview(@label)
  end

  def makeLabel
    label = UILabel.alloc.initWithFrame([[10, 60], [300, 80]])
    label.text = "Hello Polar"
    label.textColor = UIColor.darkGrayColor
    label.font = UIFont.boldSystemFontOfSize(25)
    label.textAlignment = UITextAlignmentCenter
    label
  end
end