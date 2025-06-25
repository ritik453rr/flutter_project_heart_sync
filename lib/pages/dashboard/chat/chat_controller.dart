import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heart_sync/model/chat_model.dart';

/// A controller for managing chat messages.
class ChatController extends GetxController {
  late ScrollController scrollController;
  late TextEditingController msgController;
  late String chatId;
  late String otherUserId;
  late String otherUserFcmToken;
  RxList<ChatModel> chatList = <ChatModel>[].obs;
  RxBool isLoading = false.obs;
  RxBool isInitialLoading = true.obs;
  StreamSubscription<List<ChatModel>>? _messagesSubscription;

  @override
  void onInit() {
    super.onInit();
    _initializeControllers();
    //_initializeChat();
  }

  @override
  void onClose() {
    _disposeResources();
    super.onClose();
  }

  /// Initializes the controllers
  void _initializeControllers() {
    scrollController = ScrollController();
    msgController = TextEditingController();
  }

  /// Initializes the chat
  // void _initializeChat() {
  //   try {
  //     final args = Get.arguments as Map<String, dynamic>;
  //     chatId = args['chatId'] as String;
  //     otherUserId = args['otherUserId'] as String;
  //     //getOtherUserFcmToken();
  //     //loadMessages();
  //   } catch (e) {
  //     _handleError('Failed to initialize chat', e);
  //   }
  // }

  /// method to get fcmToken from users collection on doc id base
  // Future<void> getOtherUserFcmToken() async {
  //   final user = await FireStoreServices.getUser(uid: otherUserId);
  //   otherUserFcmToken = user?.fcmToken ?? '';
  // }

  /// Disposes the resources
  void _disposeResources() {
    _messagesSubscription?.cancel();
    msgController.dispose();
    scrollController.dispose();
  }

  /// Loads messages from Firestore and sets up streaming updates
  // void loadMessages() {
  //   _messagesSubscription?.cancel();
  //   isInitialLoading.value = true;

  //   _messagesSubscription = FireStoreServices.loadMessages(chatId).listen(
  //     (messages) {
  //       chatList.value = messages;
  //       _scrollToBottomIfNeeded();
  //       isInitialLoading.value = false;
  //     },
  //     onError: (error) => _handleError('Failed to load messages', error),
  //   );
  // }

  /// Sends a message to the chat
  // Future<void> sendMessage() async {
  //   final message = msgController.text.trim();
  //   if (message.isEmpty) return;

  //   msgController.clear();
  //   isLoading.value = true;

  //   try {
  //     final success = await _sendMessageToFirestore(message);
  //     if (success) {
  //       _scrollToBottomIfNeeded();
  //       otherUserFcmToken.isNotEmpty
  //           ? await _sendPushNotification(message)
  //           : null;
  //     }
  //   } catch (e) {
  //     _handleError('Failed to send message', e);
  //   } finally {
  //     isLoading.value = false;
  //   }
  // }

  /// Sends a message to Firestore
  // Future<bool> _sendMessageToFirestore(String message) async {
  //   return await FireStoreServices.sendMessage(
  //     chatId: chatId,
  //     message: message,
  //     receiverId: otherUserId,
  //   );
  // }

  /// Sends a push notification
  // Future<void> _sendPushNotification(String message) async {
  //   await NotificationServices.sendPushNotification(
  //     fcmToken: otherUserFcmToken,
  //     title: FireStoreServices.currentUser.name,
  //     body: message,
  //   );
  // }

  /// Scrolls to the bottom of the chat list if needed
  void _scrollToBottomIfNeeded() {
    Future.microtask(() {
      if (scrollController.hasClients && chatList.isNotEmpty) {
        scrollController.jumpTo(0);
      }
    });
  }

  /// Scrolls to the bottom of the chat list
  void scrollToBottom() {
    if (scrollController.hasClients && chatList.isNotEmpty) {
      scrollController.jumpTo(0);
    }
  }

  /// Handles errors
  void _handleError(String message, dynamic error) {
    Get.snackbar('Error', '$message: $error');
  }
}
