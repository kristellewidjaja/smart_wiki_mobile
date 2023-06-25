class Response {
  String status;
  String _data;

  Response({
    required this.status,
    required String data,
  }) : _data = data;

  String get data => _data;

  Response.fromJson(Map<String, dynamic> json)
      : status = json['status'],
        _data = json['data'];

  Map<String, dynamic> toJson() => {
        'status': status,
        'data': _data,
      };
}
