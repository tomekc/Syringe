/*
 
 Copyright 2012 Tomasz Cejner
 
 Licensed under the Apache License, Version 2.0 (the "License");
 you may not use this file except in compliance with the License.
 You may obtain a copy of the License at
 
 http://www.apache.org/licenses/LICENSE-2.0
 
 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "AS IS" BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and
 limitations under the License.
 
 */

#import "Injectable.h"
#import "NSObject+SyringeExtras.h"
#import "BeanFactory.h"

#define inject(X) [[BeanFactory sharedBeanFactory] getObjectOfClass:[X class]]

// The general purpose logger. This ignores logging levels.
#ifdef DEBUG
  #define SRLOG(xx, ...)  NSLog(@"%s(%d): " xx, __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__)
#else
  #define SRLOG(xx, ...)  ((void)0)
#endif // #ifdef DEBUG
