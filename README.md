# Syringe Framework

#### Agile Dependency Injection for Objective-C

----

Syringe is ultra-lightweight, simplistic dependency injection framework for Objective-C. It is heavily inspired by similar tools from Java world, like [Spring](http://www.springframework.org) or [Google Guice](http://code.google.com/p/google-guice/).

Syringe is very simple to use. Classes you want to be injected just need to implement one empty protocol. There is no configuration; framework magically discovers all injectable objects, and eagerly creates instance cache. See below for installation instructions.

## What is dependency injection?

It is sometimes called an implementation of "The Hollywood Principle". Hollywood Principle is named after response given to amateur wanna-be actors after audition: "don't call us, we call you". But contrary to Hollywood producers, DI frameworks will keep the promise. Imagine class Car and its close collaborator, Engine. In old times, you would create one class, and in Car's constructor for example, one will create a instance of Engine. And it works perfectly, but only in programming book examples. Often you will have many more collaborators, and soon you will need to provide the same instance of Engine to other classes.

And here devil starts smiling and whispering to your ear: "Dear developer, having trouble with this network of connections between classes? Try singleton pattern, you won't have to worry about passing once created instance to all interested parties". And until recently, most Objective-C developers listened to Singleton Devil.

## Usage

**Syringe** was designed to be as simple as possible. It is not (yet) as powerful and flexible as Spring, but it does the basic job. Objective-C runtime is surprisingly powerful, and that allowed magic to happen.

1. Clone Git repository
2. Add sources from "SyringeCore" directory to your Xcode project.
3. Add this single line to prefix header file:

		#include "Syringe.h"

4. Annotate classes you want to be injected with `Injectable` protocol, e.g.

		@interface Car : NSObject <Injectable> { 
		   …
		}

5. Syringe does a lot of magic, but first object of the tree has to be manually obtained from Syringe. You do it with this simple macro:

		Car *car = inject(Car);

6. And that's it! If there are ivars referencing to other `Injectable` annotated classes, they will be automagically populated.

		@interface Car : NSObject <Injectable> { 
		   Engine *engine;	
		}

	In above example, Engine class conforms to Injectable protocol and instance will be created at startup and auto wired to Car.

### And that's it

Zero hassle, zero configuration. Syringe took simplistic approach, but fits most use cases. It is assumed that once class is marked as "Injectable" it will be automagically auto wired whenever ivar of matching type is encountered.

## Hints

Whole subsystem is initialized on first call to `inject()`.  It scans all classes of the project and eagerly initializes all conforming to `Injectable` protocol.

You can bootstrap DI container manually when it's convenient for you:

		[BeanFactory bootstrap];

## Post-initialization

Syringe does not support constructors with parameters, only bare alloc/init pair. For extra initialization, implement additional protocol `InitializingBean`:

		@interface Car : NSObject <Injectable,InitializingBean> 

		-(void) afterPropertiesSet {
			…
		}


And implement mandatory afterPropertiesSet: method. It will be called when object instance is created, and its collaborators wired and initialized.

# To do

Lazy initialization - work is in progress. 

# Comments, praises, blames

Feel free to contact me: tomek.cejner at gmail dot com