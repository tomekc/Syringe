//
//  main.m
//  SyringeDemoCLI
//
//  Created by Tomek Cejner on 20.01.2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SRClasspathScanner.h"
#import "Car.h"




int main (int argc, const char * argv[])
{

    @autoreleasepool {
        NSLog(@"Hello, this is Syringe Demo.");

        [BeanFactory bootstrap];
        
        Car *car = inject(Car);
        NSLog(@"Before starting:");
        [car showStatus];
        NSLog(@"Starting the car");
        [car start];
        NSLog(@"Car is started");
        [car showStatus];
        
        Car *car2 = inject(Car);
        NSLog(@"Another instance is cached: %d", (car == car2));

        
    }
    return 0;
}

