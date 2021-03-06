function seq = load_video_info(base_path,video_path)

ground_truth = dlmread([base_path video_path '/groundtruth_rect.txt']);
seq.video = video_path;
seq.format = 'otb';
seq.len = size(ground_truth, 1);
seq.init_rect = ground_truth(1,:);
seq.ground_truth = ground_truth;

img_path = [base_path video_path '/img/'];

if exist([img_path num2str(1, '%04i.png')], 'file')
    img_files = num2str((1:seq.len)', [img_path '%04i.png']);
elseif exist([img_path num2str(1, '%04i.jpg')], 'file')
    img_files = num2str((1:seq.len)', [img_path '%04i.jpg']);
elseif exist([img_path num2str(1, '%04i.bmp')], 'file')
    img_files = num2str((1:seq.len)', [img_path '%04i.bmp']);
else
    error('No image files to load.')
end

seq.s_frames = cellstr(img_files);

end

