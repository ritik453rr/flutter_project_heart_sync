
class MessageModel {
  String name;
  String lastMessage;
  String lastMessageTime; // Updated to String to match Firebase field type
  String userId;

  MessageModel({
    this.name = '',
    this.lastMessage = '',
    this.lastMessageTime = '', // Default to an empty string
    this.userId = '',
  });

  // Factory method to create a MessageModel from Firestore data
  factory MessageModel.fromJson(Map<String, dynamic> json) {
    return MessageModel(
      name: json['name'] ?? '',
      lastMessage: json['lastMessage'] ?? '',
      lastMessageTime: json['lastMessageTime'] ?? '', // No conversion needed
      userId: json['userId'] ?? '', // Ensure this matches your Firestore field
    );
  }

  // Method to convert MessageModel to Firestore-compatible map
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'lastMessage': lastMessage,
      'lastMessageTime': lastMessageTime, // Store as a string
      'userId': userId,
    };
  }
}