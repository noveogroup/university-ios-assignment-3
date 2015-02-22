//
//  Person.m
//  Factory
//

#import "Person.h"

@implementation Person

#pragma mark - Movement

- (void)moveToLocation:(id<LocationProtocol>)location
{
    _location = location;
}

@end
