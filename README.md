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
    - Ensure your Service Account key JSON file is placed in the `assets/` directory under the name `sa-keys.json`.

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

## Quick Start with Examples

To help you quickly get started with **DartDocumentAISamples**, we provide an `example.sh` script. This script allows you to easily run specific commands with pre-defined parameters. It's a great way to see the tool in action with minimal setup.

### Using the example.sh Script

1. **Ensure Prerequisites**:
   - Make sure you have the Dart SDK installed and your Google Cloud Project is set up with the DocumentAI API and a Service Account as described in the Prerequisites section.

2. **Run a Command**:
   - Use the `example.sh` script followed by the command name to execute a predefined command. For example, to process a document using the Form Parser processor, run:
     ```bash
     ./example.sh processDocumentWithFormParser
     ```
   - Similarly, to process a document using a Specialized processor, execute:
     ```bash
     ./example.sh processDocumentUsingSpecializedProcessor
     ```

3. **Explore Other Commands**:
   - The script supports several commands matching the TODOs in our roadmap. Simply replace the command name in the script call with the one you wish to test.
   
## TODOs

- [ ] [1- Cancel a long-running operation](https://cloud.google.com/document-ai/docs/samples/documentai-cancel-operation?hl=en)
- [x] [2- Create a processor](https://cloud.google.com/document-ai/docs/samples/documentai-create-processor?hl=en)
- [x] [3- Delete a processor](https://cloud.google.com/document-ai/docs/samples/documentai-delete-processor?hl=en)
- [ ] [4- Delete a processor version](https://cloud.google.com/document-ai/docs/samples/documentai-delete-processor-version?hl=en)
- [x] [5- Disable a processor](https://cloud.google.com/document-ai/docs/samples/documentai-disable-processor?hl=en)
- [ ] [6- Deploy a processor version](https://cloud.google.com/document-ai/docs/samples/documentai-deploy-processor-version?hl=en)
- [ ] [7- Enable a processor](https://cloud.google.com/document-ai/docs/samples/documentai-enable-processor?hl=en)
- [ ] [8- Evaluate a processor version](https://cloud.google.com/document-ai/docs/samples/documentai-evaluate-processor-version?hl=en)
- [ ] [9- Get a list of processors](https://cloud.google.com/document-ai/docs/samples/documentai-list-processors?hl=en)
- [ ] [10- Get details about a long-running operation](https://cloud.google.com/document-ai/docs/samples/documentai-get-operation?hl=en)
- [ ] [11- Get evaluation details for a processor version](https://cloud.google.com/document-ai/docs/samples/documentai-get-evaluation?hl=en)
- [x] [12- List processor types](https://cloud.google.com/document-ai/docs/samples/documentai-fetch-processor-types?hl=en)
- [ ] [13- List evaluations for a processor version](https://cloud.google.com/document-ai/docs/samples/documentai-list-evaluations?hl=en)
- [ ] [14- List long-running operations](https://cloud.google.com/document-ai/docs/samples/documentai-list-operations?hl=en)
- [ ] [15- Poll a long-running operation](https://cloud.google.com/document-ai/docs/samples/documentai-poll-operation?hl=en)
- [x] [16- Process a document using a Form Parser processor](https://cloud.google.com/document-ai/docs/samples/documentai-process-form-document?hl=en)
- [ ] [17- Process a document using a Document OCR processor](https://cloud.google.com/document-ai/docs/samples/documentai-process-ocr-document?hl=en)
- [ ] [18- Process a document using a Specialized processor](https://cloud.google.com/document-ai/docs/samples/documentai-process-specialized-document?hl=en)
- [ ] [19- Process a document using a Splitter/Classifier processor](https://cloud.google.com/document-ai/docs/samples/documentai-process-splitter-document?hl=en)
- [ ] [20- Quickstart](https://cloud.google.com/document-ai/docs/samples/documentai-quickstart?hl=en)
- [ ] [21- Request Human Review of a document](https://cloud.google.com/document-ai/docs/samples/documentai-review-document?hl=en)
- [ ] [22- Send a batch process documents request](https://cloud.google.com/document-ai/docs/samples/documentai-batch-process-document?hl=en)
- [ ] [23- Send an online processing request](https://cloud.google.com/document-ai/docs/samples/documentai-process-document?hl=en)
- [ ] [24- Toolbox - Convert Document to hOCR](https://cloud.google.com/document-ai/docs/samples/documentai-toolbox-document-to-hocr?hl=en)
- [ ] [25- Toolbox - Convert Document to Vision API Response](https://cloud.google.com/document-ai/docs/samples/documentai-toolbox-document-to-vision?hl=en)
- [ ] [26- Toolbox - Convert external annotations to Document format](https://cloud.google.com/document-ai/docs/samples/documentai-toolbox-convert-external-annotations?hl=en)
- [ ] [27- Toolbox - Create document batches](https://cloud.google.com/document-ai/docs/samples/documentai-toolbox-create-batches?hl=en)
- [ ] [28- Toolbox - Export entities to BigQuery](https://cloud.google.com/document-ai/docs/samples/documentai-toolbox-entities-to-bigquery?hl=en)
- [ ] [29- Toolbox - Export images](https://cloud.google.com/document-ai/docs/samples/documentai-toolbox-export-images?hl=en)
- [ ] [30- Toolbox - Output table to Dataframe or CSV](https://cloud.google.com/document-ai/docs/samples/documentai-toolbox-table?hl=en)
- [ ] [31- Toolbox - Quickstart](https://cloud.google.com/document-ai/docs/samples/documentai-toolbox-quickstart?hl=en)
- [ ] [32- Toolbox - Split a PDF](https://cloud.google.com/document-ai/docs/samples/documentai-toolbox-split-pdf?hl=en)
- [ ] [33- Train a processor version](https://cloud.google.com/document-ai/docs/samples/documentai-train-processor-version?hl=en)
- [ ] [34- Undeploy a processor version](https://cloud.google.com/document-ai/docs/samples/documentai-undeploy-processor-version?hl=en)
- [ ] [35- View available processor versions](https://cloud.google.com/document-ai/docs/samples/documentai-list-processor-versions?hl=en)
- [ ] [36- View details about a processor](https://cloud.google.com/document-ai/docs/samples/documentai-get-processor?hl=en)
- [ ] [37- View details about a processor version](https://cloud.google.com/document-ai/docs/samples/documentai-get-processor-version?hl=en)


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

