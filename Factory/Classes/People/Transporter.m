//
//  Transporter.m
//  Factory
//

#import "Transporter.h"

@implementation Transporter

@synthesize cargo = cargo_;

- (void)dealloc
{
    cargo_= nil;
}

@end
