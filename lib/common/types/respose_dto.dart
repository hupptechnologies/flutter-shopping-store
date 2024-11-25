class ResponseDto<T> {
  final bool error;
  final String message;
  final T? data;

  ResponseDto(this.error, this.message, this.data);

  factory ResponseDto.fromJson(Map<String, dynamic> json) {
    return ResponseDto(json['error'], json['message'], json['data']);
  }

  factory ResponseDto.error(String errorMessage) {
    return ResponseDto(true, errorMessage, null);
  }
}
