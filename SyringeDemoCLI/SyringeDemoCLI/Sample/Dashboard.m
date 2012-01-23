//
//  Created by tomek on 22.01.2012.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "Dashboard.h"
#import "Engine.h"


@implementation Dashboard

-(void)display
{
    NSLog(@"Readings: %d rpm", engine.rpm);

}

@end