import 'package:e_commerce/data/order/order_track_dto.dart';
import 'package:get/get.dart';

class OrderTrackController extends GetxController {
  final List<OrderTrackDto> orderTracker = [
    OrderTrackDto(
        label: 'Parcel is successfully delivered', date: '15 May 10:20', parse: true),
    OrderTrackDto(label: 'Parcel is out for delivery', date: '14 May 08:00', parse: true),
    OrderTrackDto(
        label: 'Parcel is received at delivery Branch', date: '13 May 17:25'),
    OrderTrackDto(label: 'Parcel is in transit ', date: '13 May 07:00'),
    OrderTrackDto(
        label: 'Sender has shipped your parcel', date: '12 May 14:25'),
    OrderTrackDto(
        label: 'Sender is preparing to ship your order', date: '12 May 10:01'),
  ];
}
