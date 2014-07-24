//
//  Transporter.m
//  Factory
//

#import "Transporter.h"

@implementation Transporter

@synthesize cargo = cargo_;

- (void)setCargo:(id)cargo
{
    [cargo retain];
    [cargo_ release];
    cargo_ = cargo;
}

-(void)dealloc
{
    [cargo_ release];
    [super dealloc];
}
@end
