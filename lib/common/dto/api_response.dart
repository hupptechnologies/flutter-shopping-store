class ApiResponse<T> {
  final bool error;
  final String message;
  final T? data;
  final Map<String, dynamic>? errors;

  ApiResponse(this.error, this.message, this.data, this.errors);

  factory ApiResponse.fromJson(
    Map<String, dynamic> json,
    T Function(dynamic) fromJsonT,
  ) {
    return ApiResponse(
      json['error'],
      json['message'],
      json['data'] != null ? fromJsonT(json['data']) : null,
      null,
    );
  }

  factory ApiResponse.error(String errorMessage) {
    return ApiResponse(true, errorMessage, null, null);
  }

  factory ApiResponse.errorData(Map<String, dynamic> json) {
    return ApiResponse(
      true,
      json['message'],
      null,
      json['data'],
    );
  }
}
