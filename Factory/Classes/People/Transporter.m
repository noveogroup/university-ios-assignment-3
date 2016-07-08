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
    [cargo_ release];
    cargo_ = nil;
    
    [super dealloc];
}

@end
