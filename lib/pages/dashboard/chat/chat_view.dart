import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heart_sync/common/app_colors.dart';
import 'package:heart_sync/common/app_constants.dart';
import 'package:heart_sync/common/app_font_sizes.dart';
import 'package:heart_sync/common/app_fonts.dart';
import 'package:heart_sync/common/app_shimmers.dart';
import 'package:heart_sync/common/common_ui.dart';
import 'package:heart_sync/common/custom_app_bar.dart';
import 'package:heart_sync/common/custom_textfield.dart';
import 'package:heart_sync/pages/dashboard/chat/chat_controller.dart';
import 'package:heart_sync/pages/dashboard/chat/widgets/chat_widgets.dart';

/// A view that displays the chat interface.
class ChatView extends GetView<ChatController> {
  const ChatView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        AppConstants.hideKeyboard();
      },
      child: Scaffold(
        backgroundColor: AppColors.background,
        appBar: CustomAppBar(title: "Test", shadow: false),
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: Obx(() {
                  if (controller.isInitialLoading.value) {
                    return AppShimmers.chatMessageShimmer();
                  }
                  if (controller.chatList.isEmpty) {
                    return Center(
                      child: CommonUI.neumorphicText(
                        "Start chatting with your mate",
                        fontSize: AppFontSizes.font20,
                        fontFamily: AppFonts.fontSemiBold,
                        color: AppColors.black,
                      ),
                    );
                  }

                  return ListView.builder(
                    controller: controller.scrollController,
                    itemCount: controller.chatList.length,
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    reverse: true,
                    itemBuilder: (context, index) {
                      final chat =
                          controller.chatList[controller.chatList.length -
                              1 -
                              index];
                      return chat.isYourMsg
                          ? yourMsg(chat.msg)
                          : responseMsg(chat.msg);
                    },
                  );
                }),
              ),
              CustomTextField(
                borderRadius: 40,
                leftPadding: 20,
                rightPadding: 20,
                bottomPadding: 10,
                controller: controller.msgController,
                isTextInputDone: true,
                hintText: "Type a message",
                showSuffixIcon: true,
                suffixIcon: Icons.send,
                suffixIconTap: controller.isLoading.value ? null : () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
