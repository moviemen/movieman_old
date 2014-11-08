require 'mechanize'

namespace :populate do

  SERIES_PAGE = 'http://fs.to/video/serials/'

  def parse
    mechanize = Mechanize.new
    page = 1
    parse_page mechanize, page
    puts 'THE END.'
  end

  def parse_page agent, page_num
    page = agent.get( SERIES_PAGE + "?page=#{page_num}" )
    
    serials_list = page.search('.b-section-list') 
    return true if serials_list.text.include?('Таких материалов не найдено')

    serials_list.search('.b-section-list .b-poster-tile').each do |serial|
      s_url  = serial.search('.b-poster-tile__link').attr('href').value
      s_name = serial.search('.b-poster-tile__title-full').text.gsub(/\t/, '').gsub(/\n/, '')
      puts "name: #{s_name}"
      puts "url:  http://fs.to#{s_url}"
      User.first.episodes << Episode.new(name: s_name, url: "http://fs.to#{s_url}")
    end
    puts '-------------------------------------'
    puts "PAGE: #{page_num+1}"
    puts '-------------------------------------'
    parse_page agent, (page_num+1)     
  end

  desc "parse episodes into database"
  task episodes: :environment do
    parse
  end

end