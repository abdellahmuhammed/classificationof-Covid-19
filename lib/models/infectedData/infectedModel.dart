 class  InfectedModel {
  List<Data> data;
  bool success;

  InfectedModel({this.data, this.success});

  InfectedModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data.add( Data.fromJson(v));
      });
    }
    success = json['success'];
  }

}

class Data {
  int iD;
  int patientId;
  String infectionDate;
  int doctorId;
  dynamic status;
  String doctor;
  dynamic patient;
  int patientAge;
  List<CtScans> ctScans;
  List<String> ctScansUrls;

  Data(
      {this.iD,
        this.patientId,
        this.infectionDate,
        this.doctorId,
        this.status,
        this.doctor,
        this.patient,
        this.patientAge,
        this.ctScans,
        this.ctScansUrls});

  Data.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    patientId = json['patient_id'];
    infectionDate = json['infection_date'];
    doctorId = json['doctor_id'];
    status = json['status'];
    doctor = json['doctor'];
    patient = json['patient'];
    patientAge = json['patient_age'];
    if (json['ct_scans'] != null) {
      ctScans = <CtScans>[];
      json['ct_scans'].forEach((v) {
        ctScans.add(new CtScans.fromJson(v));
      });
    }
    ctScansUrls = json['ct_scans_urls'].cast<String>();
  }

}

class CtScans {
  int iD;
  int infectedId;
  String date;
  int numOfImgs;

  CtScans({this.iD, this.infectedId, this.date, this.numOfImgs});

  CtScans.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    infectedId = json['infected_id'];
    date = json['date'];
    numOfImgs = json['num_of_imgs'];
  }

}
