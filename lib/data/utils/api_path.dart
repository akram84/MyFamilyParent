class ApiPaths {
  static const String base = 'https://us-central1-family-88c8c.cloudfunctions.net/familyFinal/api/v1';

  static const String parent = '$base/parent';
  static const String logout = '$parent/logout';
  static const String deactivate = '$parent/remove';
  static const String login = '$parent/login';
  static const String register = '$parent/register';
  static const String addMember = '$parent/addMember';
  static const String updateProfile = '$parent/updateProfile';
  static const String changePassword = '$parent/changePassword';

  static const String todo = '$base/todo';
  static const String getTodos = '$todo/getTasks';
  static const String addTodo = '$todo/addTask';

  static const String getChildren = '$base/child/getChildren';
  static const String getHelpers = '$base/helper/getHelpers';


  static const String entertainment = '$base/entertainment';
  static const String getEntertainments = '$entertainment/getAllEntertainment';
  static const String addEntertainment = '$entertainment/addEntertainment';
  static const String vote = '$entertainment/vote';

  static const String study = '$base/study';
  static const String getStudies = '$study/getStudies';
  static const String addStudy = '$study/addSubject';

  static const String chat = '$base/chat';
  static const String getChats = '$chat/list';
  static const String getMessages = '$chat/listMessages';

  static const String getGroups = '$base/group/listGroups';
  static const String createGroup = '$base/group/createGroup';

  static const String getEvents = '$base/event/list';
  static const String addEvent = '$base/event/add';

  static const String getNotifications = '$base/notification/list';
  static const String forwardNotification = '$base/notification/forward';
}
