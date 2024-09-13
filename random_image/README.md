# random_image

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
IN this flutter project our task is to show some random image on the screen an when we click the next button on the app a new image is fetched from the api https://picsum.photos/400/300?random=${DateTime.now().millisecondsSinceEpoch} it is a simple project the api does not require a api key to function 
when we press the next key the fetchnewimage gets tiggered and fetchs new image and we are fetch it from the net we use image.network to show it 