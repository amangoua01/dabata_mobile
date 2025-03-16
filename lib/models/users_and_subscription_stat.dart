class UsersAndSubscriptionStat {
  int? usersAll;
  int? usersYear;
  int? souscriptionsAll;
  int? souscriptionsYear;

  UsersAndSubscriptionStat(
      {this.usersAll,
      this.usersYear,
      this.souscriptionsAll,
      this.souscriptionsYear});

  UsersAndSubscriptionStat.fromJson(Map<String, dynamic> json) {
    usersAll = json['users_all'];
    usersYear = json['users_year'];
    souscriptionsAll = json['souscriptions_all'];
    souscriptionsYear = json['souscriptions_year'];
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
