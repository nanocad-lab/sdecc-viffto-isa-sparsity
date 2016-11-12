function [fraction_illegal_inst] = rv64g_sparsity_check()

if ~isdeployed
    addpath ecc common rv64g % Add sub-folders to MATLAB search paths for calling other functions we wrote
end

% Try all possible 32-bit patterns
legal_count = 0;
for i=0:2^32-1
    bin = dec2bin(i,32);
    hex = my_bin2hex(bin);
    [~, legal] = parse_rv64g_decoder_output(hex);
    if legal == 1
        legal_count = legal_count+1;
    end
end

fraction_illegal_inst = legal_count/(2^32)

end
