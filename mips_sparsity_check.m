function [fraction_illegal_inst] = mips_sparsity_check(n_threads)

n_threads = str2num(n_threads)
%% Set up parallel computing
pctconfig('preservejobs', true);
mycluster = parcluster('local');
mycluster.NumWorkers = n_threads;
mypool = parpool(mycluster,n_threads);
work_per_thread = cast((2^32),'uint64')/n_threads;

% Try all possible 32-bit patterns
legal_count = zeros(n_threads,1);
parfor i=1:n_threads
    offset = (i-1)*work_per_thread;
    for j=1:work_per_thread
        bin = dec2bin(offset+j,32);
        hex = my_bin2hex(bin);
        [legal] = MyMipsDecoder(hex);
        if legal == 1
            legal_count(i) = legal_count(i)+1;
        end
    end
    display(['thread ' num2str(i) ' is done']);
end

total_legal_count = sum(legal_count);
fraction_legal_inst = total_legal_count/(2^32)

end
