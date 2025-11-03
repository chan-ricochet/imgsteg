# Image Steganography using Matlab

This project aims at embedding a secret image within an image using LSB Steganography.

It includes the codebase for both encoding and decoding a text message within an image in MATLAB. The message is encoded through LSB stegonography that essentially converts the string message into binary bits and encodes it in the last significant bit of the pixel information. Since the pixels consist of the color values (R, G, B) and is an 8-bit number ranging from 0 to 255, the rightmost bit in the binary representation of the pixel's colour value is utilised to record the message.

____________

#Advantages:

Simple and Fast: The LSB algorithm is relatively easy to implement

High Capacity: It can hide a large amount of data, especially in images with high color depth

Visual Imperceptibility: The changes made to the pixels are often so small that they are not noticeable to the human eye, making the hidden information difficult to detect visually

#Disadvantages:

The data is easily corrupted or destroyed if the image is compressed using methods like JPEG, which can alter the LSBs
