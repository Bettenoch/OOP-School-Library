require 'json'

def write_data (data, filename)
    json_data = JSON.generate(data.map(&:to_h))
    File.write(filename, json_data,  mode: 'w')
end

def read_data (filename)
    if File.exist?(filename) and File.size(filename) != 0
        JSON.parse(File.read(filename))
    else
        []
    end
end