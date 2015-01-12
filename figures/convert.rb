# usage: ruby convert.rb hbi_5panel.pdf 550 makes a 550px-wide png image
#
file = ARGV[0]
size = ARGV[1]                  # size in pixels of final image

outfile = file[0..-5] + '.png'

cmd = "pdfinfo #{file} | awk '/Page size/{ print $3 }'"
width = %x[ #{cmd} ]
width = width.to_f / 72

puts "#{file} is #{width} inches wide"

gs_res = (size.to_i / width)          # pixels/in

gs_opt = '-dGraphicsAlphaBits=4 -dTextAlphaBits=4 -dSAFER -dBATCH -dNOPAUSE -sDEVICE=pngalpha'
puts gs_res

gs_cmd = "gs -r#{gs_res} #{gs_opt} -sOutputFile=#{outfile} #{file}"

system(gs_cmd)
