//
//  DNViewController.m
//  LoopEnumerationBenchmark
//
//  Created by Markus Chmelar on 22.07.12.
//  Copyright (c) 2012 devsub.net. All rights reserved.
//

#import "IVViewController.h"
#import "IVEnumerationMethods.h"

#define kNumberOfRuns 1
#define kSleepInterval 2

@interface IVViewController ()

@end

@implementation IVViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

-(IBAction)runTestsDouble:(id)sender
{
    // Dispatch the tests in background to not block the main-queue
    // the tests may take to long so that the os may terminate the application
    // if we block the mainthread that long
    [_activityIndicator startAnimating];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        // Sleep is to seperate the Test-Cases in Instruments
        IVEnumerationMethods *dut = [[IVEnumerationMethods alloc] initWithArraySize:5000];
        [NSThread sleepForTimeInterval:kSleepInterval];
        [NSThread sleepForTimeInterval:kSleepInterval];
        // Double Enumeration
        [dut doubleFastEnumerationSlicing:kNumberOfRuns];           // 1 
        [NSThread sleepForTimeInterval:kSleepInterval];
        [dut doubleForLoop:kNumberOfRuns];                          // 2
        [NSThread sleepForTimeInterval:kSleepInterval];
        [dut doubleHybrid:kNumberOfRuns];                           // 3
        [NSThread sleepForTimeInterval:kSleepInterval];
        [dut doubleFastEnumerationAndEnumeration:kNumberOfRuns];    // 4
        [NSThread sleepForTimeInterval:kSleepInterval];
        [dut doubleFastEnumerationPointerCheck:kNumberOfRuns];      // 5
        [NSThread sleepForTimeInterval:kSleepInterval];
        dispatch_async(dispatch_get_main_queue(), ^{
            [_activityIndicator stopAnimating];
        });
    });
}
    
-(IBAction)runTestsSingle:(id)sender
{
    // Dispatch the tests in background to not block the main-queue
    // the tests may take to long so that the os may terminate the application
    // if we block the mainthread that long
    [_activityIndicator startAnimating];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        // Sleep is to seperate the Test-Cases in Instruments
        IVEnumerationMethods *dut = [[IVEnumerationMethods alloc] initWithArraySize:1000000];
        [NSThread sleepForTimeInterval:kSleepInterval];
        [NSThread sleepForTimeInterval:kSleepInterval];
        // Single Enumeration
        [dut singleForLoop:kNumberOfRuns];                          // 1
        [NSThread sleepForTimeInterval:kSleepInterval];   
        [dut singleForLoopReverse:kNumberOfRuns];                   // 2
        [NSThread sleepForTimeInterval:kSleepInterval];
        [dut singleEnumeration:kNumberOfRuns];                      // 3
        [NSThread sleepForTimeInterval:kSleepInterval];
        [dut singleEnumerationReverse:kNumberOfRuns];               // 4
        [NSThread sleepForTimeInterval:kSleepInterval];       
        [dut singleFastEnumeration:kNumberOfRuns];                  // 5
        [NSThread sleepForTimeInterval:kSleepInterval];
        [dut singleFastEnumerationReverse:kNumberOfRuns];           // 6
        [NSThread sleepForTimeInterval:kSleepInterval];
        [dut singleBlock:kNumberOfRuns];                            // 7
        [NSThread sleepForTimeInterval:kSleepInterval]; 
        [dut singleBlockBackwards:kNumberOfRuns];                   // 8
        [NSThread sleepForTimeInterval:kSleepInterval]; 
        [dut singleBlockConcurrent:kNumberOfRuns];                  // 9
        [NSThread sleepForTimeInterval:kSleepInterval]; 
        // Enumeration 'all but the last element'
        [NSThread sleepForTimeInterval:kSleepInterval];       
        [dut partialEnumerationForLoop:kNumberOfRuns];              // 10
        [NSThread sleepForTimeInterval:kSleepInterval];
        [dut partialEnumerationFastSlicing:kNumberOfRuns];          // 11
        [NSThread sleepForTimeInterval:kSleepInterval];       
        [dut partialEnumerationCheck:kNumberOfRuns];                // 12
        [NSThread sleepForTimeInterval:kSleepInterval];      
        [dut partialEnumerationGetObjectsRange:kNumberOfRuns];      // 13
        [NSThread sleepForTimeInterval:kSleepInterval];     
        [dut partialEnumerationWithBlock:kNumberOfRuns];            // 14
        [NSThread sleepForTimeInterval:kSleepInterval];
        [dut partialEnumerationWithBlockConcurrent:kNumberOfRuns];  // 15
        [NSThread sleepForTimeInterval:kSleepInterval];
        [dut partialEnumerationCheckIgnoreExclude:kNumberOfRuns];	// 16
        [NSThread sleepForTimeInterval:kSleepInterval];
        [dut partialEnumerationWithBlockExclude:kNumberOfRuns];		// 17
        [NSThread sleepForTimeInterval:kSleepInterval];
        [dut partialEnumerationWithBlockConcurrentExclude:kNumberOfRuns];  // 18
        
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [_activityIndicator stopAnimating];
        });
    });
}

@end
