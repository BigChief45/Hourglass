module EmojiHelper

  def emojify(content, options={})
    case options[:size]
    when :small
      size = '20'
    when :big
      size = '64'
    end

    h(content).to_str.gsub(/:([\w+-]+):/) do |match|
      if emoji = Emoji.find_by_alias($1)
        %(<img alt="#$1" src="#{image_path("emoji/#{emoji.image_filename}")}"
          style="vertical-align:middle" width="#{size}" height="#{size}"
          />)
      else
        match
      end
    end.html_safe if content.present?
  end

end