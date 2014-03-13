//
//  BrackeshTests.m
//  BrackeshTests
//
//  Created by Raheel Ahmad on 3/13/14.
//  Copyright (c) 2014 Sakun Labs. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSString+Brackets.h"

@interface BrackeshTests : XCTestCase

@end

@implementation BrackeshTests

- (void)testEmptyMatches {
	NSString *nilString = nil;
	XCTAssertFalse([nilString hasMatchingBrackets], @"nil should not have matching brackets");
	
	NSString *emptyString = @"";
	XCTAssertFalse([emptyString hasMatchingBrackets], @"empty should not have matching brackets");
}


- (void)testComplexStrings {
	for (NSString *sample in @[ @"{T[h]a{le}s}", @"[Fa(r)[abi]]", @"(M(a)(imone)des)" ]) {
		BOOL test = [sample hasMatchingBrackets];
		XCTAssertTrue(test, @"Simple containters should have macthing brackets");
	}
	
	for (NSString *sample in @[ @"{Tha[le)s}]", @"[Fa[ra){b}i", @"(Mai(mo)n)[ed]]es" ]) {
		BOOL test = [sample hasMatchingBrackets];
		XCTAssertFalse(test, @"Simple non-ending containters should have macthing brackets");
	}
}

- (void)testSingleContainter {
	for (NSString *sample in @[ @"{Thales}", @"[Farabi]", @"(Maimonedes)" ]) {
		BOOL test = [sample hasMatchingBrackets];
		XCTAssertTrue(test, @"Simple containters should have macthing brackets");
	}
	
	for (NSString *sample in @[ @"{Thales", @"[Farabi", @"(Maimonedes" ]) {
		BOOL test = [sample hasMatchingBrackets];
		XCTAssertFalse(test, @"Simple non-ending containters should have macthing brackets");
	}
}


- (void)testEmptyContainers {
	for (NSString *sample in @[ @"{}", @"[]", @"()" ]) {
		BOOL test = [sample hasMatchingBrackets];
		XCTAssertTrue(test, @"Simple containters should have macthing brackets");
	}
	
	for (NSString *sample in @[ @"{", @"[", @"(" ]) {
		BOOL test = [sample hasMatchingBrackets];
		XCTAssertFalse(test, @"Simple non-ending containters should have macthing brackets");
	}
}


- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

@end
