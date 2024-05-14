#!/usr/bin/env ruby

require 'tanakai'
require "uri"

class Spider < Tanakai::Base
    @name = "so_spread_spider"
    @engine = :selenium_chrome
    @start_urls = ["https://stackoverflow.com"]
    @config = {
      user_agent: "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36",
      before_request: { delay: 4..7 }
    }

    def parse(response, url:, data: {})
        browser.find("//*[@data-gps-track='login.click']").click
        browser.find("//*[@id='email']").fill_in with: ENV['SO_EMAIL']
        browser.find("//*[@id='password']").fill_in with: ENV['SO_PASSWORD']

        browser.current_window.resize_to(1_200, 800)
        browser.click_button("//*[@id='submit-button']")

        found_avatar = browser.has_css?(".s-avatar--image")
        browser.click_on "Accept all cookies"
        puts brower.text
        puts found_avatar ? "Successfully logged in to Stackoverflow today!" : "Unable to Login today"
    end
end

unless ENV["SO_EMAIL"].is_a?(String) && ENV["SO_EMAIL"].size > 0
    puts "Set the stackoverflow email with the env variable SO_EMAIL"
    exit(-1)
end

unless ENV["SO_PASSWORD"].is_a?(String) && ENV["SO_PASSWORD"].size > 0
    puts "Set the stackoverflow email with the env variable SO_PASSWORD"
    exit(-1)
end

Spider.crawl!
