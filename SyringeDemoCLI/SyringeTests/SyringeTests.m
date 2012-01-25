//
//  SyringeTests.m
//  SyringeTests
//
//  Created by Tomek Cejner on 25.01.2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SyringeTests.h"
#import "Syringe.h"
#import <objc/runtime.h>

@implementation SyringeTests {

    NSString *stringIvar;
    
}

- (void)setUp
{
    [super setUp];
    
    // Set-up code here.
}

- (void)tearDown
{
    // Tear-down code here.
    
    [super tearDown];
}



-(void)testGettingIvarName
{
    Ivar var = class_getInstanceVariable([SyringeTests class], "stringIvar");
    BeanFactory *bf = [[BeanFactory alloc] init];
    
    NSString *name = [bf getClassNameOfIvar:var];
    
    STAssertEqualObjects(name, @"NSString", @"aaa");
    
    
}


@end
