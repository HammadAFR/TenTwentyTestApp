import 'package:logger/logger.dart';

class CustomLogPrinter extends LogPrinter {
  final String className;

  CustomLogPrinter({required this.className});

  // Define ANSI color codes
  static const Map<Level, String> levelColors = {
    Level.trace: '\x1B[38;5;86m', // marine blue
    Level.debug: '\x1B[93m', // yellow
    Level.info: '\x1B[38;5;84m', // green
    Level.warning: '\x1B[95;1m', // purple
    Level.error: '\x1B[91m', // red
    Level.fatal: '\x1B[38;5;209m', // orange
  };

  // Define custom emojis for each log level
  static const Map<Level, String> levelEmojis = {
    Level.trace: '🔍', // magnifying glass
    Level.debug: '🐛', // bug
    Level.info: 'ℹ️', // information
    Level.warning: '⚠️', // warning sign
    Level.error: '❌', // cross mark
    Level.fatal: '💀', // skull
  };

  @override
  List<String> log(LogEvent event) {
    final color = levelColors[event.level] ?? '\x1B[37m'; // default to white
    final emoji = PrettyPrinter.defaultLevelEmojis[event.level] ?? '';
    final message = event.message;

    return ['$color [$className] $emoji $message\x1B[0m'];
  }
}
