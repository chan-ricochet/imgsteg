% Clear the existing workspace 
clear all; 
close all; 
% Clear the command window 
clc; 
  
% Read the input image 
input = imread('catimg.jpg'); 

% Convert image to greyscale 
input=rgb2gray(input); 

% Resize the image to required size 
input=imresize(input, [1200 1200]); 

% Message image to be embedded 
msg=imread('image.jpg');
msg=rgb2gray(msg);
size(msg)

%Converting pixel value matrix into binary bits
B = dec2bin(msg);
bin_message = reshape(B',1,numel(B)); 
bin_message=bin_message(:);
  
% Length of the binary message 
len = length(bin_message); 
  
% Converting the char array to numeric array 
bin_num_message=str2num(bin_message); 
  
% Initialize output as input 
output = input; 
  
% Get height and width for traversing through the image 
height = size(input, 1); 
width = size(input, 2); 
  
% Counter for number of embedded bits 
embed_counter = 1; 
  
% Traverse through the image 
for i = 1 : height 
    for j = 1 : width 
          
        % If more bits are remaining to embed 
        if(embed_counter <= len) 
            
            % Finding the Least Significant Bit of the current pixel 
            LSB = mod(double(input(i, j)), 2); 
             
            % Find whether the bit is same or needs to change 
            temp = double(xor(LSB, bin_num_message(embed_counter))); 
            
            % Updating the output to input + temp 
            output(i, j) = input(i, j)+temp; 
              
            % Increment the embed counter 
            embed_counter = embed_counter+1; 
        end
          
    end
end
  
% Write both the input and output images to local storage 
% Mention the path to a folder here. 
imwrite(input, 'C:\Users\chand\Desktop\testoriginalimg.png'); 
imwrite(output, 'C:\Users\chand\Desktop\teststegoimg.png'); 

%Display image before and after encoding
subplot(1,2,1), imshow(imread('C:\Users\chand\Desktop\testoriginalimg.png')); title('Original Image');
subplot(1,2,2), imshow(imread('C:\Users\chand\Desktop\teststegoimg.png')); title('Encoded Image');

%Create new excel file to store the matrix
filename = 'C:\Users\chand\Desktop\testoutput.xlsx';  
xlswrite(filename, output); 
