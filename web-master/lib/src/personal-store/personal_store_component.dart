import 'dart:async';

import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'package:stream_transform/stream_transform.dart';

import '../route_paths.dart';
import '../service/blocklyuser_service.dart';
import '../model/blocklyuser.dart';

@Component(
  selector: 'app-personal-store',
  templateUrl: 'personal_store_component.html',
  styleUrls: ['personal_store_component.css'],
  directives: [coreDirectives],
  providers: [ClassProvider(BlocklyuserService)],
  pipes: [commonPipes],
)



class UserComponent implements OnActivate {
  Blocklyuser blocklyuser;
  final BlocklyuserService _questionbankService;
  final Location _location;

  UserComponent(this._questionbankService, this._location);

  @override
  void onActivate(_, RouterState current) async {
    final id = getId(current.parameters);
    if (id != null) blocklyuser = await (_questionbankService.get(id));
  }

  Future<void> save() async {
    await _questionbankService.update(blocklyuser);
    goBack();
  }

  void goBack() => _location.back();
}
