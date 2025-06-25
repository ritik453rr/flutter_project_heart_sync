class ChatModel {
  String msg;
  String senderId;
  String createdAt;
  bool isYourMsg;

  ChatModel({
    this.msg = '',
    this.senderId = '',
    String? createdAt,
    this.isYourMsg = true,
  }) : createdAt = createdAt ?? DateTime.now().toString();

  // Factory method to create a ChatModel from Firestore data
  factory ChatModel.fromJson(Map<String, dynamic> json) {
    return ChatModel(
      msg: json['message'] ?? '',
      senderId: json['senderId'] ?? '',
      createdAt: json['createdAt'] ?? DateTime.now().toString(),
      isYourMsg: json['senderId'] == DateTime.now().toString(),
    );
  }

  // Method to convert ChatModel to Firestore-compatible map
  Map<String, dynamic> toJson() {
    return {
      'message': msg,
      'senderId': senderId,
      'createdAt': createdAt,
      'isYourMsg': isYourMsg,
    };
  }
}
