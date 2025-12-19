# UrchinScan

A Flutter mobile application that uses TensorFlow Lite to identify sea urchin species from photos. Browse, search, and learn about 10 different sea urchin species with detailed information about their habitats, diet, distribution, and conservation status.

## Features

- **AI-Powered Image Recognition**: Uses TensorFlow Lite to classify sea urchin species from camera or gallery images
- **Confidence Scoring**: Displays classification confidence percentage for identified species
- **Species Catalog**: Browse and explore 10 sea urchin species with detailed information including:
  - Scientific names
  - Physical descriptions
  - Habitat and distribution information
  - Diet preferences
  - Conservation status
- **Search Functionality**: Search species by common or scientific name
- **Material Design**: Modern Material 3 UI with light and dark theme support
- **Multi-Platform Support**: Runs on Android, iOS, Web, macOS, Windows, and Linux

## Getting Started

### Prerequisites

- Flutter SDK (^3.10.1)
- Dart SDK
- Android Studio / Xcode (for mobile development)

### Installation

1. Clone the repository:
   ```bash
   git clone <repository-url>
   cd sea_urchin
   ```

2. Install dependencies:
   ```bash
   flutter pub get
   ```

3. Run the app:
   ```bash
   flutter run
   ```

## Project Structure

```
lib/
├── main.dart              # App entry point
├── models/               # Data models
├── providers/            # State management (Provider)
├── screens/              # UI screens
├── services/             # ML inference and image picker
└── widgets/              # Reusable widgets
```

## Dependencies

- **flutter**: UI framework
- **provider**: State management
- **tflite_flutter**: TensorFlow Lite inference
- **image_picker**: Camera and gallery access
- **google_fonts**: Custom typography
- **cached_network_image**: Image caching
- **flutter_svg**: SVG support

## Model Information

The app uses a quantized TensorFlow Lite model (`model_unquant.tflite`) trained to classify 10 sea urchin species:

1. Red Sea Urchin
2. Black Longspine Urchin
3. Collector Urchin
4. Flower Urchin
5. Double Spined Urchin
6. Shingle Urchin
7. Rock-Boring Urchin
8. Banded Urchin
9. Pencil Urchin
10. Green Urchin

## Usage

1. **Browse Species**: Scroll through the grid view to see all available sea urchin species
2. **View Details**: Tap on any species card to view detailed information
3. **Capture Photo**: Tap the camera icon in the app bar to take a photo or select from gallery
4. **View Classification**: The app will display the detected species and confidence score
5. **Search**: Tap the search icon to find species by name

## Development

### Building for Release

**Android:**
```bash
flutter build apk
```

**iOS:**
```bash
flutter build ios
```

**Web:**
```bash
flutter build web
```

### Running Tests

```bash
flutter test
```

### Code Analysis

```bash
flutter analyze
```

## License

[Add your license information here]
