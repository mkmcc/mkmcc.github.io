# want 600 px images from 11 in pdfs.
res = 600.0 / 11.0

files = Dir.glob("*.pdf")

files.each do |file|
  base = file.chomp(".pdf")
  cmd = "gs -q -sDEVICE=pngalpha -sBATCH -dSAFER -sNOPAUSE "
  cmd += "-r#{res} "
  cmd += "-sOutputFile=#{base}.png #{base}.pdf"
  system cmd
end
