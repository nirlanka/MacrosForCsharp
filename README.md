MacrosForCsharp
===============

A macro system for C# code with a simple+fast parser. (work ongoing)

This is intended to be a static code replacing mechanism. It may be used for doing 
meta-programming in C# without resorting to reflections.

## Example 1

Assume you want to print the name of the method inside each print statement. 
You can do that dynamically:

```cs
... MethodFoo([System.Runtime.CompilerServices.CallerMemberName] string methodName = "", ...) 
{
  Console.WriteLine(methodName + ": " + "Original string");
  
  ...
}
```

But it's still slow. The fastest way to do this without compromising runtime performance
is to utilize a macro. But there's no existing built-in macro for this.

But what if we could have a build step that replaced a given constant string declaration 
before the compilation step?

```cs
... MethodFoo(...)
{
  // macro: set MethodName
  string methodName = default;
  Console.WriteLine(methodName + ": " + "Original string");
  
  ...
}
```

Then, running our macro-handler script will turn that code into the following:

```cs
... MethodFoo(...)
{
  // macro: set MethodName
  string methodName = "MethodFoo";
  Console.WriteLine(methodName + ": " + "Original string");
  
  ...
}
```

There's no need to manually maintain references, compromise speed with reflections, 
or bend over backwards using attributes.

## Example 2

Assume there's a class with a large number of properties. You want to print the name of 
each one of those member properties.

Assume we are backed up against a wall: You can't convert those props 
into a list of some generic prop class due to performance in accessing them as members;
you don't want to use reflections and slow things down either. There are 3 options:

1. Manually write/copy-paste print statements for each prop by hard-coding names
2. Create copies of a template string of the statement through an external tool and 
manually update the result each time a prop is changed
3. Use a macro system as a part of the build steps to statically keep the names
up to date as well as have the best performance in doing that

I understand I might sound hyperbolic when saying this, but the 3rd option is the goal
of this macro system.

## Inspiration

I have worked on a few large codebases with situations and requirements similar to both
examples given above. This [gist](https://gist.github.com/nirlanka/ce13d45c58d8530cc437b672801823c6)
contains an early version of a script I made to handle one such scenario. 

There, for cases similar to the 2nd example, I sometimes 
used Sublime Text 3 for quickly and conveniently creating multiple statements.

Handling cases similar to the 1st example made me think of creating a generic
and powerful macro system. I was leaving that project for a more front-end oriented
position at a different company, but I wanted to try this idea out for the pure fun
of it.

When writing the parser part, I started with simple experiments covered in these gists: 
[1](https://gist.github.com/nirlanka/8d573803b0241bbdec7cccf120f5010c), 
[2](https://gist.github.com/nirlanka/d240786003f00db2d98cbdecd79585b1).

## State of the project

This repository is not yet even close to a good proof-of-concept.

I'm writing the parser in Haxe, so that it can be compiled to any of the variety
of target languages it supports. I'm learning it as I go.

## Feedback

I'd love to hear your ideas about similar problems, the practicality of my intended
solution, feedback about my implementation, etc. I'm no expert in this and would
love to hear your ideas and suggestions.
