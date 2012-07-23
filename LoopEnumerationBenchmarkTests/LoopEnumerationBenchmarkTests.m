//
//  LoopEnumerationBenchmarkTests.m
//  LoopEnumerationBenchmarkTests
//
//  Created by Markus Chmelar on 22.07.12.
//  Copyright (c) 2012 TU Wien. All rights reserved.
//

#import "LoopEnumerationBenchmarkTests.h"
#import "DNEnumerationMethods.h"
@implementation LoopEnumerationBenchmarkTests

- (void)setUp
{
    [super setUp];
    // Set-up code here.
    _dut = [[DNEnumerationMethods alloc] initWithArraySize:5000];
}

- (void)tearDown
{
    // Tear-down code here.
    [super tearDown];
}

#define kNumbeOfCycles  10

-(void)testFastEnumeration
{
    [_dut singleFastEnumeration:kNumbeOfCycles];
}

-(void)testFastEnumerationReverse
{
    [_dut singleFastEnumerationReverse:kNumbeOfCycles];
}

-(void)testEnumerator
{
    [_dut singleEnumeration:kNumbeOfCycles];
}

-(void)testEnumeratorReverse
{
    [_dut singleEnumerationReverse:kNumbeOfCycles];
}

-(void)testForLoop
{
    [_dut singleForLoop:kNumbeOfCycles];
}

-(void)testForLoopReverse
{
    [_dut singleForLoopReverse:kNumbeOfCycles];
}

-(void)testTriangularFastNumerator
{
    [_dut doubleFastEnumerationAndEnumeration:kNumbeOfCycles];
}

-(void)testTriangularSlice
{
    [_dut doubleFastEnumerationSlicing:kNumbeOfCycles];
}

-(void)testTriangularDoubleFastEnumerationPointercheck
{
    [_dut doubleFastEnumerationPointerCheck:kNumbeOfCycles];
}

-(void)testTriangularForLoop
{
    [_dut doubleForLoop:kNumbeOfCycles];
}

-(void)testPartialFastEnumerationCheck
{
    [_dut partialEnumerationCheck:kNumbeOfCycles];
}

-(void)testPartialForLoop
{
    [_dut partialEnumerationForLoop:kNumbeOfCycles];
}

-(void)testPartialFastEnumeration
{
    [_dut partialEnumerationFastSlicing:kNumbeOfCycles];
}

-(void)testPartialGetObjectsRange
{
    [_dut partialEnumerationGetObjectsRange:kNumbeOfCycles];
}

-(void)partialEnumerationWithBlock
{
    [_dut partialEnumerationWithBlock:kNumbeOfCycles];
}

-(void)partialEnumerationWithBlockConcurrent
{
    [_dut partialEnumerationWithBlockConcurrent:kNumbeOfCycles];
}


@end
