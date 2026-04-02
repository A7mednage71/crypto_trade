import 'dart:math';

import 'package:crypto_trade/core/export.dart';
import 'package:crypto_trade/features/trades/data/models/order_book_model.dart';
import 'package:crypto_trade/features/trades/presentation/widgets/order_book_row_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderBookList extends StatefulWidget {
  const OrderBookList({super.key});

  @override
  State<OrderBookList> createState() => _OrderBookListState();
}

class _OrderBookListState extends State<OrderBookList> {
  late List<OrderBookModel> bids;
  late List<OrderBookModel> asks;
  double maxBidVol = 0;
  double maxAskVol = 0;

  @override
  void initState() {
    super.initState();
    bids = _generateMockData(isBid: true);
    asks = _generateMockData(isBid: false);
    maxBidVol = bids.map((e) => e.volume).reduce(max);
    maxAskVol = asks.map((e) => e.volume).reduce(max);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: ListView.separated(
        padding: EdgeInsets.zero,
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: max(bids.length, asks.length),
        separatorBuilder: (context, index) => verticalSpace(4),
        itemBuilder: (context, index) {
          return Row(
            children: [
              Expanded(
                child: index < bids.length
                    ? OrderBookRowItem(
                        data: bids[index],
                        maxVol: maxBidVol,
                        isBid: true,
                      )
                    : SizedBox.shrink(),
              ),
              horizontalSpace(12),
              Expanded(
                child: index < asks.length
                    ? OrderBookRowItem(
                        data: asks[index],
                        maxVol: maxAskVol,
                        isBid: false,
                      )
                    : SizedBox.shrink(),
              ),
            ],
          );
        },
      ),
    );
  }

  List<OrderBookModel> _generateMockData({required bool isBid}) {
    Random rng = Random();
    return List.generate(
      10,
      (i) => OrderBookModel(
        price: isBid ? 27486.39 - (i * 1.2) : 27488.00 + (i * 1.2),
        quantity: 1000 + rng.nextDouble() * 3000,
        volume: 500 + rng.nextDouble() * 4500,
      ),
    );
  }
}
