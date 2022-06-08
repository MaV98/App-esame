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
  }

  Future<List> fetchData() async {
    //Instantiate a proper data manager
    FitbitActivityTimeseriesDataManager fitbit_steps =
        FitbitActivityTimeseriesDataManager(
      clientID: Strings.fitbitClientID,
      clientSecret: Strings.fitbitClientSecret,
      type: 'steps',
      //type: 'calories',
    );

    FitbitActivityTimeseriesDataManager fitbit_calories =
        FitbitActivityTimeseriesDataManager(
      clientID: Strings.fitbitClientID,
      clientSecret: Strings.fitbitClientSecret,
      type: 'calories',
      //type: 'calories',
    );

    //Fetch data

    dynamic stepsData =
        await fitbit_steps.fetch(FitbitActivityTimeseriesAPIURL.dayWithResource(
      date: DateTime.now().subtract(Duration(days: 1)),
      userID: Strings.userID,
      resource: fitbit_steps.type,
    )) as List<FitbitActivityTimeseriesData>;

    dynamic caloriesData = await fitbit_calories
        .fetch(FitbitActivityTimeseriesAPIURL.dayWithResource(
      date: DateTime.now().subtract(Duration(days: 1)),
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

    //fetch data
    FitbitDeviceAPIURL fitbitDeviceApiUrl = FitbitDeviceAPIURL.withUserID(
      userID: Strings.userID,
    );

    //get data
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

    return lista_data;
    // caloriesData;
  }

  dynamic retVal() {
    return this.lista_data;
  }

  Future<List> fetchDevicedata(context) async {
    //Instantiate a proper data manager
    FitbitDeviceDataManager fitbitDeviceDataManager = FitbitDeviceDataManager(
      clientID: Strings.fitbitClientID,
      clientSecret: Strings.fitbitClientSecret,
    );

    //fetch data
    FitbitDeviceAPIURL fitbitDeviceApiUrl = FitbitDeviceAPIURL.withUserID(
      userID: Strings.userID,
    );

    //get data
    return fitbitDeviceData =
        await fitbitDeviceDataManager.fetch(fitbitDeviceApiUrl);
  }
}
