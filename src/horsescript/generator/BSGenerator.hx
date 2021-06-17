package horsescript.generator;

import haxe.macro.Context;
import haxe.macro.Type;

class BSGenerator {

    // Register the generation callback
    public static function register() {
        trace("REGISTER");

        Context.onGenerate(BSGenerator.onGenerate);
    }

    function new() {}

    // Called from the compiler just before generation
    static function onGenerate(types: Array<Type>) {
        for(type in types) {
            switch type {
                case TInst(t, params): {
                    final classType = t.get();
                    final pack = classType.pack;
                    if(pack.length == 0 
                        || pack[0] == "haxe" 
                        || pack[0] == "sys"
                        || pack[0].charAt(0) == "_" ) {
                        continue;
                    }

                    trace(classType.pack.join(".") + "." + classType.name);
                }
                default: false;
            }
        }
    }
}