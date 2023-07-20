module Prints

  def take_screenshots(name_file, folder)
    file = "#{folder_p}/#{name_file}.png"
    FileUtils.mkdir_p(folder) unless File.exist?
    Capybara.page.driver.browser.save.screenshot(file)
    attach(file, 'image/png')
  end

end