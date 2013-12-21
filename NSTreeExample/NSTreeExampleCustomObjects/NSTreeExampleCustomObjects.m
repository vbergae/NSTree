//
//  NSTreeExampleCustomObjects.m
//  NSTreeExampleCustomObjects
//
//  Created by . Carlin on 12/20/13.
//  Copyright (c) 2013 Carlin Creations. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "NSTree.h"

    #define NUM_ELEMENTS 1000000
    #define NODE_CAPACITY 3000
    #define NAME_LENGTH 8
    
@interface NSTreeCustomObject : NSObject
    @property (nonatomic, copy) NSUInteger userID; 
    @property (nonatomic, strong) NSString *userName;
    - (NSComparisonResult)compare:(id)obj;
@end
@implementation NSTreeCustomObject
- (NSComparisonResult)compare:(id)obj {
    return [self.userName compare:obj];
}
@end
    
@interface NSTreeExampleCustomObjects : XCTestCase

    @property (nonatomic, strong) NSTree *tree;
    @property (nonatomic, strong) NSMutableArray *data; 
    
@end

@implementation NSTreeExampleCustomObjects

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
     
    // Setup data
    self.data = [NSMutableArray new]; 
    NSTreeCustomObject *object;
    for (int i = 1; i <= NUM_ELEMENTS; ++i) {
        object = [NSTreeCustomObject new];
        object.userID = i;
        object.userName = [self genRandStringLength:NAME_LENGTH];
        [self.data addObject:object];
    }   
    NSLog(@"Data count: %i", self.data.count);
    
    // Setup trees
    self.tree = [[NSTree alloc] initWithNodeCapacity:NODE_CAPACITY];
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testTreeDelete
{
    NSDate *start;
    
    // Populate first
    NSLog(@"Inserting into tree");
    start = [NSDate date];
    for (id object in self.data) { 
        [self.tree addObject:object];
    }
    NSLog(@"Completed in %f", -[start timeIntervalSinceNow]); 

    // Delete
    NSLog(@"Deleting from tree", self.tree);
    start = [NSDate date];
    for (id object in self.data) { 
        [self.tree removeObject:object];
    }
    NSLog(@"Completed in %f", -[start timeIntervalSinceNow]);
    XCTAssertEqual(self.tree.count, 0, @"Tree count not 0!");
    XCTAssertEqual([self.tree trueCount], 0, @"True count not 0!");
}


NSString *letters = @"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
- (NSString *)genRandStringLength:(int)len 
{
    NSMutableString *randomString = [NSMutableString stringWithCapacity: len];
    for (int i = 0; i < len; i++) {
         [randomString appendFormat: @"%C", [letters characterAtIndex: arc4random() % [letters length]]];
    }
    return randomString;
}

@end
