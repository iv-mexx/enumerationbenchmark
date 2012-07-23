//
//  DNEnumerationMethods.m
//  LoopEnumerationBenchmark
//
//  Created by Markus Chmelar on 22.07.12.
//  Copyright (c) 2012 devsub.net. All rights reserved.
//

#import "DNEnumerationMethods.h"

@implementation DNEnumerationMethods
-(id)init
{
    // Init with default size
    self = [self initWithArraySize:5000];
    if(self)
    {
        
    }
    return self;
}

-(id)initWithArraySize:(NSUInteger)size
{
	self = [super init];
	if(self)
	{
		NSMutableArray *array = [[NSMutableArray alloc] init];
		for(NSUInteger i = 0; i < size; i++)
		{
			[array addObject:[NSNumber numberWithInt:i]];
		}
		_testArray = [NSArray arrayWithArray:array];
	}
	return self;
}

#pragma mark - Single Enumeration

/**
 *  Straightforeward Fast Enumeration of the array
 */
- (NSTimeInterval)singleFastEnumeration:(int)numberOfRuns
{
	NSDate *starDate = [NSDate date];
    
	for(NSUInteger c = 0; c < numberOfRuns; c++)
	{
        int counter = 0;
		// ////////////////////////////////////////////////////
		// Algorithm
		// ////////////////////////////////////////////////////
		for(NSNumber *number in _testArray)
		{
			assert(number);
            counter ++;
		}
		// ////////////////////////////////////////////////////
        NSLog(@"Counter: %d", counter);
	}
	NSDate        *endDate = [NSDate date];
	NSTimeInterval total = [endDate timeIntervalSinceDate:starDate];
	NSTimeInterval perCycle = total / numberOfRuns;
    NSLog(@"FastEnumeration took %fs\t(%fms per Cycle / %fus per Iteration)", total, (1000 * perCycle), (perCycle / ([_testArray count] / 1000000)));
	return perCycle;
}

/**
 *  Fast Enumeration of the array in reverse order
 */
- (NSTimeInterval)singleFastEnumerationReverse:(int)numberOfRuns
{
	NSDate *starDate = [NSDate date];
    
	for(NSUInteger c = 0; c < numberOfRuns; c++)
	{
        int counter = 0;
		// ////////////////////////////////////////////////////
		// Algorithm
		// ////////////////////////////////////////////////////
		for(NSNumber *number in [_testArray reverseObjectEnumerator])
		{
            counter ++ ;
			assert(number);
		}
		// ////////////////////////////////////////////////////
        NSLog(@"Counter: %d", counter);
	}
	NSDate        *endDate = [NSDate date];
	NSTimeInterval total = [endDate timeIntervalSinceDate:starDate];
	NSTimeInterval perCycle = total / numberOfRuns;
    NSLog(@"FastEnumeration Reverse took %fs\t(%fms per Cycle / %fus per Iteration)", total, (1000 * perCycle), (perCycle / ([_testArray count] / 1000000)));
	return perCycle;
}

/**
 *  Enumerate the array with NSEnumerate
 */
- (NSTimeInterval)singleEnumeration:(int)numberOfRuns
{
	NSDate *starDate = [NSDate date];
    
	for(NSUInteger c = 0; c < numberOfRuns; c++)
	{
		// ////////////////////////////////////////////////////
		// Algorithm
		// ////////////////////////////////////////////////////
		NSEnumerator *enumerator = [_testArray objectEnumerator];
		NSNumber     *number;
		while(number = [enumerator nextObject])
		{
			assert(number);
		}
		// ////////////////////////////////////////////////////
	}
	NSDate        *endDate = [NSDate date];
	NSTimeInterval total = [endDate timeIntervalSinceDate:starDate];
	NSTimeInterval perCycle = total / numberOfRuns;
    NSLog(@"Enumerator took %fs\t(%fms per Cycle / %fus per Iteration)", total, (1000 * perCycle), (perCycle / ([_testArray count] / 1000000)));
	return perCycle;
}

