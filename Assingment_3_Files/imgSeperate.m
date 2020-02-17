function [] = imgSeperate(Image)
% this function was used to seperated a uint8 image

for i = 1:8 %seperate bit plane
    Img_b = getPlane(Image,i); %the i th bit plane seperation
    subplot(2,4,i); %plot
    imshow(Img_b);
    title(['Bit Plane',num2str(i)]);%legend
end
end

