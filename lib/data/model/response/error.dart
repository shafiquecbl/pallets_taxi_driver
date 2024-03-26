class ErrorResponse {
  final List<Error> errors;

  ErrorResponse({required this.errors});

  factory ErrorResponse.fromJson(Map<String, dynamic> json) {
    return ErrorResponse(
      errors: List<Error>.from(json['errors'].map((x) => Error.fromJson(x))),
    );
  }
}

class Error {
  final String message;
  final String code;

  Error({
    required this.message,
    required this.code,
  });

  factory Error.fromJson(Map<String, dynamic> json) {
    return Error(
      message: json['message'],
      code: json['code'],
    );
  }
}
