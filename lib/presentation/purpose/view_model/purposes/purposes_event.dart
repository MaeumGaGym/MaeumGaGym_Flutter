import 'package:maeumgagym_flutter/data/purpose/dto/request/add_purpsoe_request.dart';

abstract class PurposesEvent {}

class GetPurposesInitEvent extends PurposesEvent {
  GetPurposesInitEvent();
}

class AddPurposeEvent extends PurposesEvent {
  final AddEditPurposeRequest addEditPurposeRequest;

  AddPurposeEvent({required this.addEditPurposeRequest});
}

class EditPurposeEvent extends PurposesEvent {
  final int purposeId;
  final AddEditPurposeRequest addEditPurposeRequest;

  EditPurposeEvent({
    required this.purposeId,
    required this.addEditPurposeRequest,
  });
}

class DelPurposeEvent extends PurposesEvent {
  final int purposeId;

  DelPurposeEvent({
    required this.purposeId,
  });
}