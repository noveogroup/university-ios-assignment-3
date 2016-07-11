//
//  MemoryPayload.m
//  Factory
//

#import "MemoryPayload.h"

@interface MemoryPayload ()
{
    UInt8 *_memoryLoad;
}

@end

@implementation MemoryPayload

#pragma mark - Initialization

- (id)init
{
    self = [super init];
    if (self) {
        const NSUInteger memoryLoadSize = 10000000;
        _memoryLoad = (UInt8 *)malloc(sizeof(UInt8) * memoryLoadSize);
        if (_memoryLoad != NULL) {
            for (NSUInteger i = 0; i < memoryLoadSize; i++) {
                _memoryLoad[i] = UINT8_MAX;
            }
        }
    }

    return self;
}

#pragma mark - Deallocation

- (void)dealloc
{
    free(_memoryLoad);
    _memoryLoad = NULL;
}

@end
