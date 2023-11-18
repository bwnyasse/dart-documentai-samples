#!/bin/bash

# Function to call the Dart command
run_command() {
    case $1 in
    "processDocumentWithFormParser")
        echo "Running processDocumentWithFormParser..."
        echo ""
        dart bin/main.dart processDocumentWithFormParser -p f2ffeccf6bdc85ae -f example/input/form.pdf
        ;;
    "processDocumentUsingSpecializedProcessor")
        echo "Running processDocumentUsingSpecializedProcessor..."
        echo ""
        dart bin/main.dart processDocumentUsingSpecializedProcessor -p f5fede58434ad0c -f example/input/model-1.pdf
        ;;
    *)
        echo "Command not recognized."
        ;;
    esac
}

# Check if an argument is provided
if [ $# -eq 0 ]; then
    echo "No arguments provided. Please provide a command."
    exit 1
fi

# Call the function with the provided argument
run_command $1
