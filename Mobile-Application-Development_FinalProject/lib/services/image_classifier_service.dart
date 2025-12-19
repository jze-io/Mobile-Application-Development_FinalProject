import 'dart:io';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/services.dart';
import 'package:tflite_flutter/tflite_flutter.dart';
import 'package:image/image.dart' as img;

class ImageClassifierService {
  static const String modelPath = 'assets/model_unquant.tflite';
  static const String labelsPath = 'assets/labels.txt';

  bool _isModelLoaded = false;
  List<String> _labels = [];
  late Interpreter _interpreter;

  Future<void> loadModel() async {
    try {
      _interpreter = await Interpreter.fromAsset(modelPath);

      final labelContent = await rootBundle.loadString(labelsPath);
      _labels = labelContent.split('\n').where((line) => line.isNotEmpty).toList();

      _isModelLoaded = true;
    } catch (e) {
      debugPrint('Error loading model: $e');
      rethrow;
    }
  }

  Future<Map<String, dynamic>?> classifyImage(XFile image) async {
    if (!_isModelLoaded) {
      await loadModel();
    }

    try {
      final imageData = await File(image.path).readAsBytes();
      final decodedImage = img.decodeImage(imageData);
      
      if (decodedImage == null) {
        debugPrint('Failed to decode image');
        return null;
      }

      final resized = img.copyResize(decodedImage, width: 224, height: 224);
      final input = _convertImageToByteList(resized);
      
      var output = [List<double>.filled(_labels.length, 0)];
      _interpreter.run(input, output);
      
      final predictions = output[0] as List<double>;
      final maxConfidence = predictions.reduce(max);
      final topIndex = predictions.indexOf(maxConfidence);

      debugPrint('Labels loaded: ${_labels.length}');
      debugPrint('Max confidence: $maxConfidence');
      debugPrint('Top index: $topIndex');
      debugPrint('Detected label: ${_labels[topIndex]}');

      if (topIndex >= _labels.length) return null;

      final confidencePercent = (maxConfidence * 100).toStringAsFixed(2);
      
      return {
        'label': _labels[topIndex],
        'confidence': confidencePercent,
        'imagePath': image.path,
      };
    } catch (e) {
      debugPrint('Error during classification: $e');
      return null;
    }
  }

  List<List<List<List<double>>>> _convertImageToByteList(img.Image image) {
    var convertedBytes = <List<List<List<double>>>>[];
    convertedBytes.add(<List<List<double>>>[]);
    
    for (var y = 0; y < image.height; y++) {
      convertedBytes[0].add(<List<double>>[]);
      for (var x = 0; x < image.width; x++) {
        var pixel = image.getPixelSafe(x, y);
        convertedBytes[0][y].add(<double>[
          pixel.r.toDouble() / 127.5 - 1.0,
          pixel.g.toDouble() / 127.5 - 1.0,
          pixel.b.toDouble() / 127.5 - 1.0,
        ]);
      }
    }
    return convertedBytes;
  }

  Future<XFile?> pickImage(ImageSource source) async {
    try {
      final ImagePicker picker = ImagePicker();
      final XFile? image = await picker.pickImage(
        source: source,
        maxWidth: 300,
        maxHeight: 300,
        imageQuality: 85,
      );
      return image;
    } catch (e) {
      debugPrint('Error picking image: $e');
      return null;
    }
  }

  void dispose() {
    _interpreter.close();
  }
}

// Global instance for easy access
final imageClassifierService = ImageClassifierService();
