class ProfiliFirebase{
  String? UserName;
  int? passi;

  Map<String, dynamic> toJason() => {'UserName': UserName, 'passi': passi};

  ProfiliFirebase.fromSnapshot(snapshot)
  : UserName = snapshot.data()['UserName'],
    passi = snapshot.data()['passi'];
}