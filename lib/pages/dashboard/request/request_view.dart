import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:heart_sync/common/app_colors.dart';
import 'package:heart_sync/common/app_constants.dart';
import 'package:heart_sync/common/common_ui.dart';
import 'package:heart_sync/common/custom_app_bar.dart';
import 'package:heart_sync/language/app_strings.dart' show AppStrings;
import 'package:heart_sync/pages/dashboard/request/request_controller.dart';
import 'package:heart_sync/pages/dashboard/request/widgets/request_widgets.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

/// A view to represent friend requests.
class RequestView extends GetView<RequestController> {
  const RequestView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: AppStrings.textFriendRequests.tr,
        titleColor: AppColors.pink,
        shadow: false,
      ),
      body: Obx(() {
        return SmartRefresher(
          enablePullDown: true,
          enablePullUp: true,
          controller: controller.refreshController,
          onRefresh: controller.onRefresh,
          onLoading: controller.onLoading,

          child:
              controller.requests.isEmpty
                  ? emptyRequestsState()
                  : ListView.builder(
                    padding: EdgeInsets.only(
                      top: 20,
                      bottom: AppConstants.bottomSpace,
                    ),
                    itemCount: controller.requests.length,
                    itemBuilder: (context, index) {
                      final request = controller.requests[index];
                      return requestItem(
                        senderName: request.senderName,
                        onTapReject: () {},
                        onTapAccept: () async {},
                      );
                    },
                  ),
        );
      }),
    );
  }
}
