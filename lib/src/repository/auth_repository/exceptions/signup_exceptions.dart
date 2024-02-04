class SignupExceptions {
  final String message;

  const SignupExceptions([this.message = "an unknown error occurred!"]);

  factory SignupExceptions.code(String code) {
    switch (code) {
      case 'weak-password':
        return const SignupExceptions('please enter a stronger password!');
      case 'invalid-email':
        return const SignupExceptions('email is invalid or wrongly formatted!');
      case 'email-already-in-use':
        return const SignupExceptions(
            'an account already exists for that email!');
      case 'operation-not-allowed':
        return const SignupExceptions(
            'operation not allowed!! please contact support');
      case 'user-disabled':
        return const SignupExceptions(
            'user disabled!! please contact support for help');
      default:
        return const SignupExceptions();
    }
  }
}
