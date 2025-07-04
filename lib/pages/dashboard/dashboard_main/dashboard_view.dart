import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:heart_sync/pages/dashboard/dashboard_main/widgets_dashboard.dart';
import '../../../common/app_colors.dart';
import 'dashboard_controller.dart';

/// DashboardView class is used to display the dashboard screen
class DashboardView extends GetView<DashboardController> {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return ColorfulSafeArea(
         top: false,
      child: Scaffold(
        
        bottomNavigationBar: Obx(() {
          return Container(
            height: 60,
            decoration: BoxDecoration(
              color: AppColors.background,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 1,
                  offset: const Offset(0, -1),
                ),
              ],
            ),
            child: BottomNavigationBar(
              selectedFontSize: 0,
              elevation: 0,
              type: BottomNavigationBarType.fixed,
              currentIndex: controller.currentIndex.value,
              backgroundColor: AppColors.background,

              selectedItemColor: Colors.orange,
              unselectedItemColor: Colors.grey,
              items: [
                bottomNavItem(
                  icon: Icons.home,
                  onPressed: () => controller.onTapNav(0),
                ),
                bottomNavItem(
                  icon: Icons.file_copy,
                  onPressed: () => controller.onTapNav(1),
                ),
                bottomNavItem(
                  icon: Icons.message,
                  onPressed: () => controller.onTapNav(2),
                ),
                bottomNavItem(
                  icon: Icons.person,
                  onPressed: () => controller.onTapNav(3),
                ),
              ],
            ),
          );
        }),
        body: Obx(() {
          return screens[controller.currentIndex.value];
        }),
      ),
    );
  }
}
