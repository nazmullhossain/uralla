// class ParcelModel {
//   List<Content> content;
//   int totalElements;
//   int page;
//   int size;
//   Summary summary;
//
//   ParcelModel({
//     required this.content,
//     required this.totalElements,
//     required this.page,
//     required this.size,
//     required this.summary,
//   });
// }
//
// class Content {
//   Status status;
//   List<dynamic> parcelGroupRecords;
//   List<dynamic> statusRecordList;
//   int deliveryCharge;
//   int returnCharge;
//   double merchantAmount;
//   double totalCharge;
//   double codCharge;
//   int collectedAmount;
//   int fine;
//   bool payable;
//   PaymentStatus paymentStatus;
//   bool editable;
//   int stockPrice;
//   bool partialDelivered;
//   int previousPrice;
//   bool receivedInHubManually;
//   bool assignDeliverymanManually;
//   int weightCharge;
//   String id;
//   MerchantOrderId merchantOrderId;
//   RecipientName recipientName;
//   String recipientPhone;
//   RecipientCity recipientCity;
//   RecipientAddress recipientArea;
//   RecipientAddress recipientZone;
//   RecipientAddress recipientAddress;
//   int amountToCollect;
//   ItemDescription itemDescription;
//   int itemQuantity;
//   int itemWeight;
//   SpecialInstruction specialInstruction;
//   ShopId shopId;
//   Seller seller;
//   CityType cityType;
//   CreatedBy createdBy;
//   DateTime createdAt;
//   DateTime updatedAt;
//   String invoice;
//   int v;
//
//   Content({
//     required this.status,
//     required this.parcelGroupRecords,
//     required this.statusRecordList,
//     required this.deliveryCharge,
//     required this.returnCharge,
//     required this.merchantAmount,
//     required this.totalCharge,
//     required this.codCharge,
//     required this.collectedAmount,
//     required this.fine,
//     required this.payable,
//     required this.paymentStatus,
//     required this.editable,
//     required this.stockPrice,
//     required this.partialDelivered,
//     required this.previousPrice,
//     required this.receivedInHubManually,
//     required this.assignDeliverymanManually,
//     required this.weightCharge,
//     required this.id,
//     required this.merchantOrderId,
//     required this.recipientName,
//     required this.recipientPhone,
//     required this.recipientCity,
//     required this.recipientArea,
//     required this.recipientZone,
//     required this.recipientAddress,
//     required this.amountToCollect,
//     required this.itemDescription,
//     required this.itemQuantity,
//     required this.itemWeight,
//     required this.specialInstruction,
//     required this.shopId,
//     required this.seller,
//     required this.cityType,
//     required this.createdBy,
//     required this.createdAt,
//     required this.updatedAt,
//     required this.invoice,
//     required this.v,
//   });
// }
//
// enum CityType { OUTSIDE }
//
// enum CreatedBy { THE_647_DC12801207_B0_FA170_E3_AA }
//
// enum ItemDescription { THE_2_GAZET }
//
// enum MerchantOrderId { TEST1, TEST1234 }
//
// enum PaymentStatus { PENDING_FOR_VERIFY }
//
// enum RecipientAddress { EXAMPLE_ADDRESS_2, UTTARA }
//
// enum RecipientCity { RANGPUR }
//
// enum RecipientName { AFRIDI, JOHN_DAO_1 }
//
// class Seller {
//   List<dynamic> productCategories;
//   bool emailVerified;
//   bool verified;
//   bool requestForVerification;
//   bool showShopInHomepage;
//   bool active;
//   CreatedBy id;
//   CompanyName companyName;
//   String phoneNumber1;
//   ErName ownerName;
//   Email email;
//   SubscriptionPlan subscriptionPlan;
//   List<dynamic> warehouseAddressList;
//   DateTime createdAt;
//   DateTime updatedAt;
//   int v;
//   ErName bankAccountHolderName;
//   String bankAccountNumber;
//   RecipientAddress bankBranchName;
//   BankName bankName;
//   String bankRoutingNumber;
//   String bkash;
//   String nagad;
//   dynamic reasonOfRejection;
//   String rocket;
//   StreetAddress streetAddress;
//
//   Seller({
//     required this.productCategories,
//     required this.emailVerified,
//     required this.verified,
//     required this.requestForVerification,
//     required this.showShopInHomepage,
//     required this.active,
//     required this.id,
//     required this.companyName,
//     required this.phoneNumber1,
//     required this.ownerName,
//     required this.email,
//     required this.subscriptionPlan,
//     required this.warehouseAddressList,
//     required this.createdAt,
//     required this.updatedAt,
//     required this.v,
//     required this.bankAccountHolderName,
//     required this.bankAccountNumber,
//     required this.bankBranchName,
//     required this.bankName,
//     required this.bankRoutingNumber,
//     required this.bkash,
//     required this.nagad,
//     required this.reasonOfRejection,
//     required this.rocket,
//     required this.streetAddress,
//   });
// }
//
// enum ErName { NAFIUL_ISLAM }
//
// enum BankName { EXAMPLE_BANK }
//
// enum CompanyName { ABC_COMPANY }
//
// enum Email { NINADNAFIUL_GMAIL_COM }
//
// enum StreetAddress { EXAMPLE }
//
// class SubscriptionPlan {
//   bool subscriptionPlanDefault;
//   Id id;
//   int insideCityMinPrice;
//   int subCityMinPrice;
//   int outsideCityMinPrice;
//   int minWeightThreshold;
//   int minWeightThresholdInsideCity;
//   int minWeightThresholdSubCity;
//   int minWeightThresholdOutsideCity;
//   int insideCityMaxPrice;
//   int subCityMaxPrice;
//   int outsideCityMaxPrice;
//   int maxWeightThreshold;
//   int maxWeightThresholdInsideCity;
//   int maxWeightThresholdSubCity;
//   int maxWeightThresholdOutsideCity;
//   int extraWeightUnit;
//   int extraWeightUnitInsideCity;
//   int extraWeightUnitSubCity;
//   int extraWeightUnitOutsideCity;
//   int pricePerExtraWeightUnitInsideCity;
//   int pricePerExtraWeightUnitSubCity;
//   int pricePerExtraWeightUnitOutsideCity;
//   int codChargePercentage;
//   int codChargePercentageInsideCity;
//   int codChargePercentageSubCity;
//   int codChargePercentageOutsideCity;
//   int minReturnChargeInsideCity;
//   int minReturnChargeSubCity;
//   int minReturnChargeOutsideCity;
//
//   SubscriptionPlan({
//     required this.subscriptionPlanDefault,
//     required this.id,
//     required this.insideCityMinPrice,
//     required this.subCityMinPrice,
//     required this.outsideCityMinPrice,
//     required this.minWeightThreshold,
//     required this.minWeightThresholdInsideCity,
//     required this.minWeightThresholdSubCity,
//     required this.minWeightThresholdOutsideCity,
//     required this.insideCityMaxPrice,
//     required this.subCityMaxPrice,
//     required this.outsideCityMaxPrice,
//     required this.maxWeightThreshold,
//     required this.maxWeightThresholdInsideCity,
//     required this.maxWeightThresholdSubCity,
//     required this.maxWeightThresholdOutsideCity,
//     required this.extraWeightUnit,
//     required this.extraWeightUnitInsideCity,
//     required this.extraWeightUnitSubCity,
//     required this.extraWeightUnitOutsideCity,
//     required this.pricePerExtraWeightUnitInsideCity,
//     required this.pricePerExtraWeightUnitSubCity,
//     required this.pricePerExtraWeightUnitOutsideCity,
//     required this.codChargePercentage,
//     required this.codChargePercentageInsideCity,
//     required this.codChargePercentageSubCity,
//     required this.codChargePercentageOutsideCity,
//     required this.minReturnChargeInsideCity,
//     required this.minReturnChargeSubCity,
//     required this.minReturnChargeOutsideCity,
//   });
// }
//
// enum Id { THE_65_CD0_CAB1_C472_F6_AC4_D5711_B }
//
// enum ShopId { SHOP_123 }
//
// enum SpecialInstruction { NEED_TO_CARRY_SOFTLY }
//
// enum Status { REQUESTED }
//
// class Summary {
//   int totalCharge;
//   int merchantAmount;
//   int amountToCollect;
//   int collectedAmount;
//   int deliveryCharge;
//   int codCharge;
//   int returnCharge;
//   int fine;
//   int stockPrice;
//   int previousPrice;
//
//   Summary({
//     required this.totalCharge,
//     required this.merchantAmount,
//     required this.amountToCollect,
//     required this.collectedAmount,
//     required this.deliveryCharge,
//     required this.codCharge,
//     required this.returnCharge,
//     required this.fine,
//     required this.stockPrice,
//     required this.previousPrice,
//   });
// }
