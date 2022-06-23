import 'package:fitbitter/fitbitter.dart';
import '../utils/strings.dart';

class fitbit_data_class {
  dynamic? stepsData;
  dynamic? caloriesData;
  dynamic? stepsWeek;
  List<dynamic?> lista_data = [];
  List<dynamic> fitbitDeviceData = [];

  fitbit_data_class();

  void authorize(context) async {
    String? userId = await FitbitConnector.authorize(
        context: context,
        clientID: Strings.fitbitClientID,
        clientSecret: Strings.fitbitClientSecret,
        redirectUri: Strings.fitbitRedirectUri,
        callbackUrlScheme: Strings.fitbitCallbackScheme);

    await FitbitConnector.refreshToken(
        userID: Strings.userID,
        clientID: Strings.fitbitClientID,
        clientSecret: Strings.fitbitClientSecret);
  }

  // Future<dynamic>? refresh(context) async{
  //   dynamic? ref_token;
  //   // bool valid = await FitbitConnector.isTokenValid();
  //   // if (valid == false){
  //   //   await FitbitConnector.refreshToken(
  //   //     userID: Strings.userID,
  //   //     clientID: Strings.fitbitClientID,
  //   //     clientSecret: Strings.fitbitClientSecret);
  //   // }
  //   ref_token = await FitbitConnector.storage.read(key: 'fitbitRefreshToken');
  //   return ref_token!;
  // }

