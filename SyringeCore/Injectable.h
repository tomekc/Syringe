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
