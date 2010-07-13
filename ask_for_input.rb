def nubot_tester(v)
  @RESOURCE_URL='http://github.com/krumpt/voxeo_labs_tests/raw/master/dtmf/'
  return_array = Array.new

  v.to_s.split(//).each {|e|
       log "@@ NUBOT DTMF @@ #{e}.wav"
       say "#{@RESOURCE_URL+e+'.wav'}"
  }
end

answer

prompt_counter=0


wait(3000)
options = { :choices => '1,2',:repeat=>'2',:onTimeout=> lambda { |event| prompt_counter=+1; log "@"*5 +prompt_counter } }


nubot_tester('c1#{prompt_counter}')


result = ask 'Hi. For sales, press 1. For support, press 2.', options

if result.name == 'choice'
  nubot_tester('c12')

  case result.value
    when '1'
      nubot_tester('c10')
      say 'sales is not available right now.'
    when '2'
      nubot_tester('c20')
	  say 'support is currently on the other line.'
	end
end
  nubot_tester('c03')
hangup



