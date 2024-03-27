class DocumentModel {
  int id;
  String name;
  bool status;
  bool isRequired;
  bool hasExpiryDate;

  DocumentModel({
    required this.id,
    required this.name,
    required this.status,
    required this.isRequired,
    required this.hasExpiryDate,
  });

  factory DocumentModel.fromJson(Map<String, dynamic> json) {
    return DocumentModel(
      id: json['id'],
      name: json['name'],
      status: json['status'] == 1 ? true : false,
      isRequired: json['is_required'] == 1 ? true : false,
      hasExpiryDate: json['has_expiry_date'] == 1 ? true : false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'status': status,
      'is_required': isRequired,
      'has_expiry_date': hasExpiryDate,
    };
  }
}

class SubmittedDocument {
  int id;
  int driverId;
  String driverName;
  int documentId;
  String documentName;
  String image;

  SubmittedDocument({
    required this.id,
    required this.driverId,
    required this.driverName,
    required this.documentId,
    required this.documentName,
    required this.image,
  });

  factory SubmittedDocument.fromJson(Map<String, dynamic> json) {
    return SubmittedDocument(
      id: json['id'],
      driverId: json['driver_id'],
      driverName: json['driver_name'],
      documentId: json['document_id'],
      documentName: json['document_name'],
      image: json['driver_document'],
    );
  }
}
