import 'dart:io';

import 'package:args/command_runner.dart';
import 'package:dart_documentai_samples/commands/commands.dart';

void main(List<String> arguments) {
  final runner = CommandRunner(
      'documentai', 'Document AI Sample CLI Tool for Dart Developers')
    // 2-
    ..addCommand(CreateProcessor())
    // 3-
    ..addCommand(DeleteProcessor())
    // 5-
    ..addCommand(DisableProcessor())
    // 7-
    ..addCommand(EnableProcessor())
    // 12-
    ..addCommand(ListProcessorTypes())
    // 16-
    ..addCommand(ProcessDocumentFormParser())
    // 18-
    ..addCommand(ProcessDocumentUsingSpecializedProcessor());

  runner.run(arguments).catchError((error) {
    if (error is! UsageException) throw error;
    print(error);
    exit(64); // Exit code 64 indicates a command line usage error
  });
}
