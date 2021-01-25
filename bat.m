clear;close all;
run('../env.m')
dataset = 'beb238';       %===change here===

block_way = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1];
%block_way = [1,1,1];
ran_alpha = [0.0001,0.0001,0.0001,0.0001];
support_list = [80];
slice_list = [10];
KQ = [0];
random_num = 1;
clusterMethod = 'single';

% % deadReckon
% % for i=1:length(support_list)
% %     for j=1:length(slice_list)
% %         supportIter = support_list(i);
% %         sliceIter = slice_list(j);
% %          for filter_num =  1: random_num
% %              deadReckon( dataset, clusterMethod, supportIter,sliceIter,filter_num,7,400,0.1,8000);
% %          end
% %     end
% % end
% %  

% prepare data--including %
% {dataset}-train.mat/{dataset}-uset-{support_len}.mat/-->for training you
% just need to build one time for trainging files!!!
% for i=1:length(support_list)
%    support_len = support_list(i);
%    data_build_golf( dataset,support_len);
% end
% 
% %train
% trainFile = sprintf('%s-train.mat', dataset);
% for i=1:length(support_list)
%     for j=1:length(slice_list)
%         supportIter = support_list(i);
%         sliceIter = slice_list(j);
%         trainUset = sprintf('%s-uset-%d.mat', dataset,supportIter);
% %         trainUgvgolf(trainFile,400,trainUset ,supportIter, sliceIter,1,[1:18], 'block', block_way, 2, []); %block
%         trainUgvgolfSep(trainFile,400,trainUset,supportIter,sliceIter,1,[]); %isgp
%     end
%  end
% 
% %pack
% for i=1:length(support_list)
%     for j=1:length(slice_list)
%         supportIter = support_list(i);
%         sliceIter = slice_list(j);
%         %����ķ�װ����isgp��mgp
% %         pack_build_golf(dataset,supportIter,sliceIter,'block',block_way,ran_alpha);  %block 
%         pack_build_isgp(dataset,supportIter,sliceIter,'single',block_way,ran_alpha);  %isgp
%     end
% end

% % % % gp-filter
for i=1:length(support_list)
    for j=1:length(slice_list)
        supportIter = support_list(i);
        sliceIter = slice_list(j);
        for filter_num = 1:random_num    
            for k = 1:length(KQ)
% % %             golfFilter(dataset,'block',supportIter,sliceIter,filter_num);
                    golfSingleFilter(dataset,supportIter,sliceIter,filter_num,7,400,0.8,8000,KQ(k));
            end
        end
    end
end
% 
% % %draw result
% for i=1:length(support_list)
%     for j=1:length(slice_list)
%         supportIter = support_list(i);
%         sliceIter = slice_list(j);
%         for filter_num = 1:random_num      %��������޸����鿴�����ĸ�?filter_num
% %             drawObs(dataset,'block',supportIter,sliceIter,filter_num);
% %             drawObs2(dataset,'single',supportIter,sliceIter,filter_num);
%             %drawObs2(dataset,'drk',supportIter,sliceIter,filter_num);
% %             drawDrk(dataset,'drk',supportIter,sliceIter,filter_num);
% %             drawResultsDrk(dataset,'drk',supportIter,sliceIter,filter_num);
%             %drawResults(dataset,'block',supportIter,sliceIter,filter_num);
%             drawResults(dataset,'single',supportIter,sliceIter,filter_num);
%             %drawTraj(dataset,'block',supportIter,sliceIter,filter_num);
%         end
%     end
% end

