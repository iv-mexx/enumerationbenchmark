//
//  LoopEnumerationBenchmarkTests.m
//  LoopEnumerationBenchmarkTests
//
//  Created by Markus Chmelar on 22.07.12.
//  Copyright (c) 2012 TU Wien. All rights reserved.
//

#import "LoopEnumerationBenchmarkTests.h"
#import "IVEnumerationMethods.h"
@implementation LoopEnumerationBenchmarkTests

- (void)setUp
{
    [super setUp];
    // Set-up code here.
    _dut = [[IVEnumerationMethods alloc] initWithArraySize:1000000];
}

- (void)tearDown
{
    // Tear-down code here.
    [super tearDown];
}

#define kNumbeOfCycles  10

#pragma mark - Simple Enumeration

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

#pragma mark - Triangular Enumeration

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

#pragma mark - Partial Enumeration

-(void)testPartialFastEnumerationCheck
{
    [_dut partialEnumerationCheck:kNumbeOfCycles];
}

-(void)testPartialFastEnumerationCheckIgnore
{
    [_dut partialEnumerationCheckIgnore:kNumbeOfCycles];
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
