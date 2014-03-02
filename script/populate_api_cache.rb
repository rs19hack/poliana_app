require 'net/http'

File.open("industry_times_log_parquet.tsv", 'w') do |times_log|

  Politician.all.each do |pol|

    host = 'localhost'
    port = '8080'

    path = "/politicians/#{pol.bioguide_id}/contributions/industries/?start=01-01-1990&end=01-01-2015&unit=congress"

    time_before = Time.now
    
    request = Net::HTTP::Get.new(path, initheader = { 'X-Requested-With' => "XMLHttpRequest" })
    
    http = Net::HTTP.new(host, port)
    http.read_timeout = 100000000
    http.start { |http| http.request(request) }

    time_after = Time.now
    response_time = time_after - time_before

    times_log.puts response_time.to_s
  end
end

File.open("pac_times_log_parquet.tsv", 'w') do |times_log|

  Politician.all.each do |pol|

    host = 'localhost'
    port = '8080'

    path = "/politicians/#{pol.bioguide_id}/contributions/pacs/?start=01-01-1990&end=01-01-2015&unit=congress"

    time_before = Time.now
    
    request = Net::HTTP::Get.new(path, initheader = { 'X-Requested-With' => "XMLHttpRequest" })
    
    http = Net::HTTP.new(host, port)
    http.read_timeout = 100000000
    http.start { |http| http.request(request) }

    time_after = Time.now
    response_time = time_after - time_before

    times_log.puts response_time.to_s
  end
end