package ;

using sys.io.File;
using haxe.Json;
using StringTools;

import js.Node.*;

class Downloader {
  static function main() {
    var entities = '$__dirname/entities.json';

    Sys.command('curl https://html.spec.whatwg.org/entities.json > $entities');
    
    var data:haxe.DynamicAccess<{ characters: String }> = entities.getContent().parse();

    'src/html/Entities.hx'.saveContent('
package html;

// automatically generated!

class Entities {
  static public var all(default, null) = [
    ${[for (key => val in data) if (key.endsWith(';')) '"$key" => ${val.characters.stringify()}'].join(',\n    ')}
  ];
}
'.trim());
  }
}