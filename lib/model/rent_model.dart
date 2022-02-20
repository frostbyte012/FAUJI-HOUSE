class RentModel{

  String NoOfKitchens;
  String NoWashRooms;
  String areaInSquareFits;
  String balcony;
  String boundaryWall;
  String entrances;
  String facing;
  String garage;
  String gatesforEntry;
  String landMarks;
  String ownerName;
  String parkingSpace;
  String propertyAddress;
  String propertyDescription;
  String propertyFinishType;
  String propertyLocation;
  String propertyName;
  String uniqueID;

  RentModel({
    this.NoOfKitchens,
    this.NoWashRooms,
    this.areaInSquareFits,
    this.balcony,
    this.boundaryWall,
    this.entrances,
    this.facing,
    this.garage,
    this.gatesforEntry,
    this.landMarks,
    this.ownerName,
    this.parkingSpace,
    this.propertyAddress,
    this.propertyDescription,
    this.propertyFinishType,
    this.propertyLocation,
    this.propertyName,
    this.uniqueID,
  });

  factory RentModel.fromMap(map){

    return RentModel(


        NoOfKitchens:map["NoOfKitchens"],
        NoWashRooms:map["NoWashRooms"],
        areaInSquareFits:map["areaInSquareFits"],
        balcony:map["balcony"],
        boundaryWall:map["boundaryWall"],
        entrances:map["entrances"],
        facing:map["facing"],
        garage:map["garage"],
        gatesforEntry:map["gatesforEntry"],
        landMarks:map["landMarks"],
        ownerName:map["ownerName"],
        parkingSpace:map["parkingSpace"],
        propertyAddress:map["propertyAddress"],
        propertyDescription:map["propertyDescription"],
        propertyFinishType:map["propertyFinishType"],
        propertyLocation:map["propertyLocation"],
        propertyName:map["propertyName"],
        uniqueID:map["uniqueID"],

        );


  }


  Map<String,dynamic> toMap(){

    return{

      "NoOfKitchens":NoOfKitchens,
      "NoWashRooms":NoWashRooms,
      "areaInSquareFits":areaInSquareFits,
      "balcony":balcony,
      "boundaryWall":boundaryWall,
      "entrances":entrances,
      "facing":facing,
      "garage":garage,
      "gatesforEntry":gatesforEntry,
      "landMarks":landMarks,
      "ownerName":ownerName,
      "parkingSpace":parkingSpace,
      "propertyAddress":propertyAddress,
      "propertyDescription":propertyDescription,
      "propertyFinishType":propertyFinishType,
      "propertyLocation":propertyLocation,
      "propertyName":propertyName,
      "uniqueID":uniqueID,

    };


  }













}