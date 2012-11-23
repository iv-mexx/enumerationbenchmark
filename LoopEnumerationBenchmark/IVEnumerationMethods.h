//
//  DNEnumerationMethods.h
//  LoopEnumerationBenchmark
//
//  Created by Markus Chmelar on 22.07.12.
//  Copyright (c) 2012 devsub.net. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IVEnumerationMethods : NSObject
{
    NSArray *_testArray;
}

-(id)initWithArraySize:(NSUInteger)size;

// Single Enumeration
-(NSTimeInterval)singleFastEnumeration:(int)numberOfRuns;
- (NSTimeInterval)singleFastEnumerationReverse:(int)numberOfRuns;
-(NSTimeInterval)singleEnumeration:(int)numberOfRuns;
-(NSTimeInterval)singleEnumerationReverse:(int)numberOfRuns;
-(NSTimeInterval)singleForLoop:(int)numberOfRuns;
-(NSTimeInterval)singleForLoopReverse:(int)numberOfRuns;
-(NSTimeInterval)singleBlock:(int)numberOfRuns;
-(NSTimeInterval)singleBlockBackwards:(int)numberOfRuns;
-(NSTimeInterval)singleBlockConcurrent:(int)numberOfRuns;
// Double Enumeration
-(NSTimeInterval)doubleFastEnumerationSlicing:(int)numberOfRuns;
-(NSTimeInterval)doubleForLoop:(int)numberOfRuns;
-(NSTimeInterval)doubleHybrid:(int)numberOfRuns;
-(NSTimeInterval)doubleFastEnumerationAndEnumeration:(int)numberOfRuns;
- (NSTimeInterval)doubleFastEnumerationPointerCheck:(int)numberOfRuns;
// Enumerating "all but the last element"
-(NSTimeInterval)partialEnumerationForLoop:(int)numberOfRuns;
-(NSTimeInterval)partialEnumerationFastSlicing:(int)numberOfRuns;
-(NSTimeInterval)partialEnumerationCheck:(int)numberOfRuns;
-(NSTimeInterval)partialEnumerationGetObjectsRange:(int)numberOfRuns;
-(NSTimeInterval)partialEnumerationWithBlock:(int)numberOfRuns;
-(NSTimeInterval)partialEnumerationWithBlockConcurrent:(int)numberOfRuns;
@end