/**
 *  Enumerate the array with NSEnumerate in reverse order
 */
-(NSTimeInterval)singleEnumerationReverse:(int)numberOfRuns
{
    NSDate *starDate = [NSDate date];
    
	for(NSUInteger c = 0; c < numberOfRuns; c++)
	{
		// ////////////////////////////////////////////////////
		// Algorithm
		// ////////////////////////////////////////////////////
		NSEnumerator *enumerator = [_testArray reverseObjectEnumerator];
		NSNumber     *number;
		while(number = [enumerator nextObject])
		{
			assert(number);
		}
		// ////////////////////////////////////////////////////
	}
	NSDate        *endDate = [NSDate date];
	NSTimeInterval total = [endDate timeIntervalSinceDate:starDate];
	NSTimeInterval perCycle = total / numberOfRuns;
    NSLog(@"Enumerator Reverse took %fs\t(%fms per Cycle / %fus per Iteration)", total, (1000 * perCycle), (perCycle / ([_testArray count] / 1000000)));
	return perCycle;
}

/**
 *  Enumerate the array with a simple for-loop
 */
- (NSTimeInterval)singleForLoop:(int)numberOfRuns
{
	NSDate *starDate = [NSDate date];
    
	for(NSUInteger c = 0; c < numberOfRuns; c++)
	{
		// ////////////////////////////////////////////////////
		// Algorithm
		// ////////////////////////////////////////////////////
		for(NSUInteger i = 0; i < [_testArray count]; i++)
		{
			NSNumber *number = [_testArray objectAtIndex:i];
			assert(number);
		}
		// ////////////////////////////////////////////////////
	}
	NSDate        *endDate = [NSDate date];
	NSTimeInterval total = [endDate timeIntervalSinceDate:starDate];
	NSTimeInterval perCycle = total / numberOfRuns;
    NSLog(@"For Loop took %fs\t(%fms per Cycle / %fus per Iteration)", total, (1000 * perCycle), (perCycle / ([_testArray count] / 1000000)));
	return perCycle;
}

/**
 *  Enumerate the array with a simple for-loop in reverse order
 */
-(NSTimeInterval)singleForLoopReverse:(int)numberOfRuns
{
	NSDate *starDate = [NSDate date];
    
	for(NSUInteger c = 0; c < numberOfRuns; c++)
	{
		// ////////////////////////////////////////////////////
		// Algorithm
		// ////////////////////////////////////////////////////
		for(NSInteger i = ([_testArray count] - 1); i >= 0 ; i--)
		{
			NSNumber *number = [_testArray objectAtIndex:i];
			assert(number);
		}
		// ////////////////////////////////////////////////////
	}
	NSDate        *endDate = [NSDate date];
	NSTimeInterval total = [endDate timeIntervalSinceDate:starDate];
	NSTimeInterval perCycle = total / numberOfRuns;
    NSLog(@"For Loop Reverse took %fs\t(%fms per Cycle / %fus per Iteration)", total, (1000 * perCycle), (perCycle / ([_testArray count] / 1000000)));
	return perCycle;
}

-(NSTimeInterval)singleBlock:(int)numberOfRuns
{
	NSDate *starDate = [NSDate date];
    
	for(NSUInteger c = 0; c < numberOfRuns; c++)
	{
		// ////////////////////////////////////////////////////
		// Algorithm
		// ////////////////////////////////////////////////////
		[_testArray enumerateObjectsUsingBlock:^(NSNumber *number, NSUInteger idx, BOOL *stop) {
            assert(number);
        }];
		// ////////////////////////////////////////////////////
	}
	NSDate        *endDate = [NSDate date];
	NSTimeInterval total = [endDate timeIntervalSinceDate:starDate];
	NSTimeInterval perCycle = total / numberOfRuns;
    NSLog(@"singleBlock took %fs\t(%fms per Cycle / %fus per Iteration)", total, (1000 * perCycle), (perCycle / ([_testArray count] / 1000000)));
	return perCycle;
}

