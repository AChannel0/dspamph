// import 'package:tflite_flutter/tflite_flutter.dart';
// import 'dart:typed_data';

// List<String> stopwords = [
//   'a',
//   'an',
//   'the',
//   'in',
//   'on',
//   'at',
//   // Add more stopwords as needed
// ];

// Future<int> getSpamPrediction(String text) async {
//   // Load your model here if required
//   String modelPath = 'assets/lstm_model.tflite';

//   final interpreterOptions = InterpreterOptions();
//   final interpreter =
//       await Interpreter.fromAsset(modelPath, options: interpreterOptions);

//   // Preprocess the text input
//   List<String> inputTexts = [text];
//   List<List<int>> inputIds = tokenizeTexts(inputTexts);

//   // Prepare input and output buffers
//   List<List<List<double>>> inputBuffer = [
//     inputIds.map((list) {
//       return list.map((id) => id.toDouble()).toList();
//     }).toList()
//   ];

//   // Convert inputBuffer to Uint8List
//   List<double> flattenedBuffer = _flattenBuffer(inputBuffer);
//   Uint8List inputBufferUint8 =
//       Uint8List.fromList(flattenedBuffer.map((e) => e.toInt()).toList());

//   // Prepare output buffer
//   List<List<double>> output = List.generate(
//     interpreter.getOutputTensors().length,
//     (index) => List.generate(
//       interpreter.getOutputTensors()[index].shape.reduce((a, b) => a * b),
//       (_) => 0.0,
//     ),
//   );

//   // Run inference
//   interpreter.run(inputBufferUint8, output);

//   // Get the output predictions
//   List<int> predictions = output[0].map((value) => value.round()).toList();

//   // Clean up
//   interpreter.close();

//   return predictions[0];
// }

// List<List<int>> tokenizeTexts(List<String> texts) {
//   List<List<int>> tokenizedTexts = [];
//   for (String text in texts) {
//     List<String> words = text.toLowerCase().split(' ');
//     List<int> tokens = [];
//     for (String word in words) {
//       if (!stopwords.contains(word)) {
//         tokens.add(word.hashCode);
//       }
//     }
//     tokenizedTexts.add(tokens);
//   }
//   return tokenizedTexts;
// }

// List<double> _flattenBuffer(List<List<List<double>>> buffer) {
//   List<double> flattenedBuffer = [];
//   for (int i = 0; i < buffer.length; i++) {
//     for (int j = 0; j < buffer[i].length; j++) {
//       flattenedBuffer.addAll(buffer[i][j]);
//     }
//   }
//   return flattenedBuffer;
// }

// import 'package:tflite_flutter/tflite_flutter.dart';

// class SpamDetector {
//   final int inputSize = 1;
//   final int outputSize = 1;
//   late Interpreter interpreter;

//   SpamDetector() {
//     loadModel();
//   }

//   Future<void> loadModel() async {
//     final interpreterOptions = InterpreterOptions()
//       ..threads = 2; // Adjust the number of threads as per your requirement

//     interpreter = await Interpreter.fromAsset(
//       'assets/lstm_model.tflite',
//       options: interpreterOptions,
//     );
//   }

//   Future<int> getSpamPrediction(String message) async {
//     await loadModel(); // Ensure the model is loaded before making predictions

//     List<List<double>> inputBufferFloat32 = _preprocessInput(message);
//     var output = List<double>.filled(outputSize, 0).reshape([1, outputSize]);

//     interpreter.run(inputBufferFloat32, output);

//     var prediction = output[0][0];

//     return prediction.round();
//   }

//   List<List<double>> _preprocessInput(String message) {
//     // Tokenize and preprocess the input message as per your model's requirements
//     // For example, convert text to a numerical representation like one-hot encoding

//     // Dummy tokenization and preprocessing for demonstration purposes
//     List<String> words = message.toLowerCase().split(' ');
//     List<double> oneHotVector = List<double>.filled(10000, 0);
//     for (String word in words) {
//       int? index = int.tryParse(word);
//       if (index != null && index < 10000) {
//         oneHotVector[index] = 1;
//       }
//     }
//     List<List<double>> inputBufferFloat32 = [oneHotVector];

