function Localfeat = extractLocalFeature(im)
 I1 = im(1:round(end/3) , 1:round(end/3));
 I2 = im(1:round(end/3) , round(end/3+1):round(end*2/3));
 I3 = im(1:round(end/3) , round(end*2/3+1):end);
 I4 = im(round(end/3+1):round(end*2/3) , 1:round(end/3));
 I5 = im(round(end/3+1):round(end*2/3) , round(end/3+1):round(end*2/3));
 I6 = im(round(end/3+1):round(end*2/3) , round(end*2/3+1):end);
 I7 = im(round(end*2/3+1):end , 1:round(end/3));
 I8 = im(round(end*2/3+1):end , round(end/3+1):round(end*2/3));
 I9 = im(round(end*2/3+1):end , round(end*2/3+1):end);

 Localfeat = [histExtract(I1),histExtract(I2),histExtract(I3),histExtract(I4),...
              histExtract(I5),histExtract(I6),histExtract(I7),histExtract(I8),histExtract(I9)];
end

% Histogram Extract Feature
function feature = histExtract(im)
  [feature center] = hist(im(:),4);
end
