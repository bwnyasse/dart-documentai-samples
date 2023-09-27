import 'package:args/command_runner.dart';
import 'package:googleapis/documentai/v1.dart';
import 'package:dart_documentai_samples/utils/utils.dart';

class ListProcessorTypes extends Command {
  @override
  final name = 'listProcessorTypes';
  @override
  final description = 'List available processor types';

  ListProcessorTypes() {
    // Define the command line arguments with their abbreviations, default values, and help descriptions.
    argParser
      ..addOption('projectId',
          abbr: 'p',
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
    final projectId = argResults?['projectId'];
    final location = argResults?['location'];
    final parentLocation = 'projects/$projectId/locations/$location';

    try {
      // Initialize the DocumentAI API client.
      final documentApi = DocumentApi(client);

      // Send the request to list available processor types.
      final response = await documentApi.projects.locations.processorTypes
          .list(parentLocation);

      // Display the available processor types to the user.
      print('Available Processor Types:');
      for (GoogleCloudDocumentaiV1ProcessorType processorType
          in response.processorTypes!) {
        print(' - ${processorType.type}');
      }
    } catch (e) {
      // Handle and display any errors that occur.
      print('Error occurred: $e');
    } finally {
      // Always close the client after using it.
      client.close();
    }
  }
}
