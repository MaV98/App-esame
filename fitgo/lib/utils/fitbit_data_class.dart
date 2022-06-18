import 'package:fitbitter/fitbitter.dart';
import '../utils/strings.dart';

class fitbit_data_class {
  dynamic? stepsData;
  dynamic? caloriesData;
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

    FitbitHeartData fitbitHeartData = await fitbitHeartDataManager
        .fetch(fitbitHeartApiUrl) as FitbitHeartData;

    lista_data.add(fitbitHeartData);
//fetch heartdata

    return lista_data;
  }

  dynamic retVal() {
    return this.lista_data;
  }

  // Future<List> fetchDevicedata(context) async {
  //   //Instantiate a proper data manager
  //   FitbitDeviceDataManager fitbitDeviceDataManager = FitbitDeviceDataManager(
  //     clientID: Strings.fitbitClientID,
  //     clientSecret: Strings.fitbitClientSecret,
  //   );

  //   //fetch data
  //   FitbitDeviceAPIURL fitbitDeviceApiUrl = FitbitDeviceAPIURL.withUserID(
  //     userID: Strings.userID,
  //   );

  //   //get data
  //   return fitbitDeviceData =
  //       await fitbitDeviceDataManager.fetch(fitbitDeviceApiUrl);
  // }
}
