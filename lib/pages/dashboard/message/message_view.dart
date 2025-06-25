import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:heart_sync/common/app_colors.dart';
import 'package:heart_sync/common/app_constants.dart';
import 'package:heart_sync/common/app_shimmers.dart';
import 'package:heart_sync/common/custom_app_bar.dart';
import 'package:heart_sync/language/strings.dart';
import 'package:heart_sync/pages/dashboard/message/message_controller.dart';
import 'package:heart_sync/pages/dashboard/message/widgets/messages_widgets.dart';
import 'package:heart_sync/routing/app_routes.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

/// A view that displays a list of messages.
class MessageView extends GetView<MessageController> {
  const MessageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: CustomAppBar(
        title: Strings.textVibeMate.tr,
        titleFontSize: 20,
        titleColor: AppColors.pink,
        centerTitle: false,
        hideBackButton: true,
        shadow: false,
        trailingIcon: Icons.search,
        onTapTrailingIcon: () {
          Get.toNamed(AppRoutes.searchUser);
        },
      ),
      body: Obx(() {
        return controller.isLoading.value
            ? AppShimmers.friendsShimmer()
            : SmartRefresher(
              enablePullDown: true,
              controller: controller.refreshController,
              onRefresh: controller.onRefresh,

              child:
                  controller.allFriends.isEmpty
                      ? emptyMessagesState()
                      : ListView.builder(
                        padding: EdgeInsets.only(
                          top: 20,
                          bottom: AppConstants.bottomSpace,
                        ),
                        itemCount: controller.allFriends.length,
                        itemBuilder: (context, index) {
                          final friend = controller.allFriends[index];
                          return messageItem(
                            name: friend.name,
                            onPressed: () async {},
                          );
                        },
                      ),
            );
      }),
    );
  }
}
