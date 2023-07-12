class ChatRequest {
  String query;
  String metadata;

  ChatRequest({required this.query, required this.metadata});

  ChatRequest.fromJson(Map<String, dynamic> json)
      : query = json['query'],
        metadata = json['meta_data'];

  Map<String, dynamic> toJson() => {'query': query, 'meta_data': metadata};
}