-(NSTimeInterval)singleBlockBackwards:(int)numberOfRuns
{
	NSDate *starDate = [NSDate date];
    
	for(NSUInteger c = 0; c < numberOfRuns; c++)
	{
		// ////////////////////////////////////////////////////
		// Algorithm
		// ////////////////////////////////////////////////////
		[_testArray enumerateObjectsWithOptions:NSEnumerationReverse usingBlock:^(NSNumber *number, NSUInteger idx, BOOL *stop) {
            assert(number);
        }];
		// ////////////////////////////////////////////////////
	}
	NSDate        *endDate = [NSDate date];
	NSTimeInterval total = [endDate timeIntervalSinceDate:starDate];
	NSTimeInterval perCycle = total / numberOfRuns;
    NSLog(@"singleBlockBackwards took %fs\t(%fms per Cycle / %fus per Iteration)", total, (1000 * perCycle), (perCycle / ([_testArray count] / 1000000)));
	return perCycle;
}

-(NSTimeInterval)singleBlockConcurrent:(int)numberOfRuns
{
	NSDate *starDate = [NSDate date];
    
	for(NSUInteger c = 0; c < numberOfRuns; c++)
	{
		// ////////////////////////////////////////////////////
		// Algorithm
		// ////////////////////////////////////////////////////
		[_testArray enumerateObjectsWithOptions:NSEnumerationConcurrent usingBlock:^(NSNumber *number, NSUInteger idx, BOOL *stop) {
            assert(number);
        }];
		// ////////////////////////////////////////////////////
	}
	NSDate        *endDate = [NSDate date];
	NSTimeInterval total = [endDate timeIntervalSinceDate:starDate];
	NSTimeInterval perCycle = total / numberOfRuns;
    NSLog(@"singleBlock took %fs\t(%fms per Cycle / %fus per Iteration)", total, (1000 * perCycle), (perCycle / ([_testArray count] / 1000000)));
	return perCycle;
}



#pragma mark - Double Enumeration

/**
 *  This method is the simplest implementation, using two nested for loops
 */
- (NSTimeInterval)doubleForLoop:(int)numberOfRuns
{
	NSDate *starDate = [NSDate date];
    
	for(NSUInteger c = 0; c < numberOfRuns; c++)
	{
		// ////////////////////////////////////////////////////
		// Algorithm
		// ////////////////////////////////////////////////////
		for(NSUInteger i = 0; i < [_testArray count]; i++)
		{
			NSNumber *number = [_testArray objectAtIndex:i];
			for(NSUInteger j = i; j < [_testArray count]; j++)
			{
				NSNumber *innerLoopNumber = [_testArray objectAtIndex:j];
				assert(number);
				assert(innerLoopNumber);
			}
		}
		// ////////////////////////////////////////////////////
	}
	NSDate        *endDate = [NSDate date];
	NSTimeInterval total = [endDate timeIntervalSinceDate:starDate];
	NSTimeInterval perCycle = total / numberOfRuns;
    NSLog(@"Nested for-loop took %fs\t(%fms per Cycle / %fus per Iteration)", total, (1000 * perCycle), (perCycle / ([_testArray count] / 1000000)));
	return perCycle;
}

/**
 *  This Method uses fast Enumeration on the outer loop and then an NSEnumerator
 *  in the inner loop but running in reverse order. The equality check terminates 
 *  the inner loop to avoid redundant comparisons
 *
 *  Note that   1) the equality check in the inner loop is somewhat expensive
 *              2) nsenumerator is slow compared to fast enumeration (based on the observations above)
 *  
 *  Testing shows that this method is the worst of all
 */
