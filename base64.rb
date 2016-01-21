require 'base64'
require_relative 'base_64_raw'

class Decode
	attr_reader :decode_it

	def decode_it(response)
		if response.include?("decode64")
			encoded_string = response.partition("64\(\"")[2]
			result = Base64.decode64(encoded_string)
			decode_it(result.gsub("\\n","\n"))
		else
			puts response
		end
	end
end

decoder = Decode.new
puts decoder.decode_it(Encoder.our_string)