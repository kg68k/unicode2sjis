def unicode_to_sjis
  converter = Encoding::Converter.new('UTF-8', 'Shift_JIS', invalid: :replace, undef: :replace, replace: '')

  (0x0080..0xffff).each do |codepoint|
    unicode_char = [codepoint].pack('U')

    sjis_char = converter.convert(unicode_char)
    next if sjis_char.empty?

    sjis_code = sjis_char.unpack1('H*')

    puts "#{codepoint.to_s(16).rjust(4, '0')} #{sjis_code.rjust(4, '0')}"
  end
end

unicode_to_sjis
