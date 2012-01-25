//
//  SyringeLogging.h
//  SyringeDemoCLI
//
//  Created by Tomek Cejner on 25.01.2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#ifndef SyringeDemoCLI_SyringeLogging_h
#define SyringeDemoCLI_SyringeLogging_h

// Logging facility inspired by Three20
#ifdef DEBUG
#define SRLOG(xx, ...)  NSLog(@"%s(%d): " xx, __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__)
#else
#define SRLOG(xx, ...)  ((void)0)
#endif // #ifdef DEBUG

#endif
