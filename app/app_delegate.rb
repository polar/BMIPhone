class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @window.backgroundColor = UIColor.blueColor
    @window.makeKeyAndVisible
    @window.rootViewController = HelloViewController.alloc.init
    #doit
    setupLocationManager
    true
  end

  def doit
    c= CLLocation.alloc.initWithLatitude(43, longitude: -76.0)
    p c.description
    NSLog("c.coordinate: #{c.coordinate}")
    p c.coordinate  
  end



  def setupLocationManager
    puts "AppDelegate: set up LocationManager"
    BubbleWrap::Location.get(distance_filter:10, desired_accuracy: :nearest_ten_meters) do |result|
      @count == (@count || 0) + 1
      if result[:error]
        puts "Error getting Location #{result[:error]}"
      elsif result[:to]
        puts "Got Location #{result.inspect}"
        puts "Got Location #{[]}"
        puts "Got Location #{result[:to]}"
        puts "Got Location #{result[:to].coordinate.inspect}"
        puts "Got Location #{result[:to].coordinate.longitude}, #{result[:to].coordinate.latitude}"
        # loc = Platform::Location.new("Location#{@count}", result[:to].coordinate.longitude, result[:to].coordinate.latitude)
        # puts "Got Location #{loc}"
        # evd = Platform::LocationEventData.new(loc)
        # puts "Submitting #{evd}"
        # if BW::App.delegate.mainController
        #   puts "Posting to Main"
        #   BW::App.delegate.mainController.bgEvents.postEvent("LocationUpdate", evd)
        #   if @mainController.masterController
        #     puts "Posting to Master"
        #     BW::App.delegate.mainController.masterController.api.bgEvents.postEvent("LocationUpdate", evd)
        #   end
        #   puts "Posting Done"
        # end
      else
        puts "Got nothing for location #{result.inspect}"
      end
      puts "Location.get DONE"
    end
  end

  # For REPL for now
  def loc(lon,lat)
    m = BubbleWrap::Location.location_manager
    c = CLLocation.alloc.initWithLatitude(lat, longitude: lon)
    puts "Setting up #{c}"
    #puts "Setting up #{c.coordinate}"
    #puts "Setting up #{c.coordinate.latitude} #{c.coordinate.longitude}"
    BubbleWrap::Location.locationManager(m, didUpdateToLocation: c, fromLocation: @last_location)
    @last_location = c
  end
end
