class HTMLwithPygments < Redcarpet::Render::HTML

  def block_code(code, language)
    # sha = Digest::SHA1.hexdigest(code)
    # Rails.cache.fetch ["code", language, sha].join('-') do
    Pygmentize.process(code, :ruby, ['-O lineanchors=line'] )
    # end
  end

end
