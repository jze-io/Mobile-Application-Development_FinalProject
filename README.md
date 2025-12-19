# UrchinScan

UrchinScan is a Flutter mobile application that uses **TensorFlow Lite** to identify sea urchin species from photos. Users can browse, search, and learn about **10 different sea urchin species**, with detailed information about their habitats, diet, distribution, and conservation status.

---

## 📽 App Presentation Video

Watch the full app presentation here:

👉 [https://youtu.be/cFxYHD9APh0](https://youtu.be/cFxYHD9APh0)

---

## ✨ Features

* **AI-Powered Image Recognition**
  Uses TensorFlow Lite to classify sea urchin species from camera or gallery images.

* **Confidence Scoring**
  Displays a confidence percentage for each classification result.

* **Species Catalog**
  Browse and explore 10 sea urchin species with detailed information, including:

  * Scientific names
  * Physical descriptions
  * Habitat and distribution
  * Diet preferences
  * Conservation status

* **Search Functionality**
  Search species by common name or scientific name.

* **Material Design**
  Modern Material 3 UI with light and dark theme support.

* **Multi-Platform Support**
  Runs on Android, iOS, Web, macOS, Windows, and Linux.

---

## 🚀 Getting Started

### Prerequisites

* Flutter SDK `^3.10.1`
* Dart SDK
* Android Studio or Xcode (for mobile development)

---

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

---

## 📁 Project Structure

```
lib/
├── main.dart              # App entry point
├── models/               # Data models
├── providers/            # State management (Provider)
├── screens/              # UI screens
├── services/             # ML inference and image picker
└── widgets/              # Reusable widgets
```

---

## 📦 Dependencies

* **flutter** – UI framework
* **provider** – State management
* **tflite_flutter** – TensorFlow Lite inference
* **image_picker** – Camera and gallery access
* **google_fonts** – Custom typography
* **cached_network_image** – Image caching
* **flutter_svg** – SVG support

---

## 🧠 Model Information

The app uses a quantized TensorFlow Lite model (`model_unquant.tflite`) trained to classify the following **10 sea urchin species**:

1. Red Sea Urchin
2. Black Longspine Urchin
3. Collector Urchin
4. Flower Urchin
5. Double-Spined Urchin
6. Shingle Urchin
7. Rock-Boring Urchin
8. Banded Urchin
9. Pencil Urchin
10. Green Urchin

---

## 📱 Usage

* **Browse Species**
  Scroll through the grid view to see all available sea urchin species.

* **View Details**
  Tap on a species card to view detailed information.

* **Capture Photo**
  Tap the camera icon to take a photo or select one from the gallery.

* **View Classification**
  The app displays the detected species along with its confidence score.

* **Search**
  Use the search icon to quickly find species by name.

---

## 📌 License

This project is for educational and research purposes. License details can be added here.

---

## 🙌 Acknowledgements

* Flutter & Dart Team
* TensorFlow Lite
* Google Material Design

