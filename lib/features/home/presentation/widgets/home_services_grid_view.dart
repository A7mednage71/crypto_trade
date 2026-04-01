import 'package:crypto_trade/features/home/data/models/service_item_model.dart';
import 'package:crypto_trade/features/home/presentation/widgets/custom_service_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeServicesGridView extends StatelessWidget {
  const HomeServicesGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        mainAxisSpacing: 8.h,
        crossAxisSpacing: 8.w,
      ),
      itemCount: ServiceItemModel.items.length,
      itemBuilder: (context, index) {
        return CustomServiceCard(
          title: ServiceItemModel.items[index].title,
          iconPath: ServiceItemModel.items[index].iconPath,
          onTap: () {},
        );
      },
    );
  }
}
