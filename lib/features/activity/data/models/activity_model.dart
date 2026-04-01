class ActivityModel {
  final String pair;
  final String type;
  final String amount;
  final String price;
  final String status;
  final String date;

  const ActivityModel({
    required this.pair,
    required this.type,
    required this.amount,
    required this.price,
    required this.status,
    required this.date,
  });
}

const List<ActivityModel> dummyActivities = [
  ActivityModel(
    pair: 'BTC/BUSD',
    type: 'L/B',
    amount: '0.49975/0.49975',
    price: '2652.00',
    status: 'Filled',
    date: '2021-08-02 04:39:26',
  ),
  ActivityModel(
    pair: 'BTC/BUSD',
    type: 'L/S',
    amount: '0.49975/0.49975',
    price: '2652.00',
    status: 'Cancelled',
    date: '2021-08-02 04:39:26',
  ),
  ActivityModel(
    pair: 'BTC/BUSD',
    type: 'L/B',
    amount: '0.49975/0.49975',
    price: '2652.00',
    status: 'Filled',
    date: '2021-08-02 04:39:26',
  ),
  ActivityModel(
    pair: 'BTC/BUSD',
    type: 'L/S',
    amount: '0.49975/0.49975',
    price: '2652.00',
    status: 'Cancelled',
    date: '2021-08-02 04:39:26',
  ),
];
