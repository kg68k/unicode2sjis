import codecs

def unicode_to_sjis():
    converter = codecs.getencoder('shift_jis')

    for codepoint in range(0x0080, 0xffff+1):
        try:
            unicode_char = chr(codepoint)
            shift_jis_bytes, _ = converter(unicode_char)
            shift_jis_code = shift_jis_bytes.hex()

            if shift_jis_code == "00":
                continue

            print(f"{codepoint:04x} {shift_jis_code.zfill(4)}")
        except UnicodeEncodeError:
            continue

unicode_to_sjis()
