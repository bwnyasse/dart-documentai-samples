import 'dart:io';

import 'package:args/command_runner.dart';
import 'package:dart_documentai_samples/commands/commands.dart';

void main(List<String> arguments) {
  final runner = CommandRunner(
      'documentai', 'Document AI Sample CLI Tool for Dart Developers')
    ..addCommand(CreateProcessor())
    ..addCommand(DeleteProcessor())
    ..addCommand(DisableProcessor())
    ..addCommand(ListProcessorTypes())
    ..addCommand(ProcessDocumentFormParser());

  runner.run(arguments).catchError((error) {
    if (error is! UsageException) throw error;
    print(error);
    exit(64); // Exit code 64 indicates a command line usage error
  });
}
