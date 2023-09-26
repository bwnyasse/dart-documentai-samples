import 'dart:io';
import 'package:googleapis/documentai/v1.dart';
import 'package:path/path.dart' as p;
import 'package:googleapis_auth/auth_io.dart' as auth;

/// An extension on [String] that provides utility methods for string manipulation.
extension StringManipulation on String {
  /// Cleans the string value by removing double quotes and trimming whitespace.
  ///
  /// Returns the cleaned string value.
  String cleanValue() => replaceAll('"', '').trim();

  /// Removes newline characters from the string.
  ///
  /// Returns the string without newline characters.
  String removeNewlines() => replaceAll("\n", "").replaceAll("\r", "");
}

class AuthUtils {
  /// Obtains an authenticated client for interacting with Google Cloud APIs.
  ///
  /// Uses the service account key obtained from the `getSAKey` method.
  /// Returns an instance of [auth.AuthClient] for API interactions.
  static Future<auth.AuthClient> getAuthenticatedClient() async {
    final accountCredentials =
        auth.ServiceAccountCredentials.fromJson(getSAKey());
    return await auth.clientViaServiceAccount(
        accountCredentials, [DocumentApi.cloudPlatformScope]);
  }

  /// Retrieves the service account key from a file.
  ///
  /// Looks for the service account key in the 'sa-key.json' file, located either in the current directory or the 'assets' directory.
  /// Returns the service account key as a [String].
  static String getSAKey() => File(p.join(
        Directory.current.path,
        _getDockerSpecificPath(),
        'sa-key.json',
      )).readAsStringSync();

  /// Determines if the application is running inside a Docker container.
  ///
  /// Checks the environment variable "FETCHER_SERVICE_IN_DOCKER" to determine the execution environment.
  /// Returns an empty string if the code is running inside a Docker container, or the string 'assets' if it's not running in a Docker container.
  static String _getDockerSpecificPath() =>
      Platform.environment["FETCHER_SERVICE_IN_DOCKER"] == 'true'
          ? ''
          : 'assets';
}
