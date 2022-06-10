class CheckVotingModel {
  List<Data> data;
  int numOfVotes;
  bool success;

  CheckVotingModel({this.data, this.numOfVotes, this.success});

  CheckVotingModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
    numOfVotes = json['num_of_votes'];
    success = json['success'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    data['num_of_votes'] = this.numOfVotes;
    data['success'] = this.success;
    return data;
  }
}

class Data {
  int iD;
  int infectedId;
  String diagnose;
  int doctorId;
  String doctor;
  String patient;
  List<dynamic> ctScans;

  Data(
      {this.iD,
        this.infectedId,
        this.diagnose,
        this.doctorId,
        this.doctor,
        this.patient,
        this.ctScans});

  Data.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    infectedId = json['infected_id'];
    diagnose = json['diagnose'];
    doctorId = json['doctor_id'];
    doctor = json['doctor'];
    patient = json['patient'];
    if (json['ct_scans'] != null) {
      ctScans = <Null>[];
      json['ct_scans'].forEach((v) {
        ctScans.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    data['infected_id'] = this.infectedId;
    data['diagnose'] = this.diagnose;
    data['doctor_id'] = this.doctorId;
    data['doctor'] = this.doctor;
    data['patient'] = this.patient;
    if (this.ctScans != null) {
      data['ct_scans'] = this.ctScans.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
