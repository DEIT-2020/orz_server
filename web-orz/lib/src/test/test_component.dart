import 'package:angular/angular.dart';

import 'package:angular_components/app_layout/material_persistent_drawer.dart';

import 'package:angular_components/content/deferred_content.dart';

import 'package:angular_components/material_button/material_button.dart';

import 'package:angular_components/material_icon/material_icon.dart';

import 'package:angular_components/material_list/material_list.dart';

import 'package:angular_components/material_list/material_list_item.dart';

import 'package:angular_components/material_toggle/material_toggle.dart';



@Component(

  selector: 'mat-drawer-demo',

  directives: [

    DeferredContentDirective,

    MaterialButtonComponent,

    MaterialIconComponent,

    MaterialPersistentDrawerDirective,

    MaterialToggleComponent,

    MaterialListComponent,

    MaterialListItemComponent,

  ],

  templateUrl: 'test_component.html',

  styleUrls: [

    // 'test_component.scss.css',

    'package:angular_components/app_layout/layout.scss.css',

  ],

)

class MaterialDrawerExample {

  bool customWidth = false;

  bool end = false;

}