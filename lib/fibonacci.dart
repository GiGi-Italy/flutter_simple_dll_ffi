import 'dart:ffi'; // Dart FFI
import 'dart:io'; // For loading the DLL

// define type for native function and dart function
typedef FibonacciInitNative = Void Function(Uint64, Uint64);
typedef FibonacciInitDart = void Function(int, int);

typedef FibonacciCurrentNative = Uint64 Function();
typedef FibonacciCurrentDart = int Function();

typedef FibonacciNextNative = Uint8 Function();
typedef FibonacciNextDart = int Function();
/* NOTE
the native function fibonacci_next returns a bool status but
when it became to handle the export out of a DLL file, dart will handle lika a Uint8 
(1 byte where 0 = false and 1 = true)
*/

typedef FibonacciIndexNative = Uint64 Function();
typedef FibonacciIndexDart = int Function();

class Fibonacci {
  late final DynamicLibrary _lib;

  // load native DLL file
  Fibonacci() {
    if (Platform.isWindows) {
      _lib = DynamicLibrary.open('fibonacci.dll');
    } else {
      throw UnsupportedError('Unsupported platform');
    }
  }

  // Connect with native funtion
  late final FibonacciInitDart fibonacciInit = _lib
      .lookup<NativeFunction<FibonacciInitNative>>('fibonacci_init')
      .asFunction();

  late final FibonacciCurrentDart fibonacciCurrent = _lib
      .lookup<NativeFunction<FibonacciCurrentNative>>('fibonacci_current')
      .asFunction();

  late final FibonacciNextDart fibonacciNext = _lib
      .lookup<NativeFunction<FibonacciNextNative>>('fibonacci_next')
      .asFunction();

  late final FibonacciIndexDart fibonacciIndex = _lib
      .lookup<NativeFunction<FibonacciIndexNative>>('fibonacci_index')
      .asFunction();
}
