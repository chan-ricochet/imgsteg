%Close open graph windows
close all; 
% Clear the command window 
clc; 
  
% Getting the input image   
filename = 'C:\Users\chand\Desktop\testoutput.xlsx'; 
input_image = xlsread(filename); 
  
% Get height and width for traversing through the image 
height = size(input_image, 1); 
width = size(input_image, 2); 
  
% Pixel dimensions of the embedded image 
chars = 236*236; 
  
% Number of bits in the message 
message_length = chars * 8; 
  
% counter to keep track of number of bits extracted 
counter = 1; 

%Embedded image details
m=imread('image.jpg');
height1 = size(m, 1); 
width1 = size(m, 2);
% Traverse through the image 
for i = 1 : height 
    for j = 1 : width 
          
        % If more bits remain to be extracted 
        if (counter <= message_length) 
                % Store the LSB of the pixel in extracted_bits 
                extracted_bits(counter,1) = mod(double(input_image(i, j)), 2); 
              
                % Increment the counter 
                counter = counter + 1; 
                
            
        end
    end
end

% Get all the bits in 8 columned table 
% Each row is the bits of the character  
% in the hidden text 
binMatrix = reshape(extracted_bits, 8,[]); 

%Convert binary bits to pixel values
I_out = reshape(bin2dec(num2str(binMatrix','%8d')),236,[]);

%Display embedded image
imshow(I_out,[0 255]);
title("Embedded image");