  Future<List> fetchData() async {
    FitbitActivityTimeseriesDataManager fitbit_steps =
        FitbitActivityTimeseriesDataManager(
      clientID: Strings.fitbitClientID,
      clientSecret: Strings.fitbitClientSecret,
      type: 'steps',
    );

    FitbitActivityTimeseriesDataManager fitbit_calories =
        FitbitActivityTimeseriesDataManager(
      clientID: Strings.fitbitClientID,
      clientSecret: Strings.fitbitClientSecret,
      type: 'calories',
    );

    //Fetch data

    dynamic stepsData =
        await fitbit_steps.fetch(FitbitActivityTimeseriesAPIURL.dayWithResource(
      date: DateTime.now().subtract(Duration(days: 0)),
      userID: Strings.userID,
      resource: fitbit_steps.type,
    )) as List<FitbitActivityTimeseriesData>;

    dynamic caloriesData = await fitbit_calories
        .fetch(FitbitActivityTimeseriesAPIURL.dayWithResource(
      date: DateTime.now().subtract(Duration(days: 0)),
      userID: Strings.userID,
      resource: fitbit_calories.type,
    )) as List<FitbitActivityTimeseriesData>;

  


    lista_data.add(stepsData[0].value);
    lista_data.add(caloriesData[0].value);

//fetchdevicedata
    FitbitDeviceDataManager fitbitDeviceDataManager = FitbitDeviceDataManager(
      clientID: Strings.fitbitClientID,
      clientSecret: Strings.fitbitClientSecret,
    );

    FitbitDeviceAPIURL fitbitDeviceApiUrl = FitbitDeviceAPIURL.withUserID(
      userID: Strings.userID,
    );

    fitbitDeviceData = await fitbitDeviceDataManager.fetch(fitbitDeviceApiUrl);

    lista_data.add(fitbitDeviceData);
//fetch devicedata

// fetch account data
    FitbitAccountDataManager fitbitAccountDataManager =
        FitbitAccountDataManager(
      clientID: Strings.fitbitClientID,
      clientSecret: Strings.fitbitClientSecret,
    );

    FitbitUserAPIURL fitbitUserApiUrl =
        FitbitUserAPIURL.withUserID(userID: Strings.userID);

    final fitbitAccountDatas =
        await fitbitAccountDataManager.fetch(fitbitUserApiUrl);
    FitbitAccountData fitbitAccountData =
        fitbitAccountDatas[0] as FitbitAccountData;

    lista_data.add(fitbitAccountData);
//FitbitAccountData;

// fetch heart data
    FitbitHeartDataManager fitbitHeartDataManager = FitbitHeartDataManager(
      clientID: Strings.fitbitClientID,
      clientSecret: Strings.fitbitClientSecret,
    );

    FitbitHeartAPIURL fitbitHeartApiUrl = FitbitHeartAPIURL.weekWithUserID(
      baseDate: DateTime.now(),
      userID: Strings.userID,
    );

    List<FitbitData> fitbitHeartData =
        await fitbitHeartDataManager.fetch(fitbitHeartApiUrl);
    lista_data.add(fitbitHeartData);
//fetch heartdata

//fetch sleepdata
    FitbitSleepDataManager fitbitSleepDataManager = FitbitSleepDataManager(
      clientID: Strings.fitbitClientID,
      clientSecret: Strings.fitbitClientSecret,
    );

    //today
    FitbitSleepAPIURL fitbitSleepAPIURL_today =
        FitbitSleepAPIURL.withUserIDAndDay(
      date: DateTime.now(),
      userID: Strings.userID,
    );

    List<FitbitData> fitbitSleep_today =
        await fitbitSleepDataManager.fetch(fitbitSleepAPIURL_today);
    lista_data.add(fitbitSleep_today);

    //yesterday
    FitbitSleepAPIURL fitbitSleepAPIURL_2 = FitbitSleepAPIURL.withUserIDAndDay(
      date: DateTime.now().subtract(Duration(days: 1)),
      userID: Strings.userID,
    );

    List<FitbitData> fitbitSleep_2 =
        await fitbitSleepDataManager.fetch(fitbitSleepAPIURL_2);
    lista_data.add(fitbitSleep_2);

    //3
    FitbitSleepAPIURL fitbitSleepAPIURL_3 = FitbitSleepAPIURL.withUserIDAndDay(
      date: DateTime.now().subtract(Duration(days: 2)),
      userID: Strings.userID,
    );

    List<FitbitData> fitbitSleep_3 =
        await fitbitSleepDataManager.fetch(fitbitSleepAPIURL_3);
    lista_data.add(fitbitSleep_3);

    //4
    FitbitSleepAPIURL fitbitSleepAPIURL_4 = FitbitSleepAPIURL.withUserIDAndDay(
      date: DateTime.now().subtract(Duration(days: 3)),
      userID: Strings.userID,
    );

    List<FitbitData> fitbitSleep_4 =
        await fitbitSleepDataManager.fetch(fitbitSleepAPIURL_4);
    lista_data.add(fitbitSleep_4);

    //5
    FitbitSleepAPIURL fitbitSleepAPIURL_5 = FitbitSleepAPIURL.withUserIDAndDay(
      date: DateTime.now().subtract(Duration(days: 4)),
      userID: Strings.userID,
    );

    List<FitbitData> fitbitSleep_5 =
        await fitbitSleepDataManager.fetch(fitbitSleepAPIURL_5);
    lista_data.add(fitbitSleep_5);

    //6
    FitbitSleepAPIURL fitbitSleepAPIURL_6 = FitbitSleepAPIURL.withUserIDAndDay(
      date: DateTime.now().subtract(Duration(days: 5)),
      userID: Strings.userID,
    );

    List<FitbitData> fitbitSleep_6 =
        await fitbitSleepDataManager.fetch(fitbitSleepAPIURL_6);
    lista_data.add(fitbitSleep_6);

    //7
    FitbitSleepAPIURL fitbitSleepAPIURL_7 = FitbitSleepAPIURL.withUserIDAndDay(
      date: DateTime.now().subtract(Duration(days: 6)),
      userID: Strings.userID,
    );

    List<FitbitData> fitbitSleep_7 =
        await fitbitSleepDataManager.fetch(fitbitSleepAPIURL_7);
    lista_data.add(fitbitSleep_7);
//fetch sleepdata


//week steps
    dynamic stepsData_7 =
        await fitbit_steps.fetch(FitbitActivityTimeseriesAPIURL.dayWithResource(
      date: DateTime.now().subtract(Duration(days: 7)),
      userID: Strings.userID,
      resource: fitbit_steps.type,
    )) as List<FitbitActivityTimeseriesData>;

    lista_data.add(stepsData_7);

    dynamic stepsData_6 =
        await fitbit_steps.fetch(FitbitActivityTimeseriesAPIURL.dayWithResource(
      date: DateTime.now().subtract(Duration(days: 6)),
      userID: Strings.userID,
      resource: fitbit_steps.type,
    )) as List<FitbitActivityTimeseriesData>;

    lista_data.add(stepsData_6);

    dynamic stepsData_5 =
        await fitbit_steps.fetch(FitbitActivityTimeseriesAPIURL.dayWithResource(
      date: DateTime.now().subtract(Duration(days: 5)),
      userID: Strings.userID,
      resource: fitbit_steps.type,
    )) as List<FitbitActivityTimeseriesData>;

    lista_data.add(stepsData_5);

    dynamic stepsData_4 =
        await fitbit_steps.fetch(FitbitActivityTimeseriesAPIURL.dayWithResource(
      date: DateTime.now().subtract(Duration(days: 4)),
      userID: Strings.userID,
      resource: fitbit_steps.type,
    )) as List<FitbitActivityTimeseriesData>;

    lista_data.add(stepsData_4);

    dynamic stepsData_3 =
        await fitbit_steps.fetch(FitbitActivityTimeseriesAPIURL.dayWithResource(
      date: DateTime.now().subtract(Duration(days: 3)),
      userID: Strings.userID,
      resource: fitbit_steps.type,
    )) as List<FitbitActivityTimeseriesData>;

    lista_data.add(stepsData_3);

    dynamic stepsData_2 =
        await fitbit_steps.fetch(FitbitActivityTimeseriesAPIURL.dayWithResource(
      date: DateTime.now().subtract(Duration(days: 2)),
      userID: Strings.userID,
      resource: fitbit_steps.type,
    )) as List<FitbitActivityTimeseriesData>;

    lista_data.add(stepsData_2);
//fetch activitydata
    FitbitActivityDataManager fitbitActivityDataManager =
        FitbitActivityDataManager(
      clientID: Strings.fitbitClientID,
      clientSecret: Strings.fitbitClientSecret,
    );

//today
    FitbitActivityAPIURL fitbitActivityApiUrl_today = FitbitActivityAPIURL.day(
      date: DateTime.now(),
      userID: Strings.userID,
    );
    List<FitbitData> fitbitActivityData_today =
        await fitbitActivityDataManager.fetch(fitbitActivityApiUrl_today);
    lista_data.add(fitbitActivityData_today);

    //yesterday
    FitbitActivityAPIURL fitbitActivityApiUrl_2 = FitbitActivityAPIURL.day(
      date: DateTime.now().subtract(Duration(days: 1)),
      userID: Strings.userID,
    );
    List<FitbitData> fitbitActivityData_2 =
        await fitbitActivityDataManager.fetch(fitbitActivityApiUrl_2);
    lista_data.add(fitbitActivityData_2);

    //3
    FitbitActivityAPIURL fitbitActivityApiUrl_3 = FitbitActivityAPIURL.day(
      date: DateTime.now().subtract(Duration(days: 2)),
      userID: Strings.userID,
    );
    List<FitbitData> fitbitActivityData_3 =
        await fitbitActivityDataManager.fetch(fitbitActivityApiUrl_3);
    lista_data.add(fitbitActivityData_3);

    //4
    FitbitActivityAPIURL fitbitActivityApiUrl_4 = FitbitActivityAPIURL.day(
      date: DateTime.now().subtract(Duration(days: 3)),
      userID: Strings.userID,
    );
    List<FitbitData> fitbitActivityData_4 =
        await fitbitActivityDataManager.fetch(fitbitActivityApiUrl_4);
    lista_data.add(fitbitActivityData_4);

    //5
    FitbitActivityAPIURL fitbitActivityApiUrl_5 = FitbitActivityAPIURL.day(
      date: DateTime.now().subtract(Duration(days: 4)),
      userID: Strings.userID,
    );
    List<FitbitData> fitbitActivityData_5 =
        await fitbitActivityDataManager.fetch(fitbitActivityApiUrl_5);
    lista_data.add(fitbitActivityData_5);

    //6
    FitbitActivityAPIURL fitbitActivityApiUrl_6 = FitbitActivityAPIURL.day(
      date: DateTime.now().subtract(Duration(days: 5)),
      userID: Strings.userID,
    );
    List<FitbitData> fitbitActivityData_6 =
        await fitbitActivityDataManager.fetch(fitbitActivityApiUrl_6);
    lista_data.add(fitbitActivityData_6);

    //7
    FitbitActivityAPIURL fitbitActivityApiUrl_7 = FitbitActivityAPIURL.day(
      date: DateTime.now().subtract(Duration(days: 6)),
      userID: Strings.userID,
    );
    List<FitbitData> fitbitActivityData_7 =
        await fitbitActivityDataManager.fetch(fitbitActivityApiUrl_7);
    lista_data.add(fitbitActivityData_7);
//fetch activitydata

// fetch timeseries data

    //calories
    FitbitActivityTimeseriesDataManager fitbitCaloriesTimeseriesManager =
        FitbitActivityTimeseriesDataManager(
            clientID: Strings.fitbitClientID,
            clientSecret: Strings.fitbitClientSecret,
            type: 'calories');

    FitbitActivityTimeseriesAPIURL fitbitCaloriesTimeseriesApiUrl =
        FitbitActivityTimeseriesAPIURL.weekWithResource(
      baseDate: DateTime.now(),
      userID: Strings.userID,
      resource: 'calories',
    );

    List<FitbitData> fitbitCaloriesTimeseriesData_week =
        await fitbitCaloriesTimeseriesManager
            .fetch(fitbitCaloriesTimeseriesApiUrl);

    lista_data.add(fitbitCaloriesTimeseriesData_week);

    //steps
    FitbitActivityTimeseriesDataManager fitbitStepsTimeseriesManager =
        FitbitActivityTimeseriesDataManager(
            clientID: Strings.fitbitClientID,
            clientSecret: Strings.fitbitClientSecret,
            type: 'steps');

    FitbitActivityTimeseriesAPIURL fitbitStepsTimeseriesApiUrl =
        FitbitActivityTimeseriesAPIURL.weekWithResource(
      baseDate: DateTime.now(),
      userID: Strings.userID,
      resource: 'steps',
    );

    List<FitbitData> fitbitStepsTimeseriesData_week =
        await fitbitStepsTimeseriesManager.fetch(fitbitStepsTimeseriesApiUrl);

    lista_data.add(fitbitStepsTimeseriesData_week);

    //distance
    FitbitActivityTimeseriesDataManager fitbitDistanceTimeseriesManager =
        FitbitActivityTimeseriesDataManager(
            clientID: Strings.fitbitClientID,
            clientSecret: Strings.fitbitClientSecret,
            type: 'distance');

    FitbitActivityTimeseriesAPIURL fitbitDistanceTimeseriesApiUrl =
        FitbitActivityTimeseriesAPIURL.weekWithResource(
      baseDate: DateTime.now(),
      userID: Strings.userID,
      resource: 'distance',
    );

    List<FitbitData> fitbitDistanceTimeseriesData_week =
        await fitbitDistanceTimeseriesManager
            .fetch(fitbitDistanceTimeseriesApiUrl);

    lista_data.add(fitbitDistanceTimeseriesData_week);

    //floors
    FitbitActivityTimeseriesDataManager fitbitFloorsTimeseriesManager =
        FitbitActivityTimeseriesDataManager(
            clientID: Strings.fitbitClientID,
            clientSecret: Strings.fitbitClientSecret,
            type: 'floors');

    FitbitActivityTimeseriesAPIURL fitbitFloorsTimeseriesApiUrl =
        FitbitActivityTimeseriesAPIURL.weekWithResource(
      baseDate: DateTime.now(),
      userID: Strings.userID,
      resource: 'floors',
    );

    List<FitbitData> fitbitFloorsTimeseriesData_week =
        await fitbitFloorsTimeseriesManager.fetch(fitbitFloorsTimeseriesApiUrl);

    lista_data.add(fitbitFloorsTimeseriesData_week);

    //elevation
    FitbitActivityTimeseriesDataManager fitbitElevationTimeseriesManager =
        FitbitActivityTimeseriesDataManager(
            clientID: Strings.fitbitClientID,
            clientSecret: Strings.fitbitClientSecret,
            type: 'elevation');

    FitbitActivityTimeseriesAPIURL fitbitElevationTimeseriesApiUrl =
        FitbitActivityTimeseriesAPIURL.weekWithResource(
      baseDate: DateTime.now(),
      userID: Strings.userID,
      resource: 'elevation',
    );

    List<FitbitData> fitbitElevationTimeseriesData_week =
        await fitbitElevationTimeseriesManager
            .fetch(fitbitElevationTimeseriesApiUrl);

    lista_data.add(fitbitElevationTimeseriesData_week);

    //minutesSedentary
    FitbitActivityTimeseriesDataManager
        fitbitminutesSedentaryTimeseriesManager =
        FitbitActivityTimeseriesDataManager(
            clientID: Strings.fitbitClientID,
            clientSecret: Strings.fitbitClientSecret,
            type: 'minutesSedentary');

    FitbitActivityTimeseriesAPIURL fitbitminutesSedentaryTimeseriesApiUrl =
        FitbitActivityTimeseriesAPIURL.weekWithResource(
      baseDate: DateTime.now(),
      userID: Strings.userID,
      resource: 'minutesSedentary',
    );

    List<FitbitData> fitbitminutesSedentaryTimeseriesData_week =
        await fitbitminutesSedentaryTimeseriesManager
            .fetch(fitbitminutesSedentaryTimeseriesApiUrl);

    lista_data.add(fitbitminutesSedentaryTimeseriesData_week);

    //minutesLightliActive
    FitbitActivityTimeseriesDataManager
        fitbitminutesLightlyActiveTimeseriesManager =
        FitbitActivityTimeseriesDataManager(
            clientID: Strings.fitbitClientID,
            clientSecret: Strings.fitbitClientSecret,
            type: 'minutesLightlyActive');

    FitbitActivityTimeseriesAPIURL fitbitminutesLightlyActiveTimeseriesApiUrl =
        FitbitActivityTimeseriesAPIURL.weekWithResource(
      baseDate: DateTime.now(),
      userID: Strings.userID,
      resource: 'minutesLightlyActive',
    );

    List<FitbitData> fitbitminutesLightlyActiveTimeseriesData_week =
        await fitbitminutesLightlyActiveTimeseriesManager
            .fetch(fitbitminutesLightlyActiveTimeseriesApiUrl);

    lista_data.add(fitbitminutesLightlyActiveTimeseriesData_week);

    //minutesFairlyActive
    FitbitActivityTimeseriesDataManager
        fitbitminutesFairlyActiveTimeseriesManager =
        FitbitActivityTimeseriesDataManager(
            clientID: Strings.fitbitClientID,
            clientSecret: Strings.fitbitClientSecret,
            type: 'minutesFairlyActive');

    FitbitActivityTimeseriesAPIURL fitbitminutesFairlyActiveTimeseriesApiUrl =
        FitbitActivityTimeseriesAPIURL.weekWithResource(
      baseDate: DateTime.now(),
      userID: Strings.userID,
      resource: 'minutesFairlyActive',
    );

    List<FitbitData> fitbitminutesFairlyActiveTimeseriesData_week =
        await fitbitminutesFairlyActiveTimeseriesManager
            .fetch(fitbitminutesFairlyActiveTimeseriesApiUrl);

    lista_data.add(fitbitminutesFairlyActiveTimeseriesData_week);

    //minutesVeryActive
    FitbitActivityTimeseriesDataManager
        fitbitminutesVeryActiveTimeseriesManager =
        FitbitActivityTimeseriesDataManager(
            clientID: Strings.fitbitClientID,
            clientSecret: Strings.fitbitClientSecret,
            type: 'minutesVeryActive');

    FitbitActivityTimeseriesAPIURL fitbitminutesVeryActiveTimeseriesApiUrl =
        FitbitActivityTimeseriesAPIURL.weekWithResource(
      baseDate: DateTime.now(),
      userID: Strings.userID,
      resource: 'minutesVeryActive',
    );

    List<FitbitData> fitbitminutesVeryActiveTimeseriesData_week =
        await fitbitminutesVeryActiveTimeseriesManager
            .fetch(fitbitminutesVeryActiveTimeseriesApiUrl);

    lista_data.add(fitbitminutesVeryActiveTimeseriesData_week);

    //activityCalories
    FitbitActivityTimeseriesDataManager
        fitbitactivityCaloriesTimeseriesManager =
        FitbitActivityTimeseriesDataManager(
            clientID: Strings.fitbitClientID,
            clientSecret: Strings.fitbitClientSecret,
            type: 'activityCalories');

    FitbitActivityTimeseriesAPIURL fitbitactivityCaloriesTimeseriesApiUrl =
        FitbitActivityTimeseriesAPIURL.weekWithResource(
      baseDate: DateTime.now(),
      userID: Strings.userID,
      resource: 'activityCalories',
    );

    List<FitbitData> fitbitactivityCaloriesTimeseriesData_week =
        await fitbitactivityCaloriesTimeseriesManager
            .fetch(fitbitactivityCaloriesTimeseriesApiUrl);

    lista_data.add(fitbitactivityCaloriesTimeseriesData_week);

//fetch timeseries data

    return lista_data;
  }

  dynamic retVal() {
    return this.lista_data;
  }
}