//     return inputBufferFloat32;
//   }
// }

//////////////////////////////////////////////////////////

// import 'package:flutter/services.dart';
// import 'package:tflite_flutter/tflite_flutter.dart';

// class SpamDetection {
//   static const String modelPath = 'assets/spam_detection_model.tflite';
//   late Interpreter _interpreter;

//   Future<void> loadModel() async {
//     try {
//       _interpreter = await Interpreter.fromAsset(modelPath);
//     } on PlatformException {
//       print('Failed to load the TFLite model.');
//     }
//   }

//   Future<String> predictMessage(String message) async {
//     try {
//       final input = preprocessMessage(message);
//       final output = List<double>.filled(2, 0.0);
//       final inputList = [input];
//       final outputList = [output];
//       _interpreter.run(inputList, outputList);
//       final prediction =
//           outputList[0][0] > outputList[0][1] ? 'Not Spam' : 'Spam';
//       return prediction;
//     } on PlatformException {
//       print('Failed to make a prediction.');
//     }
//     return 'Unknown';
//   }

//   Uint8List preprocessMessage(String message) {
//     final bytes = Uint8List(message.length);
//     for (int i = 0; i < message.length; i++) {
//       final char = message.codeUnitAt(i);
//       bytes[i] = char > 255 ? 255 : char;
//     }
//     return bytes;
//   }
// }

//////////////////////////////////////////////////////////

import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'package:tflite_flutter/tflite_flutter.dart';

class SpamDetection {
  static const String modelPath = 'assets/lstm_model.tflite';
  late Interpreter _interpreter;

  // Future<void> loadModel() async {
  //   try {
  //     final interpreterOptions = InterpreterOptions();
  //     _interpreter =
  //         await Interpreter.fromAsset(modelPath, options: interpreterOptions);
  //   } on PlatformException {
  //     print('Failed to load the TFLite model.');
  //   }
  // }

  Future<void> loadModel() async {
    try {
      final interpreterOptions = InterpreterOptions();
      _interpreter =
          await Interpreter.fromAsset(modelPath, options: interpreterOptions);
    } catch (e) {
      print('Failed to load the TFLite model: $e');
    }
  }

  Future<String> predictMessage(String message) async {
    if (!_isModelLoaded()) {
      throw Exception('TFLite model is not loaded.');
    }

    try {
      final input = preprocessMessage(message);
      final output = List<double>.filled(2, 0.0); // Output shape (None, 2)
      final inputList = [input]; // Input shape (None, 80)
      final outputList = [output];

      final convertedInputList = inputList
          .map((list) => list.map((value) => value.toDouble()).toList())
          .toList();

      final inputBuffer = convertedInputList.expand((x) => x).toList();
      final outputBuffer = outputList.expand((x) => x).toList();

      _interpreter.run(inputBuffer, outputBuffer);

      final prediction =
          outputBuffer[0] > outputBuffer[1] ? 'Not Spam' : 'Spam';
      return prediction;
    } on PlatformException catch (e) {
      print('Failed to make a prediction: $e');
    }
    return 'Unknown';
  }

  bool _isModelLoaded() {
    return _interpreter != null;
  }

  Uint8List preprocessMessage(String message) {
    final cleanedMessage = cleanMessage(message);
    final encodedMessage = encodeMessage(cleanedMessage);
    final paddedMessage = padSequence(encodedMessage,
        maxlen: 80); // Maximum sequence length of 80
    return paddedMessage;
  }

  String cleanMessage(String message) {
    final cleanedText = message.replaceAll(RegExp('[^A-Za-z]'), ' ');
    return cleanedText.toLowerCase();
  }

  List<int> encodeMessage(String message) {
    final encodedMessage = message.codeUnits;
    return encodedMessage;
  }

  Uint8List padSequence(List<int> sequence, {int maxlen = 80}) {
    final paddedSequence = List<int>.filled(maxlen, 0);
    final sequenceLength = sequence.length;
    final truncatedSequence =
        sequenceLength <= maxlen ? sequence : sequence.sublist(0, maxlen);
    paddedSequence.setRange(0, truncatedSequence.length, truncatedSequence);
    return Uint8List.fromList(paddedSequence);
  }
}
