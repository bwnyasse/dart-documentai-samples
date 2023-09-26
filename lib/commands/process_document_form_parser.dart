import 'dart:io';

import 'package:args/command_runner.dart';
import 'package:googleapis/documentai/v1.dart';
import 'package:dart_documentai_samples/utils/utils.dart' as utils;
import 'package:dart_documentai_samples/utils/utils.dart';

class ProcessDocumentFormParser extends Command {
  @override
  final name = 'processDocumentWithFormParser';
  @override
  final description = 'Process a document using a Form Parser processor';

  ProcessDocumentFormParser() {
    // Define the command line arguments with their abbreviations, default values, and help descriptions.
    argParser
      ..addOption(
        'processorId',
        abbr: 'p',
        defaultsTo: '447bfde754033efd',
        help: 'ID of the processor',
      )
      ..addOption(
        'fileName',
        abbr: 'f',
        defaultsTo: 'form.pdf',
        help: 'File name for processing.',
      )
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

    // Retrieve provided or default arguments.
    final processorId = argResults?['processorId'];
    final fileName = argResults?['fileName'];
    final projectId = argResults?['projectId'];
    final location = argResults?['location'];
    final endpointName =
        'projects/$projectId/locations/$location/processors/$processorId';

    try {
      // Initialize the DocumentAI API client.
      final documentApi = DocumentApi(client);

      // Read the specified PDF file content.
      final pdfContent = await File(fileName).readAsBytes();

      // Prepare the request payload for DocumentAI processing.
      final document = GoogleCloudDocumentaiV1RawDocument()
        ..contentAsBytes = pdfContent
        ..mimeType = 'application/pdf';

      final request = GoogleCloudDocumentaiV1ProcessRequest()
        ..rawDocument = document
        ..skipHumanReview = true;

      // Send the request to process the document.
      final response = await documentApi.projects.locations.processors.process(
        request,
        endpointName,
      );

      // Display the processing results.
      printResults(response);
    } catch (e) {
      // Handle and display any errors.
      print('Error occurred: $e');
    } finally {
      // Close the client after usage.
      client.close();
    }
  }

  // Utility function to print processed document results.
  void printResults(GoogleCloudDocumentaiV1ProcessResponse response) {
    print('Document processing complete.');
    print('Review status: ${response.humanReviewStatus?.state ?? 'N/A'}\n');

    final documentPages = response.document?.pages ?? [];
    print("There are ${documentPages.length} page(s) in this document.\n");

    for (var page in documentPages) {
      print("**** Page ${page.pageNumber} ****\n");
      final formFields = page.formFields ?? [];
      print("Found ${formFields.length} form fields:\n");
      for (var formField in formFields) {
        final fieldName =
            formField.fieldName?.textAnchor?.content?.removeNewlines();
        final fieldValue =
            formField.fieldValue?.textAnchor?.content?.removeNewlines();
        print("    - $fieldName: $fieldValue");
      }
    }
  }
}
