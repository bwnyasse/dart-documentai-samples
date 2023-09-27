# A Document AI Sample CLI Tool for Dart Developers

**DartDocumentAISamples**  is a personal initiative to showcase the capabilities of the Dart language in building applications that interact with Google Cloud services. The core of this project revolves around demonstrating how Dart can be seamlessly integrated with Google Cloud's DocumentAI. As a hands-on example, it provides Dart developers with practical insights into processing, managing, and leveraging DocumentAI's powerful features within a Dart-centric workflow. Please note that this is a work-in-progress, and contributions to enhance its offerings are warmly welcomed. For a glimpse of the roadmap, refer to the TODOs section below.

## What is DocumentAI?

DocumentAI is a suite of tools provided by Google Cloud that harnesses the power of machine learning to help organizations automate document processing. It can efficiently parse, structure, and understand vast amounts of documents, from invoices and receipts to contracts and forms. With DocumentAI, you can extract meaningful data, insights, and knowledge from various document types, turning unstructured data into actionable insights. Its capabilities range from Optical Character Recognition (OCR) and form parsing to specialized processors tailored for specific industries and use cases.

## Prerequisites

1. Dart SDK installed ([Installation Guide](https://dart.dev/get-dart))
2. A Google Cloud Project with DocumentAI API enabled
3. A Service Account with permissions to access DocumentAI

## Running the Tool

**DartDocumentAISamples** provides a command-line interface to interact with Google Cloud's DocumentAI.

1. **Place Service Account Key**:
    - Ensure your Service Account key JSON file is placed in the `assets/` directory.

2. **List Available Commands**:
    - To view the list of available commands and their descriptions, run:
    ```bash
    dart bin/main.dart --help
    ```

3. **Execute a Specific Command**:
    - Replace `<command_name>` with the command you wish to execute, and use the appropriate options and arguments for the command:
    ```bash
    dart bin/main.dart <command_name> --<option_name> <option_value>
    ```
    For example, to list available processor types:
    ```bash
    dart bin/main.dart listProcessorTypes
    ```

4. **Get Detailed Help for a Command**:
    - For more detailed information about a specific command, use:
    ```bash
    dart bin/main.dart help <command_name>
    ```

## TODOs 

- [ ] [Process a document using a Document OCR processor](https://cloud.google.com/document-ai/docs/samples/documentai-process-ocr-document?hl=en)
- [ ] [Process a document using a Specialized processor](https://cloud.google.com/document-ai/docs/samples/documentai-process-specialized-document?hl=en)
- [ ] [Cancel a long-running operation](https://cloud.google.com/document-ai/docs/samples/documentai-cancel-operation?hl=en)
- [ ] [Change the default processor version](https://cloud.google.com/document-ai/docs/samples/documentai-set-default-processor-version?hl=en)
- [x] [Create a processor](https://cloud.google.com/document-ai/docs/samples/documentai-create-processor?hl=en)
- [x] [Delete a processor](https://cloud.google.com/document-ai/docs/samples/documentai-delete-processor?hl=en)
- [ ] [Delete a processor version](https://cloud.google.com/document-ai/docs/samples/documentai-delete-processor-version?hl=en)
- [ ] [Deploy a processor version](https://cloud.google.com/document-ai/docs/samples/documentai-deploy-processor-version?hl=en)
- [x] [Disable a processor](https://cloud.google.com/document-ai/docs/samples/documentai-disable-processor?hl=en)
- [ ] [Enable a processor](https://cloud.google.com/document-ai/docs/samples/documentai-enable-processor?hl=en)
- [ ] [Evaluate a processor version](https://cloud.google.com/document-ai/docs/samples/documentai-evaluate-processor-version?hl=en)
- [ ] [Get a list of processors](https://cloud.google.com/document-ai/docs/samples/documentai-list-processors?hl=en)
- [ ] [Get details about a long-running operation](https://cloud.google.com/document-ai/docs/samples/documentai-get-operation?hl=en)
- [ ] [Get evaluation details for a processor version](https://cloud.google.com/document-ai/docs/samples/documentai-get-evaluation?hl=en)
- [ ] [List evaluations for a processor version](https://cloud.google.com/document-ai/docs/samples/documentai-list-evaluations?hl=en)
- [ ] [List long-running operations](https://cloud.google.com/document-ai/docs/samples/documentai-list-operations?hl=en)
- [x] [List processor types](https://cloud.google.com/document-ai/docs/samples/documentai-fetch-processor-types?hl=en)
- [ ] [Poll a long-running operation](https://cloud.google.com/document-ai/docs/samples/documentai-poll-operation?hl=en)
- [x] [Process a document using a Form Parser processor](https://cloud.google.com/document-ai/docs/samples/documentai-process-form-document?hl=en)
- [ ] [Process a document using a Splitter/Classifier processor](https://cloud.google.com/document-ai/docs/samples/documentai-process-splitter-document?hl=en)
- [ ] [Quickstart](https://cloud.google.com/document-ai/docs/samples/documentai-quickstart?hl=en)
- [ ] [Request Human Review of a document](https://cloud.google.com/document-ai/docs/samples/documentai-review-document?hl=en)
- [ ] [Send a batch process documents request](https://cloud.google.com/document-ai/docs/samples/documentai-batch-process-document?hl=en)
- [ ] [Send an online processing request](https://cloud.google.com/document-ai/docs/samples/documentai-process-document?hl=en)
- [ ] [Toolbox - Convert Document to hOCR](https://cloud.google.com/document-ai/docs/samples/documentai-toolbox-document-to-hocr?hl=en)
- [ ] [Toolbox - Convert Document to Vision API Response](https://cloud.google.com/document-ai/docs/samples/documentai-toolbox-document-to-vision?hl=en)
- [ ] [Toolbox - Convert external annotations to Document format](https://cloud.google.com/document-ai/docs/samples/documentai-toolbox-convert-external-annotations?hl=en)
- [ ] [Toolbox - Create document batches](https://cloud.google.com/document-ai/docs/samples/documentai-toolbox-create-batches?hl=en)
- [ ] [Toolbox - Export entities to BigQuery](https://cloud.google.com/document-ai/docs/samples/documentai-toolbox-entities-to-bigquery?hl=en)
- [ ] [Toolbox - Export images](https://cloud.google.com/document-ai/docs/samples/documentai-toolbox-export-images?hl=en)
- [ ] [Toolbox - Output table to Dataframe or CSV](https://cloud.google.com/document-ai/docs/samples/documentai-toolbox-table?hl=en)
- [ ] [Toolbox - Quickstart](https://cloud.google.com/document-ai/docs/samples/documentai-toolbox-quickstart?hl=en)
- [ ] [Toolbox - Split a PDF](https://cloud.google.com/document-ai/docs/samples/documentai-toolbox-split-pdf?hl=en)
- [ ] [Train a processor version](https://cloud.google.com/document-ai/docs/samples/documentai-train-processor-version?hl=en)
- [ ] [Undeploy a processor version](https://cloud.google.com/document-ai/docs/samples/documentai-undeploy-processor-version?hl=en)
- [ ] [View available processor versions](https://cloud.google.com/document-ai/docs/samples/documentai-list-processor-versions?hl=en)
- [ ] [View details about a processor](https://cloud.google.com/document-ai/docs/samples/documentai-get-processor?hl=en)
- [ ] [View details about a processor version](https://cloud.google.com/document-ai/docs/samples/documentai-get-processor-version?hl=en)

## DEMO

https://github.com/bwnyasse/dart-documentai-samples/assets/5323628/64fc608c-737d-404a-9e5d-def2f56d2012

## Contributing

Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change. As this project is a work-in-progress, any contribution to help complete the TODOs list would be appreciated.

## Acknowledgments

This project draws inspiration from the official samples provided by Google. For a comprehensive list of samples and their descriptions, refer to [Google's DocumentAI Samples](https://cloud.google.com/document-ai/docs/samples).

## License

This project is licensed under the MIT License, which allows for modification, distribution, and private use. Contributions are welcome, and forking the project for your own use is encouraged. For more details, see the [LICENSE](LICENSE) file in the repository.

## Further Reading

For additional information and resources related to this project and DocumentAI, consider visiting the following links:

- [DocumentAI Official Page](https://cloud.google.com/document-ai)
- [Creating Service Accounts in Google Cloud](https://cloud.google.com/iam/docs/service-accounts-create)
- [Get Started with Google Skills Boost](https://www.cloudskillsboost.google/)
- [Generated Dart Libraries for Accessing Google APIs](https://pub.dev/packages/googleapis)

