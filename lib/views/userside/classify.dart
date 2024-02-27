// classify.dart
import 'dart:typed_data';
import 'package:flutter_sms_inbox/flutter_sms_inbox.dart';
import 'package:tflite_flutter/tflite_flutter.dart';

class MessageClassifier {
  late Interpreter _interpreter;

  Future<void> loadModel(List<SmsMessage> messages) async {
    try {
      final interpreterOptions = InterpreterOptions();
      _interpreter = await Interpreter.fromAsset(
        'assets/model_lstm_09.20.23.tflite',
        options: interpreterOptions,
      );
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
      final output = List<double>.filled(2, 0.0);
      final inputList = [input];
      final outputList = [output];

      final convertedInputList = inputList
          .map((list) => list.map((value) => value.toDouble()).toList())
          .toList();

      final inputBuffer = convertedInputList.expand((x) => x).toList();
      final outputBuffer = outputList.expand((x) => x).toList();

      _interpreter.run(inputBuffer, outputBuffer);

      final prediction = outputBuffer[0] > outputBuffer[1] ? 'Ham' : 'Spam';
      return prediction;
    } catch (e) {
      print('Failed to make a prediction: $e');
    }
    return 'Unknown';
  }

  bool _isModelLoaded() {
    return _interpreter != null;
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

  Uint8List preprocessMessage(String message) {
    final cleanedMessage = cleanMessage(message);
    final encodedMessage = encodeMessage(cleanedMessage);
    final paddedMessage = padSequence(encodedMessage, maxlen: 80);
    return paddedMessage;
  }
}
