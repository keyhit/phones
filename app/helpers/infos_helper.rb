module InfosHelper
  def infos_great_header(info)
    if unit_signed_in?
      case current_unit.locale
      when 'ru'
        info.great_header_ru
      when 'en'
        info.great_header_en
      when 'uk'
        info.great_header_uk
      else
        info.great_header_uk
      end
    else
      info.great_header_uk
    end
  end

  def infos_header(info)
    if unit_signed_in?
      case current_unit.locale
      when 'ru'
        info.header_ru
      when 'en'
        info.header_en
      when 'uk'
        info.header_uk
      else
        info.header_uk
      end
    else
      info.header_uk
    end
  end

  def infos_text(info)
    if unit_signed_in?
      case current_unit.locale
      when 'ru'
        info.text_ru
      when 'en'
        info.text_en
      when 'uk'
        info.text_uk
      else
        info.text_uk
      end
    else
      info.text_uk
    end
  end

  def info_great_header(_info)
    if unit_signed_in?
      case current_unit.locale
      when 'ru'
        @info.great_header_ru
      when 'en'
        @info.great_header_en
      when 'uk'
        @info.great_header_uk
      else
        @info.great_header_uk
      end
    else
      @info.great_header_uk
    end
end

  def info_header(_info)
    if unit_signed_in?
      case current_unit.locale
      when 'ru'
        @info.header_ru
      when 'en'
        @info.header_en
      when 'uk'
        @info.header_uk
      else
        @info.header_uk
      end
    else
      @info.header_uk
    end
  end

  def info_text(_info)
    if unit_signed_in?
      case current_unit.locale
      when 'ru'
        @info.text_ru
      when 'en'
        @info.text_en
      when 'uk'
        @info.text_uk
      else
        @info.text_uk
      end
    else
      @info.text_uk
    end
  end
end
