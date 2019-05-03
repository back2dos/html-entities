package ;

class RunTests {
  static function main() 
    travix.Logger.exit(
      switch html.Entities.all['&amp;'] {
        case '&': 0;
        default: 500;
      }); 
}