class SaleModel {

  String NoOfKitchens;
  String NoWashRooms;
  String areaInSquareFits;
  String propertyPrice;
  String balcony;
  String boundaryWall;
  String entrances;
  String facing;
  String garage;
  String gatesForEntry;
  String landMarks;
  String ownerName;
  String parkingSpace;
  String propertyAddress;
  String propertyDescription;
  String propertyFinishType;
  String propertyLocation;
  String propertyName;
  String uniqueID;
  String uniquePostID;
  String propertyPic;

  SaleModel({

    this.NoOfKitchens,
    this.NoWashRooms,
    this.areaInSquareFits,
    this.propertyPrice,
    this.balcony,
    this.boundaryWall,
    this.entrances,
    this.facing,
    this.garage,
    this.gatesForEntry,
    this.landMarks,
    this.ownerName,
    this.parkingSpace,
    this.propertyAddress,
    this.propertyDescription,
    this.propertyFinishType,
    this.propertyLocation,
    this.propertyName,
    this.uniqueID,
    this.uniquePostID,
    this.propertyPic,
  });

  factory SaleModel.fromMap(map){
    return SaleModel(


        NoOfKitchens:map["NoOfKitchens"],
        NoWashRooms:map["NoWashRooms"],
        areaInSquareFits:map["areaInSquareFits"],
        propertyPrice:map["propertyPrice"] ,
        balcony:map["balcony"],
        boundaryWall:map["boundaryWall"],
        entrances:map["entrances"],
        facing:map["facing"],
        garage:map["garage"],
        gatesForEntry:map["gatesforEntry"],
        landMarks:map["landMarks"],
        ownerName:map["ownerName"],
        parkingSpace:map["parkingSpace"],
        propertyAddress:map["propertyAddress"],
        propertyDescription:map["propertyDescription"],
        propertyFinishType:map["propertyFinishType"],
        propertyLocation:map["propertyLocation"],
        propertyName:map["propertyName"],
        uniqueID:map["uniqueID"],
        uniquePostID: map["uniquePostID"],
        propertyPic:map["propertyPic"],


    );
  }


  Map<String, dynamic> toMap() {
    return {

      "NoOfKitchens": NoOfKitchens,
      "NoWashRooms": NoWashRooms,
      "areaInSquareFits": areaInSquareFits,
      "balcony": balcony,
      "boundaryWall": boundaryWall,
      "entrances": entrances,
      "facing": facing,
      "garage": garage,
      "propertyPrice":propertyPrice,
      "gatesforEntry": gatesForEntry,
      "landMarks": landMarks,
      "ownerName": ownerName,
      "parkingSpace": parkingSpace,
      "propertyAddress": propertyAddress,
      "propertyDescription": propertyDescription,
      "propertyFinishType": propertyFinishType,
      "propertyLocation": propertyLocation,
      "propertyName": propertyName,
      "uniqueID": uniqueID,
      "uniquePostID":uniquePostID,
      "propertyPic":propertyPic,

    };
  }


}