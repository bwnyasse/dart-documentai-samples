import 'dart:io';
import 'package:googleapis/documentai/v1.dart';
import 'package:googleapis_auth/auth_io.dart' as auth;
import 'package:sample_009_documentai/utils/utils.dart' as utils;

import '../utils/utils.dart';

String getParentLocation() {
  // Configuration parameters
  final projectId = 'learning-box-369917';
  final location = 'us';
  return 'projects/$projectId/locations/$location';
}

Future<void> listProcessorTypes() async {
  final accountCredentials =
      auth.ServiceAccountCredentials.fromJson(utils.getSAKey());
  final client = await auth.clientViaServiceAccount(accountCredentials, [
    DocumentApi.cloudPlatformScope,
  ]);

  try {
    final documentApi = DocumentApi(client);
    final response = await documentApi.projects.locations.processorTypes
        .list(getParentLocation());

    print('Available Processor Types:');
    for (GoogleCloudDocumentaiV1ProcessorType processorType in response.processorTypes!) {
      print(' - ${processorType.type}');
    }
  } catch (e) {
    print('Error occurred: $e');
  } finally {
    client.close();
  }
}

Future<void> createProcessor() async {
  final accountCredentials =
      auth.ServiceAccountCredentials.fromJson(utils.getSAKey());
  final client = await auth.clientViaServiceAccount(accountCredentials, [
    DocumentApi.cloudPlatformScope,
  ]);

  try {
    final documentApi = DocumentApi(client);
    // Configuration parameters

    final processor = GoogleCloudDocumentaiV1Processor()
      ..displayName = 'Form Parser from cli'
      ..type = 'FORM_PARSER_PROCESSOR'; // e.g. 'FORM_PARSER'

    final response = await documentApi.projects.locations.processors.create(
      processor,
      getParentLocation(),
    );
    print('Processor created with name: ${response.name}');
  } catch (e) {
    print('Error occurred: $e');
  } finally {
    client.close();
  }
}

// Test a Document AI form processor
Future<void> processDocument() async {
  final accountCredentials =
      auth.ServiceAccountCredentials.fromJson(utils.getSAKey());

  final client = await auth.clientViaServiceAccount(accountCredentials, [
    DocumentApi.cloudPlatformScope,
  ]);

  try {
    final documentApi = DocumentApi(client);
    // Configuration parameters
    final processorId = '447bfde754033efd';
    final fileName = 'form.pdf';

    final name = '$getParentLocation/processors/$processorId';
    final pdfContent = await File(fileName).readAsBytes();

    final document = GoogleCloudDocumentaiV1RawDocument()
      ..contentAsBytes = pdfContent
      ..mimeType = 'application/pdf';

    final request = GoogleCloudDocumentaiV1ProcessRequest()
      ..rawDocument = document
      ..skipHumanReview = true;

    final response = await documentApi.projects.locations.processors.process(
      request,
      name,
    );

    printResults(response);
  } catch (e) {
    print('Error occurred: $e');
  } finally {
    client.close();
  }
}

void printResults(GoogleCloudDocumentaiV1ProcessResponse response) {
  print('Document processing complete.');
  print('Review status: ${response.humanReviewStatus?.state ?? 'N/A'}\n');

  final documentPages = response.document?.pages ?? [];
  print("There are ${documentPages.length} page(s) in this document.\n");

  for (var page in documentPages) {
    print("\n**** Page ${page.pageNumber} ****\n");
    final formFields = page.formFields ?? [];
    print("Found ${formFields.length} form fields:\n");
    for (var formField in formFields) {
      final fieldName =
          removeNewlines(formField.fieldName?.textAnchor?.content);
      final fieldValue =
          removeNewlines(formField.fieldValue?.textAnchor?.content);
      print("    - $fieldName: $fieldValue");
    }
  }
}
