//
//  Transporter.m
//  Factory
//

#import "Transporter.h"

@implementation Transporter

@synthesize cargo = cargo_;


#pragma mark - Deallocation

- (void)dealloc
{
    self.cargo = nil;
    
    [super dealloc];
}

@end
