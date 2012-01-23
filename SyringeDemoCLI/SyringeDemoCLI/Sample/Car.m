//
//  Created by tomek on 22.01.2012.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "Car.h"
#import "Engine.h"
#import "Dashboard.h"


@implementation Car

-(void) start
{
    NSLog(@"Starting engine; setting RPM to 1000");
    engine.rpm = 1000;
}

-(void)showStatus
{
    [dashboard display];
}

- (void)afterPropertiesSet {
    NSLog(@"Car is fully set up and operational!");

}


@end