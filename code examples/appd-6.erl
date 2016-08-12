% Bin is a list of three integers encoded with 8, 8 and 3 bits
Bin = <<16:8, 1:8, 1:3>>. % -> <<16,1,1:3>>
% BinList is a list of three integers encoded with 8 bits
BinList = <<16:8,2,1>>. % -> <<16,2,1>>
binary_to_list(BinList). % -> [16,2,1]
