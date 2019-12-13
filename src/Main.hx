import macromania.Parser;

class Main {

  static function main() {
  	var code = '
	using Abc.Def;
	namespace Abc.Hijk
	{
		public class Haha: ILaugh
		{
			public Haha()
			{
				// Constructor
			}
			public void Foo()
			{
				// Foo
			}
			private List<Xy.Zw> Bar()
			{
				// Bar
			}
		}
	}
	';

	(new Parser(code)).parse().trace();
  }
}