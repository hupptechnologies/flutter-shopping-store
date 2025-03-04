class ApiResponse<T> {
  final bool error;
  final T? data;
  final String message;

  ApiResponse({
    required this.error,
    this.data,
    required this.message,
  });

  factory ApiResponse.fromJson(
    Map<String, dynamic> json,
    T Function(dynamic) fromJsonT,
  ) {
    return ApiResponse(
      error: json['error'],
      data: json['data'] != null ? fromJsonT(json['data']) : null,
      message: json['message'],
    );
  }
}
