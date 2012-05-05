class Email2Face
  attr_accessor :username, :password, :verbose

  def self.filepath
    "Sandvich"
  end

  CHROME_USER_AGENT = "Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/536.5 (KHTML, like Gecko) Chrome/19.0.1084.41 Safari/536.5
"

  def self.face(email, options = {}, from_thor = false)
    user = Email2Face.new
    if options["username"].nil? || options["password"].nil?
      user.load_auth_from_disk(options)
    else
      user.username = options["username"]
      user.password = options["password"]
      user.verbose  = options["verbose"]
    end
      if user.username.nil? || user.username == "" || user.password.nil? || user.password == ""
        user.no_login_details
      end
      html = user.face_html(email)
      return user.face(html)
  end

  def load_auth_from_disk(options)
    if File.exists?(Email2Face.filepath)
      json = JSON.parse(File.open(Email2Face.filepath, "r").read) 
      self.username = json["username"]
      self.password = json["password"]
      self.verbose  = options["verbose"]
    end
  end

  def no_login_details
    puts "Email2Face requires a Facebook account to search for faces. Don't use a Facebook account that matters."
    puts "Usage: Email2Face.face(email, { :username => USERNAME, :password => PASSWORD } )"
    puts "Afterwards, I'll store thlse Facebook account, so you don't have to do this everytime."
    exit(0)
  end

  def face_html(email)
    configure_capybara
    puts "Logging in..." if self.verbose
    Headless.ly do
      browser = Capybara::Session.new(:webkit, browser)
      #self.driver.header("User-Agent", CHROME_USER_AGENT)
      browser.visit  "https://www.facebook.com/login.php"
      browser.within "#loginform" do
        browser.fill_in "email", :with => self.username
        browser.fill_in "pass",  :with => self.password
        browser.click_button "Log In"
      end
      if browser.driver.cookies["c_user", ".facebook.com"]
        login_success!
        puts "Login Successful! Getting Face URL" if self.verbose
        url = "https://www.facebook.com/search/results.php?o=2048&init=s%3Aemail&q=#{ email.sub("@", "%40") }"
        browser.visit url
        return browser.html
      else
        login_failed!
      end
    end
  end

  def login_success!
    File.new(Email2Face.filepath, "w") unless File.exists?(Email2Face.filepath)
    File.open(Email2Face.filepath, "w") do |f|
      f.write(self.to_json)
    end
  end

  def to_json
    hash = Hash.new
    hash["username"] = self.username
    hash["password"] = self.password
    hash.to_json
  end

  def login_failed!
    puts "Couldn't login to Facebook. Maybe you misspelled your username or password?"
    exit(0)
  end

  def face(html)
    parser    = Nokogiri::HTML(html)
    element   = parser.xpath("//*[@id='pagelet_search_results_objects']/div/div/div/div/div[2]/div[1]/a") || parser.xpath('//*[@id="js_0"]')
    href      = element.attribute("href")
    uri       = URI.parse(href)
    uri.host  = "graph.facebook.com"
    uri.path  = uri.path + "/picture"
    uri.to_s
  rescue Exception
    "I couldn't find a face for that email :("
  end

  def configure_capybara
    Capybara.app = self
    Capybara.javascript_driver = :webkit
    Capybara.current_driver = :webkit
    Capybara.run_server = false
  end

end
