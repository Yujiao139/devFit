library project.constants;

bool isLoggedIn = false;
String appName = "app demo";
String appVersion = '0.0.1-RELEASE';
String sampleUserName = 'SampleUser';

/// supported activity type
List<String> activities = ['Running', 'Badminton', 'Walking', 'Workout'];
List<String> trainingAspects = ['Force', 'Speed']; // need refactor to a map
List<String> weekdayEnum = [
  'Monday',
  'Tuesday',
  'Wednesday',
  'Thursday',
  'Friday',
  'Saturday',
  'Sunday'
];
