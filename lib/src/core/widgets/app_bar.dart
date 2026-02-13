import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mosques_teacher/src/core/constants/app_colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key, this.label, this.actions});

  final String? label;
  final Widget? actions;

  bool _isSliver(BuildContext context) {
    return context.findAncestorWidgetOfExactType<CustomScrollView>() != null ||
        context.findAncestorWidgetOfExactType<NestedScrollView>() != null;
  }

  @override
  Widget build(BuildContext context) {
    final isSliver = _isSliver(context);

    if (isSliver) {
      return SliverAppBar(
        forceMaterialTransparency: false,
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: Colors.white,
        pinned: true,
        centerTitle: false,
        leadingWidth: 230,
        leading: Padding(
          padding: const EdgeInsets.only(right: 20),
          child: Align(
            alignment: Alignment.centerRight,
            child: Text(
              label ?? '',
              style: const TextStyle(
                fontWeight: FontWeight.w700,
                color: AppColors.dark,
                fontSize: 18,
              ),
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              context.push('/notifications');
            },
            icon: actions ?? SizedBox(),
          ),
        ],
      );
    }

    return AppBar(
      forceMaterialTransparency: false,
      automaticallyImplyLeading: false,
      scrolledUnderElevation: 0,
      elevation: 0,
      backgroundColor: Colors.white,
      centerTitle: false,
      title: Text(
        label ?? '',
        style: const TextStyle(
          fontWeight: FontWeight.w700,
          color: AppColors.dark,
          fontSize: 18,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {
            context.push('/notifications');
          },
          icon: actions ?? SizedBox(),
        ),
      ],
      iconTheme: const IconThemeData(color: AppColors.dark),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
