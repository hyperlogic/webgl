desc 'copy shaders into index.html'

def read_lines filename
  f = open filename, "r"
  str = f.read
  f.close
  str.split "\n"
end

task :shaders do
  # read in index.html into an array of strings
  index_lines = read_lines "index.html"

  # find the shader section in index.html
  shader_section_start, shader_section_stop = [0, 0]
  index_lines.each_with_index do |line, i|
    if line =~ /\s*<!-- SHADER_SECTION_START -->/
      shader_section_start = i
    elsif line =~ /\s*<!-- SHADER_SECTION_STOP -->/
      shader_section_stop = i
      break
    end
  end

  if shader_section_start == 0 && shader_section_stop == 0
    STDERR.print "Could not find shader section in index.html, aborting\n"
    exit
  end

  shader_section = []

  # scan all vertex shaders and append them to shader_section
  Dir.glob('shaders/*.vsh') do |filename|
    lines = read_lines filename
    shader_section.push "<script type=\"x-shader/x-vertex\" id=\"#{filename}\">"
    shader_section.concat lines
    shader_section.push "</script>"
  end

  # scan all fragment shaders and append them to shader_section
  Dir.glob('shaders/*.fsh') do |filename|
    lines = read_lines filename
    shader_section.push "<script type=\"x-shader/x-fragment\" id=\"#{filename}\">"
    shader_section.concat lines
    shader_section.push "</script>"
  end

  # write index.html back out.
  output_lines = index_lines[0, shader_section_start + 1]
  output_lines += shader_section
  output_lines += index_lines[shader_section_stop, index_lines.size]
  open "index.html", "w" do |f|
    f.write output_lines.join("\n")
    f.write "\n"
  end
end

task :default => [:shaders]
