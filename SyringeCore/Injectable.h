//
//  Injectable.h
//  SyringeDemoCLI
//
//  Created by Tomek Cejner on 20.01.2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

/*
    This is marker protocol; add it to all classes you wish to be subject
    to dependency injection. Syringe automagically finds all classes conforming
    to Injectable protocol.
 */
@protocol Injectable <NSObject>
@end

/*
    Implement this protocol if you want to call additional initializer method
    after instance is created and completely wired.
 */
@protocol InitializingBean <NSObject>
- (void)afterPropertiesSet;
@end
