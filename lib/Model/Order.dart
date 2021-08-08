import 'package:flutter/cupertino.dart';
import 'package:taswaq/helpers/db_helper.dart';

class Order {
  int id;
  String senderName;
  String senderAddress;
  String receiverName;
  String receiverAddress;
  String description;
  String notes;
  String price;
  String deliveryFee;
  String totalFee;
  int balanceId;

  Order(
      {@required this.senderName,
      @required this.receiverName,
      this.senderAddress,
      this.receiverAddress,
      this.id,
      this.balanceId,
      this.description,
      this.notes,
      @required this.price,
      this.deliveryFee,
      this.totalFee});

  Order.fromMap(Map map) {
    this.id = map[DbHelper.orderIdColumnName];
    this.senderName = map[DbHelper.orderSenderNameColumnName];
    this.senderAddress = map[DbHelper.orderSenderAddressColumnName];
    this.receiverName = map[DbHelper.orderReceiverNameColumnName];
    this.receiverAddress = map[DbHelper.orderReceiverAddressColumnName];
    this.description = map[DbHelper.orderDescriptionNameColumnName];
    this.notes = map[DbHelper.orderNotesNameColumnName];
    this.price = map[DbHelper.orderPriceNameColumnName];
    this.deliveryFee = map[DbHelper.orderDeliveryFeeNameColumnName];
    this.totalFee = map[DbHelper.orderTotalFeeNameColumnName];
    this.balanceId = map[DbHelper.orderBalanceIdName];
  }
  toMap() {
    return {
      DbHelper.orderSenderNameColumnName: this.senderName,
      DbHelper.orderSenderAddressColumnName: this.senderAddress,
      DbHelper.orderReceiverNameColumnName: this.receiverName,
      DbHelper.orderReceiverAddressColumnName: this.receiverAddress,
      DbHelper.orderDescriptionNameColumnName: this.description,
      DbHelper.orderNotesNameColumnName: this.notes,
      DbHelper.orderPriceNameColumnName: this.price,
      DbHelper.orderDeliveryFeeNameColumnName: this.deliveryFee,
      DbHelper.orderTotalFeeNameColumnName: this.totalFee,
      DbHelper.orderBalanceIdName: this.balanceId,
    };
  }
}
