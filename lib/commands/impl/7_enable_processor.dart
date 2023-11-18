import 'package:args/command_runner.dart';
import 'package:googleapis/documentai/v1.dart';
import 'package:dart_documentai_samples/utils/utils.dart';

class EnableProcessor extends Command {
  @override
  final name = 'enableProcessor';
  @override
  final description = 'Enable a processor';

  EnableProcessor() {
    // Define the command line arguments with their abbreviations, default values, and help descriptions.
    argParser
      ..addOption('processorId',
          abbr: 'p',
          defaultsTo:
              '447bfde754033efd', // This is the one used in my google cloud env for testing purposes
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

      final request = GoogleCloudDocumentaiV1EnableProcessorRequest();

      // Send the request to delete the processor.
      final GoogleLongrunningOperation operation =
          await documentApi.projects.locations.processors.enable(
        request,
        endpointName,
      );

      // Print operation details
      print("Operation's details: ${operation.metadata}");
    } catch (e) {
      // Handle and display any errors that occur.
      print('Error occurred: $e');
    } finally {
      // Always close the client after using it.
      client.close();
    }
  }
}
