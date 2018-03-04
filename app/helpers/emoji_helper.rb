module EmojiHelper

  def emojify(content, options={})
    case options[:size]
    when :small
      size = '20'
    when :big
      size = '42'
    end

    h(content).to_str.gsub(/:([\w+-]+):/) do |match|
      if emoji = Emoji.find_by_alias($1)
        # From sprockets-rails 3.2.0, an error occurs if asset does not exist
        # in asset pipeline. If want to use helper method without asset
        # pipeline, need to specify the skip_pipeline option.
        # See: https://github.com/rails/rails/issues/29535
        %(<img alt="#$1" src="#{image_path("emoji/#{emoji.image_filename}", skip_pipeline: true)}"
          style="vertical-align:middle" width="#{size}" height="#{size}"
          />)
      else
        match
      end
    end.html_safe if content.present?
  end

end