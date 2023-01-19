class ApiConfig {
  ApiConfig._();

  //API Base URLs

  //For Live

  //For Uat
  static const String baseUrlUat = 'http://opsuat.projectstatus.in/api/';
  static const String commonBaseUrl = 'http://opsuat.projectstatus.in/';

  //For QA
  //static const String baseUrlUat = 'http://opsqa.projectstatus.in/api/';
  //static const String commonBaseUrl = 'http://opsqa.projectstatus.in/';

  //Live URls Main
  //static const String baseUrlUat = '';
  //static const String commonBaseUrl = '';
  //static const String termsConditionUrl = '$commonBaseUrl/terms-conditions';

  //Live URLS
  // static const String baseUrlUat = '';
  // static const String commonBaseUrl = '';

  //For DEMO
  //static const String baseUrlUat = 'http://opsdemo.projectstatus.in/api/';
  //static const String commonBaseUrl = 'http://opsdemo.projectstatus.in/';

  //Auth
  static const String login = 'api/UserAccount/Login';
  static const String signUp = 'api/UserAccount/SignUp';
  static const String forgotPass = 'api/UserAccount/ForgotPassword';
  static const String changePassword = 'api/UserAccount/ChangePassword';

  //Job management
  static const String jobStatusTypes = 'api/Job/getJobStatusTypes';
  static const String changeJobStatus = 'api/Job/changeJobStatus';
  static const String getJobsList = 'api/Job/getJobList';

  //Docket
  static const String getDocketData = 'api/Job/getDocketData';
  static const String updateDocketData = 'api/Job/updateDocket';
  static const String newDocket = 'api/Job/AddDocket';

  //Profile
  static const String getProfile = 'api/UserAccount/GetProfileDetails';
  static const String updateProfile = 'api/UserAccount/UpdateProfileDetails';

  //Announcements
  static const String getAnnouncements = 'api/Job/GetAnnouncementsList';
  static const String markAsReadAnnouncements =
      'api/Job/MarkAsReadAnnouncements';

  //Notifications
  static const String getNotifications = 'api/Job/getNotifications';
  static const String apiSendChatNotifications = 'api/Job/SendChatNotification';

  //Upload Document
  static const String uploadDocument = 'api/UserAccount/UploadStaffDocuments';

  //Virtual diary
  static const String getVirtualDiary = 'api/Job/GetVirtualDiaryList';
  static const String addRecordToVirtualDiary =
      'api/Job/AddRecordInVirtualDiary';
  static const String updateRecordInVirtualDiary =
      'api/Job/UpdateRecordInVirtualDiary';
  static const String deleteRecordInVirtualDiary =
      'api/Job/DeleteRecordInVirtualDiary';

  //Logout
  static const String apiLogout = 'api/UserAccount/Logout';
}
