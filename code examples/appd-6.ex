# b1 is a list of three integers encoded with 8, 8 and 3 bits
b1 = <<16::size(8), 1::size(8), 1::size(3)>> # -> <<16,1,1:3>>
# binlist is a list of three integers encoded with 8 bits
binlist = <<16::size(8),2,1>> # -> <<16,2,1>>
to_char_list(binlist) # -> [16,2,1]
