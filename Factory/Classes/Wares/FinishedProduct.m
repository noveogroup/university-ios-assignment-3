//
//  FinishedProduct.m
//  Factory
//

#import "FinishedProduct.h"

@interface FinishedProduct ()
{
    NSSet *_rawMaterials;
}

@end

@implementation FinishedProduct

#pragma mark - Initialization

- (id)init
{
    return nil;
}

- (id)initWithRawMaterials:(NSSet *)rawMaterials
{
    if ((self = [super init])) {
        _rawMaterials = [rawMaterials copy];
    }

    return self;
}

#pragma mark - WareProtocol implementation

- (NSString *)uniqueIdentifier
{
    return [self description];
}

@end
