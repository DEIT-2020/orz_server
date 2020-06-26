import 'dart:async';

import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'package:stream_transform/stream_transform.dart';

import '../route_paths.dart';
import '../service/question_service.dart';
import '../model/question.dart';

@Component(
  selector: 'app-online-blockly',
  templateUrl: 'online_blockly_component.html',
  styleUrls: ['online_blockly_component.css'],
  directives: [coreDirectives],
  providers: [ClassProvider(QuestionService)],
  pipes: [commonPipes],
)



class QuestionBankComponent implements OnActivate {
  Question question;
  final QuestionService _questionbankService;
  final Location _location;

  QuestionBankComponent(this._questionbankService, this._location);

  @override
  void onActivate(_, RouterState current) async {
    final id = getId(current.parameters);
    if (id != null) question = await (_questionbankService.get(id));
  }

  Future<void> save() async {
    await _questionbankService.update(question);
    goBack();
  }

  void goBack() => _location.back();
}
