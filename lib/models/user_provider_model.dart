

import 'dart:convert';

OrderMode orderModeFromJson(String str) => OrderMode.fromJson(json.decode(str));

String orderModeToJson(OrderMode data) => json.encode(data.toJson());

class OrderMode {
  String? entity;
  int? count;
  List<Item>? items;

  OrderMode({
    this.entity,
    this.count,
    this.items,
  });

  factory OrderMode.fromJson(Map<String, dynamic> json) => OrderMode(
    entity: json["entity"],
    count: json["count"],
    items: json["items"] == null ? [] : List<Item>.from(json["items"]!.map((x) => Item.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "entity": entity,
    "count": count,
    "items": items == null ? [] : List<dynamic>.from(items!.map((x) => x.toJson())),
  };
}

class Item {
  String? id;
  Entity? entity;
  int? amount;
  dynamic amountPaid;
  int? amountDue;
  Currency? currency;
  Receipt? receipt;
  dynamic offerId;
  Status? status;
  int? attempts;
  List<dynamic>? notes;
  int? createdAt;

  Item({
    this.id,
    this.entity,
    this.amount,
    this.amountPaid,
    this.amountDue,
    this.currency,
    this.receipt,
    this.offerId,
    this.status,
    this.attempts,
    this.notes,
    this.createdAt,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    id: json["id"],
    entity: entityValues.map[json["entity"]]!,
    amount: json["amount"],
    amountPaid: json["amount_paid"],
    amountDue: json["amount_due"],
    currency: currencyValues.map[json["currency"]]!,
    receipt: receiptValues.map[json["receipt"]]!,
    offerId: json["offer_id"],
    status: statusValues.map[json["status"]]!,
    attempts: json["attempts"],
    notes: json["notes"] == null ? [] : List<dynamic>.from(json["notes"]!.map((x) => x)),
    createdAt: json["created_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "entity": entityValues.reverse[entity],
    "amount": amount,
    "amount_paid": amountPaid,
    "amount_due": amountDue,
    "currency": currencyValues.reverse[currency],
    "receipt": receiptValues.reverse[receipt],
    "offer_id": offerId,
    "status": statusValues.reverse[status],
    "attempts": attempts,
    "notes": notes == null ? [] : List<dynamic>.from(notes!.map((x) => x)),
    "created_at": createdAt,
  };
}

enum Currency {
  INR
}

final currencyValues = EnumValues({
  "INR": Currency.INR
});

enum Entity {
  ORDER
}

final entityValues = EnumValues({
  "order": Entity.ORDER
});

enum Receipt {
  RECEIPT_1
}

final receiptValues = EnumValues({
  "receipt#1": Receipt.RECEIPT_1
});

enum Status {
  CREATED
}

final statusValues = EnumValues({
  "created": Status.CREATED
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
