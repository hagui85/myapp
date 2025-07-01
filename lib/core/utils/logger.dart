import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

// Create a global Logger instance
final Logger _logger = Logger(
  printer: PrettyPrinter(), // You can customize the printer here
);

void logInfo(String message) {
  if (kDebugMode) {
    _logger.i(message);
  }
}

void logWarning(String message) {
  if (kDebugMode) {
    _logger.w(message);
  }
}

void logError(String message, [StackTrace? stackTrace]) {
  if (kDebugMode) {
    if (stackTrace != null) {
      _logger.e(message, error: Exception(message), stackTrace: stackTrace);
    } else {
      _logger.e(message);
    }
  }
}
