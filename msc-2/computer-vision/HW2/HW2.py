# -*- coding: utf-8 -*-

import cv2
import numpy as np
import matplotlib.pyplot as plt

from google.colab import files
uploaded = files.upload()

bgr_img = cv2.imread('HW2_img.jpeg', cv2.IMREAD_COLOR)
plt.imshow(bgr_img)

rgb_img = cv2.cvtColor(bgr_img, cv2.COLOR_BGR2RGB)
plt.imshow(rgb_img)

gray_img = cv2.cvtColor(bgr_img, cv2.COLOR_BGR2GRAY)
plt.imshow(gray_img, cmap=plt.cm.gray)

mean = 0
stddev = 180
noise = np.zeros(rgb_img.shape, np.uint8)
cv2.randn(noise, mean, stddev)
rgb_img_gn = cv2.add(rgb_img, noise)
plt.imshow(rgb_img_gn)

str = ["3 by 3 kernel size", "5 by 5 kernel size", "7 by 7 kernel size", "9 by 9 kernel size"]
j = 3
for i in range(0, 4):
  blur_rgb_img = cv2.blur(rgb_img_gn, (i + j, i + j))
  plt.subplot(2, 2, i + 1)
  plt.imshow(blur_rgb_img)
  plt.title(str[i])
  j = j + 1
plt.suptitle("Blurring filter")
plt.subplots_adjust(left=0.1, bottom=0.1, right=0.9, top=0.9, wspace=0.4, hspace=0.4)

str = ["3 by 3 kernel size", "5 by 5 kernel size", "7 by 7 kernel size", "9 by 9 kernel size"]
j = 3
for i in range(0, 4):
  gaussian_img = cv2.GaussianBlur(rgb_img_gn , (i + j, i + j), 0, 0)
  plt.subplot(2, 2, i + 1)
  plt.imshow(gaussian_img)
  plt.title(str[i])
  j = j + 1
plt.suptitle("Gaussian filter")
plt.subplots_adjust(left=0.1, bottom=0.1, right=0.9, top=0.9, wspace=0.4, hspace=0.4)

str = ["3 by 3 kernel size", "5 by 5 kernel size", "7 by 7 kernel size", "9 by 9 kernel size"]
j = 3
for i in range(0, 4):
  med_img = cv2.medianBlur(rgb_img_gn , i + j)
  plt.subplot(2, 2, i + 1)
  plt.imshow(med_img)
  plt.title(str[i])
  j = j + 1
plt.suptitle("Median filter")
plt.subplots_adjust(left=0.1, bottom=0.1, right=0.9, top=0.9, wspace=0.4, hspace=0.4)

# Apply an edge detection filter to the image
canny_img = cv2.Canny(rgb_img, 80, 80)
plt.subplot(1, 3, 1)
plt.imshow(canny_img)

t_lower = 50  # low threshold
t_upper = 150  # High threshold
aperture_size = 5 # Aperture size
L2Gradient = True

# Apply Canny Edge filter with L2Gradient = True
canny_img = cv2.Canny(rgb_img,  t_lower, t_upper, apertureSize = aperture_size, L2gradient = L2Gradient)
plt.subplot(1, 3, 2)
plt.imshow(canny_img)

aperture_size = 7
canny_img = cv2.Canny(rgb_img,  t_lower, t_upper, apertureSize = aperture_size, L2gradient = L2Gradient)
plt.subplot(1, 3, 3)
plt.imshow(canny_img)
