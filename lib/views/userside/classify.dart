// import 'package:flutter/services.dart';

// // Import tflite_flutter
// import 'package:tflite_flutter/tflite_flutter.dart';

// class Classifier {
//   // name of the model file
//   final _modelFile = 'model_lstm_09.20.23.tflite';
//   final _vocabFile = 'labels.txt';

//   // Maximum length of sentence
//   final int _sentenceLen = 256;

//   final String start = '<START>';
//   final String pad = '<PAD>';
//   final String unk = '<UNKNOWN>';

//   Map<String, int> _dict;

//   // TensorFlow Lite Interpreter object
//   Interpreter _interpreter;

//   // Classifier() {
//   //   // Load model when the classifier is initialized.
//   //   _loadModel();
//   //   // _loadDictionary();
//   // }

//   void _loadModel() async {
//     // Creating the interpreter using Interpreter.fromAsset
//     _interpreter = await Interpreter.fromAsset(_modelFile);
//     print('Interpreter loaded successfully');
//   }

//   // void _loadDictionary() async {
//   //   final vocab = await rootBundle.loadString('assets/$_vocabFile');
//   //   var dict = <String, int>{};
//   //   final vocabList = vocab.split('\n');
//   //   for (var i = 0; i < vocabList.length; i++) {
//   //     var entry = vocabList[i].trim().split(' ');
//   //     dict[entry[0]] = int.parse(entry[1]);
//   //   }
//   //   var _dict = dict;
//   //   print('Dictionary loaded successfully');
//   // }

//   int classify(String rawText) {
//     // tokenizeInputText returns List<List<double>>
//     // of shape [1, 256].
//     var input = rawText;

//     // output of shape [1,2].
//     var output = List.filled(2, 0).reshape([1, 2]);

//     // The run method will run inference and
//     // store the resulting values in output.
//     _interpreter.run(input, output);

//     var result = 0;
//     // If value of first element in output is greater than second,
//     // then sentece is negative

//     if ((output[0][0] as double) > (output[0][1] as double)) {
//       result = 0;
//     } else {
//       result = 1;
//     }
//     return result;
//   }

//   // List<List<double>> tokenizeInputText(String text) {
//   //   // Whitespace tokenization
//   //   final toks = text.split(' ');

//   //   // Create a list of length==_sentenceLen filled with the value <pad>
//   //   var vec = List<double>.filled(_sentenceLen, _dict[pad].toDouble());

//   //   var index = 0;
//   //   if (_dict.containsKey(start)) {
//   //     vec[index++] = _dict[start].toDouble();
//   //   }

//   //   // For each word in sentence find corresponding index in dict
//   //   for (var tok in toks) {
//   //     if (index > _sentenceLen) {
//   //       break;
//   //     }
//   //     vec[index++] = _dict.containsKey(tok)
//   //         ? _dict[tok].toDouble()
//   //         : _dict[unk].toDouble();
//   //   }

//   //   // returning List<List<double>> as our interpreter input tensor expects the shape, [1,256]
//   //   return [vec];
//   // }
// }

///////////////////////////////////////////////
// MODEL INTEGRATION
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
