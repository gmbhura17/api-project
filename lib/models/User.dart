class User {
  int id;
  String name;
  String email;
  String emailVerifiedAt;
  String userSessionToken;
  String deviceToken;
  String deviceOs;
  String passwordLock;
  String gratitude;
  String gratitudeTime;
  String gratitudeRescheduleTime;
  String serverGratitudeTime;
  String serverGratitudeRescheduleTime;
  String affirmation;
  String affirmationTime;
  String serverAffirmationTime;
  String status;
  String versionType;
  String group;
  String version;
  String timeZone;
  String ipAddress;
  String createdAt;
  String updatedAt;
  String lastLoginAt;
  String experienceSubmit;

  User(
      {this.id,
        this.name,
        this.email,
        this.emailVerifiedAt,
        this.userSessionToken,
        this.deviceToken,
        this.deviceOs,
        this.passwordLock,
        this.gratitude,
        this.gratitudeTime,
        this.gratitudeRescheduleTime,
        this.serverGratitudeTime,
        this.serverGratitudeRescheduleTime,
        this.affirmation,
        this.affirmationTime,
        this.serverAffirmationTime,
        this.status,
        this.versionType,
        this.group,
        this.version,
        this.timeZone,
        this.ipAddress,
        this.createdAt,
        this.updatedAt,
        this.lastLoginAt,
        this.experienceSubmit});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    userSessionToken = json['user_session_token'];
    deviceToken = json['device_token'];
    deviceOs = json['device_os'];
    passwordLock = json['password_lock'];
    gratitude = json['gratitude'];
    gratitudeTime = json['gratitude_time'];
    gratitudeRescheduleTime = json['gratitude_reschedule_time'];
    serverGratitudeTime = json['server_gratitude_time'];
    serverGratitudeRescheduleTime = json['server_gratitude_reschedule_time'];
    affirmation = json['affirmation'];
    affirmationTime = json['affirmation_time'];
    serverAffirmationTime = json['server_affirmation_time'];
    status = json['status'];
    versionType = json['version_type'];
    group = json['group'];
    version = json['version'];
    timeZone = json['time_zone'];
    ipAddress = json['ip_address'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    lastLoginAt = json['last_login_at'];
    experienceSubmit = json['experience_submit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['user_session_token'] = this.userSessionToken;
    data['device_token'] = this.deviceToken;
    data['device_os'] = this.deviceOs;
    data['password_lock'] = this.passwordLock;
    data['gratitude'] = this.gratitude;
    data['gratitude_time'] = this.gratitudeTime;
    data['gratitude_reschedule_time'] = this.gratitudeRescheduleTime;
    data['server_gratitude_time'] = this.serverGratitudeTime;
    data['server_gratitude_reschedule_time'] =
        this.serverGratitudeRescheduleTime;
    data['affirmation'] = this.affirmation;
    data['affirmation_time'] = this.affirmationTime;
    data['server_affirmation_time'] = this.serverAffirmationTime;
    data['status'] = this.status;
    data['version_type'] = this.versionType;
    data['group'] = this.group;
    data['version'] = this.version;
    data['time_zone'] = this.timeZone;
    data['ip_address'] = this.ipAddress;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['last_login_at'] = this.lastLoginAt;
    data['experience_submit'] = this.experienceSubmit;
    return data;
  }
}