- (NSTimeInterval)doubleFastEnumerationAndEnumeration:(int)numberOfRuns
{
	NSDate *starDate = [NSDate date];
    
	for(NSUInteger c = 0; c < numberOfRuns; c++)
	{
		// ////////////////////////////////////////////////////
		// Algorithm
		// ////////////////////////////////////////////////////
		for(NSNumber *number in _testArray)
		{
			NSEnumerator *reverseEnumterator = [_testArray reverseObjectEnumerator];
			NSNumber     *innerLoopNumber;
			while((innerLoopNumber = reverseEnumterator.nextObject) && ![innerLoopNumber isEqualToNumber:number])
			{
				assert(innerLoopNumber);
				assert(number);
			}
		}
        
		// ////////////////////////////////////////////////////
	}
	NSDate        *endDate = [NSDate date];
	NSTimeInterval total = [endDate timeIntervalSinceDate:starDate];
	NSTimeInterval perCycle = total / numberOfRuns;
    NSLog(@"Triangular Fast Enumerator took %fs\t(%fms per Cycle / %fus per Iteration)", total, (1000 * perCycle), (perCycle / ([_testArray count] / 1000000)));
	return perCycle;
}

/**
 *  This Method uses Fast Enumeration for both loops and checks the current element
 *  in the inner loop. 
 *  The check with '==' compares the pointers but since we compare objects within one
 *  array with eachother, this is exactle what is needed to identify the current object
 */
- (NSTimeInterval)doubleFastEnumerationPointerCheck:(int)numberOfRuns
{
	NSDate *starDate = [NSDate date];
    
	for(NSUInteger c = 0; c < numberOfRuns; c++)
	{
		// ////////////////////////////////////////////////////
		// Algorithm
		// ////////////////////////////////////////////////////
		for(NSNumber *number in _testArray)
		{
            for(NSNumber *innerLoopNumber in [_testArray reverseObjectEnumerator])
            {
                if(number == innerLoopNumber)
                    break;
                assert(innerLoopNumber);
                assert(number);
            }
		}
        
		// ////////////////////////////////////////////////////
	}
	NSDate        *endDate = [NSDate date];
	NSTimeInterval total = [endDate timeIntervalSinceDate:starDate];
	NSTimeInterval perCycle = total / numberOfRuns;
    NSLog(@"Triangular Double Fast with Pointercheck took %fs\t(%fms per Cycle / %fus per Iteration)", total, (1000 * perCycle), (perCycle / ([_testArray count] / 1000000)));
	return perCycle;
}

/**
 *  This Method uses fast Enumeration for the outer Loop and a for loop for
 *  the inner loop. It needs an additional counter to keep track of the
 *  number of iterations of the outer loop to avoid redundant comparisons
 */
- (NSTimeInterval)doubleHybrid:(int)numberOfRuns
{
	NSDate *starDate = [NSDate date];
    
	for(NSUInteger c = 0; c < numberOfRuns; c++)
	{
		// ////////////////////////////////////////////////////
		// Algorithm
		// ////////////////////////////////////////////////////
		int counter = 0;
		for(NSNumber *number in _testArray)
		{
			for(int j = counter + 1; j < [_testArray count]; j++)
			{
				NSNumber *innerLoopNumber = [_testArray objectAtIndex:j];
				assert(innerLoopNumber);
				assert(number);
			}
			counter++;
		}
		// ////////////////////////////////////////////////////
	}
	NSDate        *endDate = [NSDate date];
	NSTimeInterval total = [endDate timeIntervalSinceDate:starDate];
	NSTimeInterval perCycle = total / numberOfRuns;
    NSLog(@"Triangular Hybrid took %fs\t(%fms per Cycle / %fus per Iteration)", total, (1000 * perCycle), (perCycle / ([_testArray count] / 1000000)));
	return perCycle;
}

/**
 *  This Method is the most sophisticated implementation, using
 *  fast enumeration for both loops, but iterating only over a subarray
 *  in the second enumeration to avoid redundant comparisons
 */
