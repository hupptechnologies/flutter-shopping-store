class ApiResponse<T> {
  final bool error;
  final T? data;
  final String message;

  ApiResponse(
    this.error,
    this.message,
    this.data,
  );

  factory ApiResponse.fromJson(
    Map<String, dynamic> json,
    T Function(dynamic) fromJsonT,
  ) {
    return ApiResponse(
      json['error'],
      json['message'],
      json['data'] != null ? fromJsonT(json['data']) : null,
    );
  }

  factory ApiResponse.error(String errorMessage) {
    return ApiResponse(true, errorMessage, null);
  }
}
