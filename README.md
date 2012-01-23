# Syringe Framework

#### Agile Dependency Injection for Objective-C

----

## Motivation

In Java world, choice of tools and libraries is huge. There are couple of Dependency Injection frameworks, most notable are [Spring](http://www.springframework.org) and [Google Guice](http://code.google.com/p/google-guice/).

More Mac OS X and iOS apps become complex, the need for Dependency Injection is stronger.

## What is dependency injection?

If you have Java background, you probably know what Spring Framework is. And you probably miss it on iOS. If you are iOS programmer and hear this term first time, have a [educational reading](http://en.wikipedia.org/wiki/Dependency_injection) before moving on.

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


# Comments, praises

Feel free to contact me: tomek.cejner at gmail dot com