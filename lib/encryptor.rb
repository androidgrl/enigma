class FileParser
  def intitialize(filename)
    @filename = filename
    @message = File.read(@filename)
  end

  def file_reader
    @message
  end

end


class Encryptor
  
end