- (NSTimeInterval)doubleFastEnumerationSlicing:(int)numberOfRuns
{
	NSDate *starDate = [NSDate date];
    
	for(NSUInteger c = 0; c < numberOfRuns; c++)
	{
		// ////////////////////////////////////////////////////
		// Algorithm
		// ////////////////////////////////////////////////////
		int counter = 0;
		for(NSNumber *number in _testArray)
		{
			NSRange slice;
			slice.location = counter + 1;
			slice.length = ([_testArray count] - counter - 1);
			for(NSNumber *innerLoopNumber in [_testArray subarrayWithRange : slice])
			{
				assert(innerLoopNumber);
				assert(number);
			}
			counter++;
		}
		// ////////////////////////////////////////////////////
	}
	NSDate        *endDate = [NSDate date];
	NSTimeInterval total = [endDate timeIntervalSinceDate:starDate];
	NSTimeInterval perCycle = total / numberOfRuns;
    NSLog(@"Triangular Slicing took %fs\t(%fms per Cycle / %fus per Iteration)", total, (1000 * perCycle), (perCycle / ([_testArray count] / 1000000)));
	return perCycle;
}

#pragma mark - Partial Enumeration

/**
 *  This Method enumerates all but the last element in the Array 
 *  using a simple for loop counting from 0 to [array count] - 2
 */
-(NSTimeInterval)partialEnumerationForLoop:(int)numberOfRuns
{
    NSDate *starDate = [NSDate date];
	for(NSUInteger c = 0; c < numberOfRuns; c++)
	{
		// ////////////////////////////////////////////////////
		// Algorithm
		// ////////////////////////////////////////////////////
        for (NSUInteger i = 0; i < [_testArray count] - 1; i++) 
        {
            NSNumber *number = [_testArray objectAtIndex:i];
            assert(number);
        }
		// ////////////////////////////////////////////////////
	}
	NSDate        *endDate = [NSDate date];
	NSTimeInterval total = [endDate timeIntervalSinceDate:starDate];
	NSTimeInterval perCycle = total / numberOfRuns;
    NSLog(@"Partial Enumeration for-loop took %fs\t(%fms per Cycle / %fus per Iteration)", total, (1000 * perCycle), (perCycle / ([_testArray count] / 1000000)));
	return perCycle;
}

/**
 *  This Method enumerates all but the last element in the Array 
 *  by checking the current element in each iteration
 */ 
-(NSTimeInterval)partialEnumerationCheck:(int)numberOfRuns
{
    NSDate *starDate = [NSDate date];
	for(NSUInteger c = 0; c < numberOfRuns; c++)
	{
		// ////////////////////////////////////////////////////
		// Algorithm
		// ////////////////////////////////////////////////////
        NSNumber *lastNumber = [_testArray lastObject];
        for(NSNumber *number in _testArray)
        {
            // We can do this pointer-check here because the we search for the exact same object here
            if(number != lastNumber)
            {                
                assert(number);
            }
        }
		// ////////////////////////////////////////////////////
	}
	NSDate        *endDate = [NSDate date];
	NSTimeInterval total = [endDate timeIntervalSinceDate:starDate];
	NSTimeInterval perCycle = total / numberOfRuns;
	NSLog(@"Partial Fast Enumeration with check  took %fs\t(%fms per Cycle / %fus per Iteration)", total, (1000 * perCycle), (perCycle / ([_testArray count] / 1000000)));
	return perCycle;
}


/**
 *  This Method enumerates all but the last element in the Array 
 *  using a subarray of the array
 */
-(NSTimeInterval)partialEnumerationFastSlicing:(int)numberOfRuns
{
    NSDate *starDate = [NSDate date];
	for(NSUInteger c = 0; c < numberOfRuns; c++)
	{
		// ////////////////////////////////////////////////////
		// Algorithm
		// ////////////////////////////////////////////////////
        NSRange subArrayRange = NSMakeRange(0, [_testArray count] - 1);
        NSArray *subArray = [_testArray subarrayWithRange:subArrayRange];
        for(NSNumber *number in subArray)
        {
            assert(number);
        }
		// ////////////////////////////////////////////////////
	}
	NSDate        *endDate = [NSDate date];
	NSTimeInterval total = [endDate timeIntervalSinceDate:starDate];
	NSTimeInterval perCycle = total / numberOfRuns;
    NSLog(@"partial Enumeration Fast Slicing took %fs\t(%fms per Cycle / %fus per Iteration)", total, (1000 * perCycle), (perCycle / ([_testArray count] / 1000000)));
	return perCycle;    
}

