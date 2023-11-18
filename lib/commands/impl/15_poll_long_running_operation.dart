import 'dart:async';
import 'package:args/command_runner.dart';
import 'package:googleapis/documentai/v1.dart';
import 'package:dart_documentai_samples/utils/utils.dart';

class PollLongRunningOperation extends Command {
  @override
  final name = 'pollLongRunningOperation';
  @override
  final description = 'Poll a long-running operation in DocumentAI';

  PollLongRunningOperation() {
    // Define the command line arguments
    argParser
      ..addOption('operationName',
          abbr: 'o',
          help: 'Name of the operation to poll.',
          defaultsTo:
              'projects/YOUR_PROJECT/locations/YOUR_LOCATION/operations/YOUR_OPERATION');
  }

  @override
  void run() async {
    // Obtain an authenticated client for interacting with DocumentAI.
    final client = await AuthUtils.getAuthenticatedClient();

    final operationName = argResults?['operationName'];

    try {
      await pollOperation(operationName, client);
      print('Operation $operationName completed.');
    } catch (e) {
      print('Error occurred while polling operation: $e');
    } finally {
      client.close();
    }
  }

  Future<void> pollOperation(String operationName, final client) async {
    final documentApi = DocumentApi(client);

    while (true) {
      final operation =
          await documentApi.projects.locations.operations.get(operationName);

      if (operation.done == true) {
        break;
      }

      await Future.delayed(Duration(seconds: 10));
    }
  }
}

void main(List<String> arguments) {
  final runner = CommandRunner(
      'pollOperation', 'Poll a long-running operation in DocumentAI')
    ..addCommand(PollLongRunningOperation());
  runner.run(arguments);
}
