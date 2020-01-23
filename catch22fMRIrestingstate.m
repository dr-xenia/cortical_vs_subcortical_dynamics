%% CATCH 22 fMRI resting state data
% function called by catch22_corticalsubcortical.m main script to compute catch 22
% on fMRI data from HCP.

function catch22fMRIrestingstate(fn, result_dir)


result = cell(23,size(fn,1));
metrics = cell(22,size(fn,1));

% all 22 features on each channel
parfor node = 1 : size(fn, 1)
    disp(node)
    [v, l] = catch22_all(fn(node , :)');
    result(:, node) = [node; num2cell(v)];
    metrics(:, node) = l';
end

results = [[{'Catch22metrics'}; metrics(:,1)], result];

[~, filename, ~] = fileparts(result_dir);

% save
mkdir(result_dir)
cd(result_dir)

% save 2 .mat file
mat2save = fullfile(result_dir, [filename '_catch22.mat']);
mat_mess = ['Saving ' filename '.mat']; disp(mat_mess)
save(mat2save, 'results')

% save 2 .txt file
result_tab = array2table(results(2:end,2:end));
col_names = cell(1, size(fn,1));

for i = 1 : size(fn,1)
    tmp_name = fullfile(['node n. ', num2str(i)]);
    col_names(i) = {tmp_name};
end

result_tab.Properties.VariableNames = col_names;
r_names = results(2:end, 1);
result_tab.Properties.RowNames = r_names;

txt2save = fullfile(result_dir, [filename '_catch22.txt']);
txt_mess = ['Saving ' filename '.txt']; disp(txt_mess)

writetable(result_tab, txt2save, 'WriteVariableNames', ...
    true, 'WriteRowNames', true)

end
