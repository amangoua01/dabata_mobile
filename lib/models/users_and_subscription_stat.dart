class UsersAndSubscriptionStat {
  int usersAll = 0;
  int usersYear = 0;
  int souscriptionsAll = 0;
  int souscriptionsYear = 0;

  UsersAndSubscriptionStat(
      {this.usersAll = 0,
      this.usersYear = 0,
      this.souscriptionsAll = 0,
      this.souscriptionsYear = 0});

  UsersAndSubscriptionStat.fromJson(Map<String, dynamic> json) {
    usersAll = json['users_all'] ?? 0;
    usersYear = json['users_year'] ?? 0;
    souscriptionsAll = json['souscriptions_all'] ?? 0;
    souscriptionsYear = json['souscriptions_year'] ?? 0;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['users_all'] = usersAll;
    data['users_year'] = usersYear;
    data['souscriptions_all'] = souscriptionsAll;
    data['souscriptions_year'] = souscriptionsYear;
    return data;
  }
}
