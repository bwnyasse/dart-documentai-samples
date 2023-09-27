import 'package:args/command_runner.dart';
import 'package:googleapis/documentai/v1.dart';
import 'package:dart_documentai_samples/utils/utils.dart';

class DeleteProcessor extends Command {
  @override
  final name = 'deleteProcessor';
  @override
  final description = 'Delete a processor';

  DeleteProcessor() {
    // Define the command line arguments with their abbreviations, default values, and help descriptions.
    argParser
      ..addOption('processorId',
          abbr: 'p',
          defaultsTo:
              '92ef815e67387be', // This is the one used in my google cloud env for testing purposes
          help: 'ID of the processor')
      ..addOption('projectId',
          abbr: 'i',
          defaultsTo: 'learning-box-369917',
          help: 'Your Google Cloud Project ID.')
      ..addOption('location',
          abbr: 'l',
          defaultsTo: 'us',
          help: 'Location of your DocumentAI processor.');
  }

  @override
  void run() async {
    // Obtain an authenticated client for interacting with DocumentAI.
    final client = await AuthUtils.getAuthenticatedClient();

    // Retrieve arguments provided by the user or default values.
    final processorId = argResults?['processorId'];
    final projectId = argResults?['projectId'];
    final location = argResults?['location'];
    final endpointName =
        'projects/$projectId/locations/$location/processors/$processorId';
    try {
      // Initialize the DocumentAI API client.
      final documentApi = DocumentApi(client);

      // Send the request to delete the processor.
      final GoogleLongrunningOperation operation =
          await documentApi.projects.locations.processors.delete(endpointName);

      // Print operation details
      print('Deletion details: ${operation.metadata}');
    } catch (e) {
      // Handle and display any errors that occur.
      print('Error occurred: $e');
    } finally {
      // Always close the client after using it.
      client.close();
    }
  }
}
