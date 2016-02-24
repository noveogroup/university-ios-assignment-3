//
//  main.m
//  Factory
//

#import "Factory.h"

int main(int argc, char * argv[])
{

    Factory *const factory = [[Factory alloc] init];
    [factory simulateWorkingMonth];

    return 0;
}
