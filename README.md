# Flutter Simple DLL FFI: use of a C++ DLL with Flutter
Following the official Microsoft walkthrough to create a DLL in C++, I created the indicated library that calculates Fibonacci numbers.
The Microsoft site suggests using the newly created library as an external library for another application always created in C++.
My goal is instead to integrate the DLL into a Flutter app to demonstrate how it is possible to combine the power of C++ with the flexibility of Flutter and thus create FrontEnds of our liking.
The need for this project comes from a project of mine in which I had to control a Laser Tracker to detect measurements in the production line. The Laser Tracker, like many high-level hardware, is supplied with DLLs that are part of its SDK written in C++.

# Contents
Using DLLs written in C++ with Flutter: allows you to use high-performance native code, while maintaining the modern and user-friendly interface that Flutter offers. This approach allows for greater efficiency and compatibility, especially in complex projects that require integration with systems, including hardware, of a different nature. Flutter, with the dart:ffi package, makes this integration simple, offering new development opportunities.

# Limitations
dart:ffi is closely tied to the native libraries of the platform (for example, Windows in this case), which can make portability to other platforms such as Android or iOS more difficult. On the other hand, even the DLLs themselves are tied to the platform on which they run.

# Credits
A special thanks goes to Microsoft developers who, when they want, know how to make the site lear.microsoft.com a really excellent source to turn to in order to increase our knowledge. In this case, the article (here), is really well done, the most difficult thing is just following the menus of visual studio if you have not installed it in English.

# Context
The need for this project was born from the need to make our applications written in Flutter interact with hardware and software of various kinds, for which the manufacturer may release SDKs written in C++.

# Compatibility
Currently, Simple DLL FFI has only been tested on the Windows operating system, given that DLLs are a peculiarity of this system.

# Conclusion
"Simple DLL FFI" offers a practical solution if you have direct access to the native library (DLL), using dart:ffi is a great option to avoid having to write native C++ code or
