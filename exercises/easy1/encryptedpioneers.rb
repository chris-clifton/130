=begin
The following list contains names of individuals who are pioneers in field of computing and have had 
significant influence on the field.  Names are encrypted using Rot13.
Write a program that deciphers and prints out each of these names.
=end

NAMES = ['Nqn Ybirynpr', 'Tenpr Ubccre', 'Nqryr Tbyqfgvar', 'Nyna Ghevat', 'Puneyrf Onoontr', 
          'Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv', 'Wbua Ngnanfbss', 'Ybvf Unvog', 'Pynhqr Funaaba',
          'Fgrir Wbof', 'Ovyy Tngrf', 'Gvz Orearef-Yrr', 'Fgrir Jbmavnx', 'Xbaenq Mhfr', 'Fve Nagbal Ubner',
          'Zneiva Zvafxl', 'Lhxvuveb Zngfhzbgb', 'Unllvz Fybavzfxv', 'Tregehqr Oynapu']

KEY = { a: 'n', b: 'o', c: 'p', d: 'q', e: 'r', f: 's', g: 't', h: 'u', i: 'v', j: 'w', k: 'x', l: 'y', m: 'z', 
        n: 'a', o: 'b', p: 'c', q: 'd', r: 'e', s: 'f', t: 'g', u: 'h', v: 'i', w: 'j', x: 'k', y: 'l', z: 'm' }

def rot13(encrypted_text)
  encrypted_text.each_char.reduce('') do |result, encrypted_char|
    result + decipher_character(encrypted_char)
  end
end

def decipher_character(encrypted_char)
  case encrypted_char
  when 'a'..'m', 'A'..'M' then (encrypted_char.ord + 13).chr
  when 'n'..'z', 'N'..'Z' then (encrypted_char.ord - 13).chr
  else                          encrypted_char
  end
end

NAMES.each do |encrypted_name|
  puts rot13(encrypted_name)
end


