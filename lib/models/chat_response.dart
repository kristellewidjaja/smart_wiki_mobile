class ChatResponse {
  String status;
  String _data;

  ChatResponse({
    required this.status,
    required String data,
  }) : _data = data;

  String get data => _data;

  ChatResponse.fromJson(Map<String, dynamic> json)
      : status = json['status'],
        _data = json['data'];

  Map<String, dynamic> toJson() => {
        'status': status,
        'data': _data,
      };
}
