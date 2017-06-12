require "csv"
require 'sunlight/congress'
require 'erb'
require 'date'

BASE_URL = "https://chart.googleapis.com/chart?cht=bvg"
EVENT_ATT = "/home/spoonable/the_odin_project/ruby_programming/Basic-Ruby/Event_manager/event_attendees.csv"
EVENT_FULL_ATT = "/home/spoonable/the_odin_project/ruby_programming/Basic-Ruby/Event_manager/full_event_attendees.csv"

def clean_zipcode(zipcode)
	zipcode.to_s.rjust(5,"0")[0..4]
end

def legislators_by_zipcode(zipcode)
  Sunlight::Congress::Legislator.by_zipcode(zipcode)
end

def save_thank_you_letters(id,form_letter)
  Dir.mkdir("output") unless Dir.exists?("output")

  filename = "output/thanks_#{id}.html"

  File.open(filename,'w') do |file|
    file.puts form_letter
  end
end

def clean_phone_numbers(number)
	#if phone num less than 10 digits bad number
	num = number.to_s.gsub(/[-()\. ]/,"")
	len_num = num.to_s.length
	if len_num < 10 then num = ""
	elsif len_num == 11 && num[0] == "1" then num = num[1..10]
	elsif len_num == 11 && num[0] != "1" then num = ""
	elsif len_num > 11 then num = ""
	else num
	end
	num
end

def registration_date(reg_date)
	DateTime.strptime(reg_date, '%m/%d/%Y %H:%M')
end

def collect_hours(hour,reg_hours)
	reg_hours[hour-1] += 10
end
puts "Event Manager Initialized!"

contents = CSV.open EVENT_ATT, headers: true, header_converters: :symbol
template_letter = File.read "form_letter.html"
erb_template = ERB.new template_letter
reg_hours = []
for i in 0..23
	reg_hours[i] = 0
end
contents.each do |row|
	id = row[0]
	name = row[:first_name]
	puts "fetching #{name} data"
	zipcode = clean_zipcode(row[:zipcode])
  phone = clean_phone_numbers(row[:homephone])
  date = registration_date(row[:reg])
  collect_hours(date.hour,reg_hours)
  legislators = legislators_by_zipcode(zipcode)

  form_letter = erb_template.result(binding)
  save_thank_you_letters(id,form_letter)

end
url_data = "chd=t:" + reg_hours.join(',')
url_lable = "chxt=x,y&chx1=0:|1|2|3|4|5|6|7|8|9|10|11|12|13|14|15|16|17|18|19|20|21|22|23|24" 
url = "#{BASE_URL}&#{url_lable}&chxt=x&#{url_data}&chs=800x300"
print "registration stats: "
puts url


# https://chart.googleapis.com/chart?cht=bvg&chxt=x,y&chx1=0:|1|2|3|4|5|6|7|8|9|10|11|12|13|14|15|16|17|18|19|20&chs=500x300

#https://chart.googleapis.com/chart?cht=bvg&chd=t:10,40,60,80&chxt=x,y&chx1=0:|1|2|3|4&chs=500x300
#https://chart.googleapis.com/chart?cht=bvg&chs=1000x900&chxt=x,y&chx1=0:|1|2|3|4|5|6|7|8|9|10|11|12|13|14|15|16|17|18|19|20|21|22|23|24&chd=t:1,0,0,0,0,0,0,0,0,1,2,0,3,0,1,3,1,1,2,2,2,0,0,0


#https://chart.googleapis.com/chart?cht=bvg&chd=t:1,0,0,0,0,0,0,0,0,1,2,0,3,0,1,3,1,1,2,2,2,0,0,0&chxt=x&chx1=0:|1|2|3|4|5|6|7|8|9|10|11|12|13|14|15|16|17|18|19|20|21|22|23|24&chs=800x300
#https://chart.googleapis.com/chart?cht=bvg&chxt=x,y&chx1=0:|1|2|3|4|5|6|7|8|9|10|11|12|13|14|15|16|17|18|19|20|21|22|23|24&chxt=x&chd=t:10,0,0,0,0,0,0,0,0,10,20,0,30,0,10,30,10,10,20,20,20,0,0,0&chs=800x300