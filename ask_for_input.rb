def nubot_tester(v)
  @RESOURCE_URL='http://github.com/krumpt/voxeo_labs_tests/raw/master/dtmf/'
  return_array = Array.new

  v.to_s.split(//).each {|e|
       say "#{@RESOURCE_URL+e+'.wav'}"
  }
  return return_array
end

answer
wait(3000)
options = { :choices => '1,2' }


nubot_tester('c11')


result = ask 'Hi. For sales, press 1. For support, press 2.', options

if result.name == 'choice'
  nubot_tester('c11')

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



