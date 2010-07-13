def sequencer(v)

  @RESOURCE_URL='http://github.com/krumpt/voxeo_labs_tests/raw/master/dtmf/'
  return_array = Array.new

  v.to_s.split(//).each {|e|
       say "#{@RESOURCE_URL+e+'.wav'}"
  }
  return return_array
end

answer
wait(300)
options = { :choices => '1,2' }

#########################
#   TEST HARNESS CODE   #
#########################

sequencer('c11')
#.each{|url|say "#{url}"}

#########################
# END TEST HARNESS CODE #
#########################

result = ask 'Hi. For sales, press 1. For support, press 2.', options

if result.name == 'choice'
  sequencer('c111').each{|url|say '#{url}'}

  case result.value
    when '1'
      sequencer('c10').each{|url|say "#{url}"}
      say 'sales is not available right now.'
    when '2'
      sequencer('c20').each{|url|say "#{url}"}
	  say 'support is currently on the other line.'
	end
end
  sequencer('c03').each{|url|say "#{url}"}
hangup



