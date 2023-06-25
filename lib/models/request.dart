class Request {
  String query;

  Request({
    required this.query,
  });

  Request.fromJson(Map<String, dynamic> json) : query = json['query'];

  Map<String, dynamic> toJson() => {
        'query': query,
      };
}
