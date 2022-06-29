class ProfiliFirebase{
  String? UserName;
  int? passi;
  int? passi_totali;

  Map<String, dynamic> toJason() => {'UserName': UserName, 'passi': passi, 'passi_totali': passi_totali};

  ProfiliFirebase.fromSnapshot(snapshot)
  : UserName = snapshot.data()['UserName'],
    passi = snapshot.data()['passi'],
    passi_totali = snapshot.data()['passi_totali'];
}