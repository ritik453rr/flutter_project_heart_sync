import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:heart_sync/common/app_colors.dart';
import 'package:heart_sync/common/app_constants.dart' show AppConstants;
import 'package:heart_sync/common/app_fonts.dart';
import 'package:heart_sync/common/common_ui.dart';
import 'package:heart_sync/common/custom_app_bar.dart';
import 'package:heart_sync/common/custom_textfield.dart';
import 'package:heart_sync/language/app_strings.dart';
import 'package:heart_sync/pages/dashboard/message/widgets/messages_widgets.dart';
import 'package:heart_sync/pages/dashboard/search_user/search_user_controller.dart';

/// A view that allows users to search_user for messages.
class SearchUserView extends GetView<SearchUserController> {
  const SearchUserView({super.key});

  @override
  Widget build(BuildContext context) {
    // Create a TextEditingController for the search field
    final searchController = TextEditingController(
      text: controller.searchQuery.value,
    );

    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: AppConstants.hideKeyboard,
      child: Scaffold(
        backgroundColor: AppColors.background,
        appBar: CustomAppBar(
          title: AppStrings.textSearch.tr,
          titleColor: AppColors.pink,
          shadow: false,
        ),
        body: SafeArea(
          child: Column(
            children: [
              CustomTextField(

                controller: searchController,
                onChanged: (value) => controller.searchQuery.value = value,
                hintText: AppStrings.textSearchFriends.tr,
                // prefixIcon: Icons.search
              ),
              Expanded(
                child: Obx(() {
                  if (controller.isLoading.value) {
                    return const SizedBox();
                  }

                  if (controller.filteredUsers.isEmpty) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          NeumorphicText(
                            controller.searchQuery.value.isEmpty
                                ? "No friends found"
                                : AppStrings.textNoFriendsFound.tr,
                            style: CommonUI.customNeuMorphismStyle(
                              color: AppColors.black,
                              shadowDarkColor: Colors.black26,
                              shadowLightColor: Colors.transparent,
                            ),
                            textStyle: NeumorphicTextStyle(
                              fontSize: 20,
                              fontFamily: AppFonts.fontSemiBold,
                            ),
                          ),
                          if (controller.searchQuery.value.isNotEmpty) ...[
                            const SizedBox(height: 16),
                            TextButton(
                              onPressed: () {
                                AppConstants.hideKeyboard();
                              },
                              child: Text("clear"),
                            ),
                          ],
                        ],
                      ),
                    );
                  }

                  return ListView.builder(
                    itemCount: controller.filteredUsers.length,
                    padding: EdgeInsets.only(
                      top: 20,
                      bottom: AppConstants.bottomSpace,
                    ),
                    itemBuilder: (context, index) {
                      final user = controller.filteredUsers[index];
                      return messageItem(name: user.name, onPressed: () {});
                    },
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
