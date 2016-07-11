//
//  AssemblyLine.m
//  Factory
//

#import "AssemblyLine.h"
#import "FinishedProduct.h"

@implementation AssemblyLine

#pragma mark - Processing

- (FinishedProduct *)processRawMaterials:(NSSet *)rawMaterials
{
    sleep(1);

    return [[FinishedProduct alloc] initWithRawMaterials:rawMaterials];
}

@end
