# HEIC Converter - Flutter App for iPhone Photo Conversion

This Flutter application allows you to convert HEIC images (iPhone photos) to PNG, JPG, and WEBP formats, offering a range of customization options and remembering user preferences for a seamless experience.

## Key Features

HEIC Conversion: Converts HEIC images captured on iPhones to widely-supported formats like PNG, JPG, and WEBP.
Quality Settings: Adjust the output image quality for each format (PNG is lossless, JPG and WEBP offer quality control).
Image Rotation: Rotate images before conversion to correct for incorrect orientation.
Bulk Conversion: Convert multiple images simultaneously for efficient processing.
Persistent Settings: Remembers your last-used conversion format and quality preferences for future use.
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

Use the app's interface to select HEIC images from your device's gallery. You can choose individual images or select multiple images for bulk conversion.
2. Choose Format

Select the desired output format from the available options (PNG, JPG, WEBP).
3. Adjust Settings

For JPG and WEBP formats, adjust the quality slider to control the output file size and visual quality.
Optionally, rotate the image if necessary using the provided rotation buttons.
4. Convert Images

Tap the "Convert" button to begin the conversion process.
5. Access Converted Images

The app will save the converted images to a designated location on your device, typically in a folder named "HEICConverter" or similar.
## Preferences and Settings

The app remembers your last-used conversion format and quality settings, making conversions more streamlined. You can always adjust these settings before each conversion.
## Disclaimer

Converting HEIC images to lossy formats (JPG, WEBP) may result in some quality loss depending on the chosen quality level. Experiment with the quality settings to find the right balance between file size and visual quality for your needs.
## License

This code is released under the [License Name](Link to License) license. You are free to use, modify, and distribute the code under the terms of the license.

I hope this comprehensive README file empowers you to successfully utilize your HEIC Converter project!

## Additional Notes

Consider adding a progress bar or status indicator for bulk conversions in future.
Explore implementing more advanced features like image resizing or compression options.
