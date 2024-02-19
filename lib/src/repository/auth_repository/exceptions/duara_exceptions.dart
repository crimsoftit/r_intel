class DExceptions implements Exception {
  // {@macro log_in_with_email_and_password_failure}
  const DExceptions([
    this.message = 'an unknown exception occurred! please try again later',
  ]);

  final String message;

  // -- create an authentication message from a firebase auth exception code
  factory DExceptions.fromCode(String code) {
    switch (code) {
      case 'email-already-in-use':
        return const DExceptions('email address already exists!');

      case 'invalid-email':
        return const DExceptions(
            'email is either invalid or wrongly formatted!');

      case 'weak-password':
        return const DExceptions('please enter a stronger password!');

      case 'user-disabled':
        return const DExceptions(
            'this user has been disabled! please contact support for help.');

      case 'user-not-found':
        return const DExceptions(
            'invalid credentials! please create an account.');

      case 'wrong-password':
        return const DExceptions('wrong password! please try again.');

      case 'too-many-requests':
        return const DExceptions(
            'too many requests! service temporarily blocked.');

      case 'invalid-argument':
        return const DExceptions(
            'an invalid argument was provided to an authentication method!');

      case 'invalid-password':
        return const DExceptions('invalid password! please try again.');

      case 'invalid-phone-number':
        return const DExceptions('invalid phone number provided!');

      case 'operation-not-allowed':
        return const DExceptions(
            'the provided sign-in/sign-up provider is disabled!');

      case 'session-cookie-expired':
        return const DExceptions('your session has expired!');

      case 'uid-already-exists':
        return const DExceptions('user id (uid) is aleady in use!');

      default:
        return const DExceptions();
    }
  }
}