/**
 *  This Method enumerates all but the last element in the Array 
 *  by creating a c-style array with the subrange of the array
 *  and iterating the c array with a simple for loop
 */
-(NSTimeInterval)partialEnumerationGetObjectsRange:(int)numberOfRuns
{
    NSDate *starDate = [NSDate date];
	for(NSUInteger c = 0; c < numberOfRuns; c++)
	{
		// ////////////////////////////////////////////////////
		// Algorithm
		// ////////////////////////////////////////////////////
        NSRange subArrayRange = NSMakeRange(0, [_testArray count] -1);
        __unsafe_unretained id *subarray = (__unsafe_unretained id *)malloc(sizeof(id) * subArrayRange.length);
        
        [_testArray getObjects:subarray range:subArrayRange];
        
        for (NSUInteger i = 0; i < subArrayRange.length; i++) {
            NSNumber *number = subarray[i];
            assert(number);
        }
        free(subarray);
		// ////////////////////////////////////////////////////
	}
	NSDate        *endDate = [NSDate date];
	NSTimeInterval total = [endDate timeIntervalSinceDate:starDate];
	NSTimeInterval perCycle = total / numberOfRuns;
    NSLog(@"partial getObjectsRange took %fs\t(%fms per Cycle / %fus per Iteration)", total, (1000 * perCycle), (perCycle / ([_testArray count] / 1000000)));
	return perCycle;    
}

/**
 *  This Method enumerates all Objects in range, given by the indexset with a block
 */
-(NSTimeInterval)partialEnumerationWithBlock:(int)numberOfRuns
{
    NSDate *starDate = [NSDate date];
	for(NSUInteger c = 0; c < numberOfRuns; c++)
	{
		// ////////////////////////////////////////////////////
		// Algorithm
		// ////////////////////////////////////////////////////
        NSRange subArrayRange = NSMakeRange(0, [_testArray count] -1);
        NSIndexSet *indexSet = [NSIndexSet indexSetWithIndexesInRange:subArrayRange];
        [_testArray enumerateObjectsAtIndexes:indexSet options:0 usingBlock:^(NSNumber *number, NSUInteger idx, BOOL *stop) {
            assert(number);
        }];
		// ////////////////////////////////////////////////////
	}
	NSDate        *endDate = [NSDate date];
	NSTimeInterval total = [endDate timeIntervalSinceDate:starDate];
	NSTimeInterval perCycle = total / numberOfRuns;
    NSLog(@"partialEnumerationWithBlock took %fs\t(%fms per Cycle / %fus per Iteration)", total, (1000 * perCycle), (perCycle / ([_testArray count] / 1000000)));
	return perCycle;    
}

/**
 *  This Method enumerates all Objects in range, given by the indexset with a block but concurrent
 */
-(NSTimeInterval)partialEnumerationWithBlockConcurrent:(int)numberOfRuns
{
    NSDate *starDate = [NSDate date];
	for(NSUInteger c = 0; c < numberOfRuns; c++)
	{
		// ////////////////////////////////////////////////////
		// Algorithm
		// ////////////////////////////////////////////////////
        NSRange subArrayRange = NSMakeRange(0, [_testArray count] -1);
        NSIndexSet *indexSet = [NSIndexSet indexSetWithIndexesInRange:subArrayRange];
        [_testArray enumerateObjectsAtIndexes:indexSet options:NSEnumerationConcurrent usingBlock:^(NSNumber *number, NSUInteger idx, BOOL *stop) {
            assert(number);
        }];
		// ////////////////////////////////////////////////////
	}
	NSDate        *endDate = [NSDate date];
	NSTimeInterval total = [endDate timeIntervalSinceDate:starDate];
	NSTimeInterval perCycle = total / numberOfRuns;
    NSLog(@"partialEnumerationWithBlockConcurrent took %fs\t(%fms per Cycle / %fus per Iteration)", total, (1000 * perCycle), (perCycle / ([_testArray count] / 1000000)));
	return perCycle;    
}
@end
