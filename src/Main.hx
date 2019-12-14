import macromania.Parser;

class Main {

  static function main() {
  	var code = '
	using Abc.Def;
	namespace Abc.Hijk
	{
		// macro: set NamespaceName
		string namespaceName = default;

		public class Haha: ILaugh
		{
			// macro: set ClassName
			string className = default;

			public Haha()
			{
				// Constructor

				// macro: set MethodName
				string methodName = default;
				
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