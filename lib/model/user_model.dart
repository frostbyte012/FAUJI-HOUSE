class UserModel {

  String uid;
  String email;
  String firstName;
  String secondName;
  String userName;
  String dateOfBirth;
  String phoneNumber;
  String address;
  String workingStatus;
  String currentState;
  String homeState;
  String familyMembers;
  String accountType;
  String profilePicURl;


  UserModel({

    this.email,
    this.firstName,
    this.secondName,
    this.uid,
    this.currentState,
    this.workingStatus,
    this.accountType,
    this.address,
    this.dateOfBirth,
    this.familyMembers,
    this.homeState,
    this.phoneNumber,
    this.userName,
    this.profilePicURl,

  });


  //Receiving data to server

  factory UserModel.fromMap(map){
    return UserModel(

      email: map["email"],
      firstName: map["firstName"],
      secondName: map["secondName"],
      uid: map["uid"],
      userName: map["userName"],
      phoneNumber: map["phoneNumber"],
      familyMembers: map["familyMembers"],
      homeState: map["homeState"],
      accountType: map["accountType"],
      address: map["address"],
      currentState: map["currentState"],
      dateOfBirth: map["dateOfBirth"],
      workingStatus: map["workingStatus"],
      profilePicURl: map["profilePicURl"],
    );
  }

  //Sending data to server

  Map<String, dynamic> toMap() {
    return {

      "uid": uid,
      "email": email,
      "firstName": firstName,
      "secondName": secondName,
      "userName":userName,
      "phoneNumber":phoneNumber,
      "familyMembers":familyMembers,
      "homeState":homeState,
      "accountType":accountType,
      "address":address,
      "currentState":currentState,
      "dateOfBirth":dateOfBirth,
      "workingStatus":workingStatus,
      "profilePicURl":profilePicURl,

    };
  }
}