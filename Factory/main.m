//
//  main.m
//  Factory
//

#import "Factory.h"

int main(int argc, char * argv[])
{
    @autoreleasepool {
        Factory *const factory = [[Factory alloc] init];
        [factory simulateWorkingMonth];
    }
    
    while (1) {
        sleep(1);
    }
    return 0;
}
