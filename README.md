# HyperSlider

**HyperSlider** is a customizable, sleek, and beautiful slider for your Flutter applications that works seamlessly across all platforms. Whether you're building an app for iOS, Android, Web, or Desktop, HyperSlider gives you a delightful user experience with a simple yet elegant design.

With **HyperSlider**, you can easily integrate image-based or custom content sliders into your app, all while enjoying smooth transitions and flexibility to customize it to your needs.

![alt text](https://raw.githubusercontent.com/jownatan/hyper_slider/refs/heads/main/image%20(1).png)
![alt text](https://raw.githubusercontent.com/jownatan/hyper_slider/refs/heads/main/image%20(2).png)

## Features

- Customizable slider with smooth animations
- Supports both remote image URLs and local images
- Elegant radius for a modern look
- Works across all platforms (iOS, Android, Web, Desktop)
- Simple to use with intuitive configuration

## Example Usage



Here is how you can implement **HyperSlider** in your Flutter application:

```dart
SizedBox(
  height: 300,
  child: HyperSlider(
    radius: 8,
    imageUrls: [
      // Put your image urls here // Credits: https://www.flaticon.com and https://www.flaticon.com/authors/vectors-market
      // These images are not the sames as the ones in the pub.dev video
      "https://cdn-icons-png.flaticon.com/128/742/742752.png",
      "https://cdn-icons-png.flaticon.com/512/743/743219.png",
      "https://cdn-icons-png.flaticon.com/128/742/742774.png",
      "https://cdn-icons-png.flaticon.com/512/743/743206.png",
      "https://cdn-icons-png.flaticon.com/512/743/743300.png"
    ],
    imageLabels: ["Confused", "Rolling Eyes", "Neutral", "Grinning", "Heart Eyes"],
    onChanged: (index) {
      print('Selected index: $index');
    },
    localImagesPath: [], // Add local images if needed
  ),
)
