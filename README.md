# HEIC Converter - Feature-Rich App for iPhone Photo Conversion

This feature-rich Flutter application allows you to effortlessly convert HEIC images (iPhone photos) to widely-supported formats like PNG, JPG, and WEBP, offering a range of customization options, remembering user preferences, and supporting automatic image size handling, multi-photo conversion, auto-correction for rotation, and metadata preservation.

## Key Features

HEIC Conversion: Convert HEIC images to PNG, JPG, and WEBP formats.
Quality Settings: Adjust output image quality for JPG and WEBP (PNG is lossless).
Image Rotation:
Auto-Correction: Automatically detect and correct image orientation.
Manual Rotation Buttons: Rotate images manually if needed.
Bulk Conversion: Convert up to two HEIC images simultaneously for efficiency.
Persistent Settings: Remembers your last-used conversion format, quality settings, and height/width preferences.
Automatic Height/Width: Choose "Auto" for height and width, and the app will calculate appropriate dimensions based on the original image.
Metadata Preservation: Keep EXIF data (metadata) embedded within the converted images (if available in the original HEIC).
Android Only: This application is currently built for Android devices.
## Getting Started

1. Prerequisites

Android device with Android Studio or a Flutter development environment (https://docs.flutter.dev/get-started/install)
Basic knowledge of Flutter and Dart development
2. Project Setup

Clone or download this repository to your local machine.
Navigate to the project directory in your terminal.
Run flutter pub get to install the required dependencies.
## Running the App

- Download Pre-built Releases:

You can download pre-built release versions of the app for your Android device:

- **Release 1 (latest):** [Link to Release 1]
- **Release 2 (optional, specify version details):** [Link to Release 2] (if applicable)
Build and Run from Source:

Connect your Android device to your computer or use an emulator.
Run flutter run to build and deploy the app to your device.

## Using the App

1. Select Images

Use the app's interface to select HEIC images from your device's gallery. You can choose up to two images for simultaneous conversion.
2. Choose Format

Select the desired output format from the available options (PNG, JPG, WEBP).
3. Adjust Settings

For JPG and WEBP formats, adjust the quality slider to control the output file size and visual quality.
Optionally, disable auto-correction if you want to manually rotate images.
Choose "Auto" for height and width, or enter specific dimensions if needed.
4. Convert Images

Tap the "Convert" button to begin the conversion process.
5. Access Converted Images

The app will save the converted images to a designated location on your device, typically in a folder named "HEICConverter" or similar, preserving the metadata (if available).
## Preferences and Settings

The app remembers your last-used conversion format, quality settings, height/width preferences (if not set to "Auto"), and auto-correction preference for future use. You can always adjust these settings before each conversion.
## Disclaimer

Converting HEIC images to lossy formats (JPG, WEBP) may result in some quality loss depending on the chosen quality level. Experiment with the quality settings to find the right balance between file size and visual quality for your needs.
## License

This code is released under the [License Name](Link to License) license. You are free to use, modify, and distribute the code under the terms of the license.

## App UI photos 
![Screenshot_20240508-193402](https://github.com/R3MadLabs/HEIC/assets/93861763/89283b25-e49d-425f-ac43-7fe2abae808e)
![Screenshot_20240508-193018](https://github.com/R3MadLabs/HEIC/assets/93861763/fcd64733-93dc-4827-958c-a3e1065d04ff)
![Screenshot_20240508-193140](https://github.com/R3MadLabs/HEIC/assets/93861763/5dda9c4a-9b32-40a6-9eee-4c3de17f3759)
![Screenshot_20240508-193052](https://github.com/R3MadLabs/HEIC/assets/93861763/8a08b539-90c0-409f-a3f2-24b40430c90f)

## Converted photo in three different format 
![img_8734 jpeg](https://github.com/R3MadLabs/HEIC/assets/93861763/1e28df8f-9ae6-4b78-a38b-015cbe3cf880)
![img_1948](https://github.com/R3MadLabs/HEIC/assets/93861763/2637bd5b-b8f3-4309-8be7-8e10c5df809e)

Consider adding a progress bar or status indicator for bulk conversions.
Explore implementing more advanced features like image resizing or compression options.
Provide clear instructions within the app's interface to guide users through the conversion process.
I hope this comprehensive README file empowers you to experience the ease and convenience of using your HEIC Converter app!
