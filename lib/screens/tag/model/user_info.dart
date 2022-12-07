class UserInfoModel {
  bool? status;
  String? message;
  List<Data>? data;

  UserInfoModel({this.status, this.message, this.data});

  UserInfoModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  User? user;
  Branch? branch;
  List<UserActivities>? userActivities;

  Data({this.user, this.branch, this.userActivities});

  Data.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    branch =
        json['branch'] != null ? new Branch.fromJson(json['branch']) : null;
    if (json['userActivities'] != null) {
      userActivities = <UserActivities>[];
      json['userActivities'].forEach((v) {
        userActivities!.add(new UserActivities.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    if (this.branch != null) {
      data['branch'] = this.branch!.toJson();
    }
    if (this.userActivities != null) {
      data['userActivities'] =
          this.userActivities!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class User {
  String? memberCode;
  String? userName;
  String? branchId;
  String? memberType;
  String? lastPaymentDate;
  String? photo;
  String? userType;
  String? memberStatus;
  String? birthdate;
  String? memberDate; 
  String? cardNumber;
  Category? category; 
  String? arabicMemberType;

  User(
      {this.memberCode,
      this.userName,
      this.branchId,
      this.memberType,
      this.lastPaymentDate,
      this.photo,
      this.userType,
      this.memberStatus,
      this.birthdate,
      this.memberDate,
       this.cardNumber,
      this.category, 
      this.arabicMemberType});

  User.fromJson(Map<String, dynamic> json) {
    memberCode = json['member_code'];
    userName = json['userName'];
    branchId = json['branchId'];
    memberType = json['member_type'];
    lastPaymentDate = json['last_payment_date'];
    photo = json['photo'];
    userType = json['userType'];
    memberStatus = json['member_status'];
    birthdate = json['birthdate'];
    memberDate = json['member_date'];
     cardNumber = json['card_number'];
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
     
 
    arabicMemberType = json['arabicMemberType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['member_code'] = this.memberCode;
    data['userName'] = this.userName;
    data['branchId'] = this.branchId;
    data['member_type'] = this.memberType;
    data['last_payment_date'] = this.lastPaymentDate;
    data['photo'] = this.photo;
    data['userType'] = this.userType;
    data['member_status'] = this.memberStatus;
    data['birthdate'] = this.birthdate;
    data['member_date'] = this.memberDate;
 
    data['card_number'] = this.cardNumber;
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
  
    data['arabicMemberType'] = this.arabicMemberType;
    return data;
  }
}

class Category {
  String? groupName;

  Category({this.groupName});

  Category.fromJson(Map<String, dynamic> json) {
    groupName = json['groupName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['groupName'] = this.groupName;
    return data;
  }
}

class Family {
  int? id;
  String? createDateTime;
  Null? createdBy;
  String? lastChangedDateTime;
  Null? lastChangedBy;
  String? name;
  String? photo;
  Null? education;
  Null? job;
  int? familyCode;
  bool? specialCase;
  String? gender;
  String? familyCategory;
  String? birthdate;
  String? memberDate;
  Null? activities;
  String? familyStatus;
  bool? isActive;
  String? lastCardPrinting;
  Null? nationality;
  Relation? relation;

  Family(
      {this.id,
      this.createDateTime,
      this.createdBy,
      this.lastChangedDateTime,
      this.lastChangedBy,
      this.name,
      this.photo,
      this.education,
      this.job,
      this.familyCode,
      this.specialCase,
      this.gender,
      this.familyCategory,
      this.birthdate,
      this.memberDate,
      this.activities,
      this.familyStatus,
      this.isActive,
      this.lastCardPrinting,
      this.nationality,
      this.relation});

  Family.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createDateTime = json['createDateTime'];
    createdBy = json['createdBy'];
    lastChangedDateTime = json['lastChangedDateTime'];
    lastChangedBy = json['lastChangedBy'];
    name = json['name'];
    photo = json['photo'];
    education = json['education'];
    job = json['job'];
    familyCode = json['family_code'];
    specialCase = json['special_case'];
    gender = json['gender'];
    familyCategory = json['family_category'];
    birthdate = json['birthdate'];
    memberDate = json['member_date'];
    activities = json['activities'];
    familyStatus = json['family_status'];
    isActive = json['isActive'];
    lastCardPrinting = json['lastCardPrinting'];
    nationality = json['nationality'];
    relation = json['relation'] != null
        ? new Relation.fromJson(json['relation'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['createDateTime'] = this.createDateTime;
    data['createdBy'] = this.createdBy;
    data['lastChangedDateTime'] = this.lastChangedDateTime;
    data['lastChangedBy'] = this.lastChangedBy;
    data['name'] = this.name;
    data['photo'] = this.photo;
    data['education'] = this.education;
    data['job'] = this.job;
    data['family_code'] = this.familyCode;
    data['special_case'] = this.specialCase;
    data['gender'] = this.gender;
    data['family_category'] = this.familyCategory;
    data['birthdate'] = this.birthdate;
    data['member_date'] = this.memberDate;
    data['activities'] = this.activities;
    data['family_status'] = this.familyStatus;
    data['isActive'] = this.isActive;
    data['lastCardPrinting'] = this.lastCardPrinting;
    data['nationality'] = this.nationality;
    if (this.relation != null) {
      data['relation'] = this.relation!.toJson();
    }
    return data;
  }
}

class Relation {
  String? name;
  String? title;
  String? id;
  String? createDateTime;
  Null? createdBy;
  String? lastChangedDateTime;
  Null? lastChangedBy;

  Relation(
      {this.name,
      this.title,
      this.id,
      this.createDateTime,
      this.createdBy,
      this.lastChangedDateTime,
      this.lastChangedBy});

  Relation.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    title = json['title'];
    id = json['id'];
    createDateTime = json['createDateTime'];
    createdBy = json['createdBy'];
    lastChangedDateTime = json['lastChangedDateTime'];
    lastChangedBy = json['lastChangedBy'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['title'] = this.title;
    data['id'] = this.id;
    data['createDateTime'] = this.createDateTime;
    data['createdBy'] = this.createdBy;
    data['lastChangedDateTime'] = this.lastChangedDateTime;
    data['lastChangedBy'] = this.lastChangedBy;
    return data;
  }
}

class Lockers {
  int? id;
  String? createDateTime;
  Null? createdBy;
  String? lastChangedDateTime;
  Null? lastChangedBy;
  String? location;
  String? size;
  int? number;
  int? amount;

  Lockers(
      {this.id,
      this.createDateTime,
      this.createdBy,
      this.lastChangedDateTime,
      this.lastChangedBy,
      this.location,
      this.size,
      this.number,
      this.amount});

  Lockers.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createDateTime = json['createDateTime'];
    createdBy = json['createdBy'];
    lastChangedDateTime = json['lastChangedDateTime'];
    lastChangedBy = json['lastChangedBy'];
    location = json['location'];
    size = json['size'];
    number = json['number'];
    amount = json['amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['createDateTime'] = this.createDateTime;
    data['createdBy'] = this.createdBy;
    data['lastChangedDateTime'] = this.lastChangedDateTime;
    data['lastChangedBy'] = this.lastChangedBy;
    data['location'] = this.location;
    data['size'] = this.size;
    data['number'] = this.number;
    data['amount'] = this.amount;
    return data;
  }
}

class Branch {
  int? id;
  String? branchName;
  String? arabicBranchName;

  Branch({this.id, this.branchName, this.arabicBranchName});

  Branch.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    branchName = json['branchName'];
    arabicBranchName = json['arabicBranchName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['branchName'] = this.branchName;
    data['arabicBranchName'] = this.arabicBranchName;
    return data;
  }
}

class UserActivities {
  int? id;
  String? activityName;

  UserActivities({this.id, this.activityName});

  UserActivities.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    activityName = json['activityName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['activityName'] = this.activityName;
    return data;
  }
}
