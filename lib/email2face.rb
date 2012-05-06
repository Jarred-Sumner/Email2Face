require 'capybara/dsl'
require 'capybara-webkit'
require 'headless'

FAKE_FACEBOOK_USERNAME = "anmail@email2face.net"
FAKE_FACEBOOK_PASSWORD = "thisisapassword"

class Email2Face
  # This is why you should make a fake Facebook account.
  @@username = FAKE_FACEBOOK_USERNAME
  @@password = FAKE_FACEBOOK_PASSWORD
  Email2Face.configure_capybara

  def self.username
    @@username
  end

  def self.username=(username)
    @@username = username
  end

  def self.password
    @@password
  end

  def self.password=(password)
    @@password = password
  end

  def self.face(email)
    if @@username == FAKE_FACEBOOK_USERNAME
      no_login_details(email)
    end
    html = face_html(email)
    get_face(html)
  end

  def self.no_login_details(email)
    puts "You didn't specify a Facebook account, so I set you up with the default fake Facebook account. It might not work for long."
  end

  def self.face_html(email)
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
        url = "https://www.facebook.com/search/results.php?o=2048&init=s%3Aemail&q=#{ email.sub("@", "%40") }"
        browser.visit url
        return browser.html
      else
        login_failed!
      end
    end
  end

  def self.login_failed!
    "Couldn't login to Facebook. Maybe you misspelled your username or password?"
  end

  def self.get_face(html)
    parser    = Nokogiri::HTML(html)
    element   = parser.xpath("//*[@id='pagelet_search_results_objects']/div/div/div/div/div[2]/div[1]/a") || parser.xpath('//*[@id="js_0"]')
    href      = element.attribute("href")
    uri       = URI.parse(href)
    uri.host  = "graph.facebook.com"
    uri.path  = uri.path + "/picture"
    raise if uri.path.include?("profile.php")
    uri.to_s
  rescue
    "I couldn't find a face for that email :("
  end

  def self.configure_capybara
    Capybara.app = self
    Capybara.javascript_driver = :webkit
    Capybara.current_driver = :webkit
    Capybara.run_server = false
  end

end
