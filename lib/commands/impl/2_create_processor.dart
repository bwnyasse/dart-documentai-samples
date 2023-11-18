import 'package:args/command_runner.dart';
import 'package:googleapis/documentai/v1.dart';
import 'package:dart_documentai_samples/utils/utils.dart';

class CreateProcessor extends Command {
  @override
  final name = 'createProcessor';
  @override
  final description = 'Create a new processor';

  CreateProcessor() {
    // Define the command line arguments with their abbreviations, default values, and help descriptions.
    argParser
      ..addOption('projectId',
          abbr: 'p',
          defaultsTo: 'learning-box-369917',
          help: 'Your Google Cloud Project ID.')
      ..addOption('location',
          abbr: 'l',
          defaultsTo: 'us',
          help: 'Location of your DocumentAI processor.')
      ..addOption('displayName',
          abbr: 'd',
          defaultsTo: 'Form Parser from cli',
          help: 'The display name of the processor.')
      ..addOption('type',
          abbr: 't',
          defaultsTo: 'FORM_PARSER_PROCESSOR',
          help: 'The processor type, such as: `FORM_PARSER_PROCESSOR`.');
  }

  @override
  void run() async {
    // Obtain an authenticated client for interacting with DocumentAI.
    final client = await AuthUtils.getAuthenticatedClient();

    // Retrieve arguments provided by the user or default values.
    final projectId = argResults?['projectId'];
    final location = argResults?['location'];
    final displayName = argResults?['displayName'];
    final type = argResults?['type'];
    final parentLocation = 'projects/$projectId/locations/$location';

    try {
      // Initialize the DocumentAI API client.
      final documentApi = DocumentApi(client);

      // Define the processor with the provided (or default) details.
      final processor = GoogleCloudDocumentaiV1Processor()
        ..displayName = displayName
        ..type = type;

      // Send the request to create the processor.
      final response = await documentApi.projects.locations.processors.create(
        processor,
        parentLocation,
      );

      // Display the response to the user.
      print('Processor created with name: ${response.name}');
    } catch (e) {
      // Handle and display any errors that occur.
      print('Error occurred: $e');
    } finally {
      // Always close the client after using it.
      client.close();
    }
  }
}
