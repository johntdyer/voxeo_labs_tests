prompt_counter=0

def nubot_dtmf(v)
  @RESOURCE_URL='http://github.com/krumpt/voxeo_labs_tests/raw/master/dtmf/'
  v.to_s.split(//).each {|e|
       log "@@ NUBOT DTMF @@ #{e}.wav"
       say "#{@RESOURCE_URL+e+'.wav'}"
  }
end



answer

nubot_dtmf("a1#{prompt_counter.to_s}")

wait(3000)

options = {
        :choices => '1,2',
        :repeat=>'2',
        :timeout=>2,
        :onTimeout=> lambda {
                |event| prompt_counter+=1;nubot_dtmf("a1#{prompt_counter.to_s}")
        }
      }


result = ask 'Hi. For sales, press 1. For support, press 2.', options

if result.name == 'choice'
  nubot_dtmf('b12')

  case result.value
    when '1'
      nubot_dtmf('c10')
      say 'sales is not available right now.'
    when '2'
      nubot_dtmf('c20')
	  say 'support is currently on the other line.'
	end
end
  nubot_dtmf('c03')
hangup



