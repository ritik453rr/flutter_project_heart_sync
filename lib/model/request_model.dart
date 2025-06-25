/// A model class representing a friend request.
class RequestModel {
  final String senderId;
  final String senderName;
  final String requestId;

  RequestModel({
    required this.senderId,
    required this.senderName,
    required this.requestId,
  });

  /// Factory constructor to create a `RequestModel` from Firestore data.
  factory RequestModel.fromJson(Map<String, dynamic> json) {
    return RequestModel(
      senderId: json['senderId'] ?? '',
      senderName: json['senderName'] ?? '',
      requestId: (json['requestId'] ?? DateTime.now().millisecondsSinceEpoch.toString()),
    );
  }

  /// Converts the `RequestModel` to a JSON map for Firestore.
  Map<String, dynamic> toJson() {
    return {
      'senderId': senderId,
      'senderName': senderName,
      'requestId': requestId,
    };
  }
}
