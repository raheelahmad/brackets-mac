//
//  NSString+Brackets.m
//  Brackesh
//
//  Created by Raheel Ahmad on 3/13/14.
//  Copyright (c) 2014 Sakun Labs. All rights reserved.
//

#import "NSString+Brackets.h"

@implementation NSString (Brackets)

- (BOOL)hasMatchingBrackets {
	if (!self.length) {
		return NO;
	}
	
	// final return
	BOOL isMatch = YES;
	
	NSMutableArray *stack = [NSMutableArray array];
	
	NSInteger index = 0;
	while (index < self.length) {
		NSRange range; range.length = 1; range.location = index;
		NSString *character = [self substringWithRange:range];
		
		BOOL isStarter = [[self starters] containsObject:character];
		BOOL isEnder = [[self enders] containsObject:character];
		
		if (isStarter) {
			// push
			[stack addObject:character];
		} else if (isEnder) {
			// pop
			NSString *top = [stack lastObject];
			[stack removeLastObject];
			
			if (!top) {
				// need an starter for our ender
				isMatch = NO;
			}
			
			// Assume top was a matching starter
			if ([[self starters] containsObject:top]) {
				NSInteger indexOfStarter = [[self starters] indexOfObject:top];
				NSString *correctMatcher = [[self enders] objectAtIndex:indexOfStarter];
				
				if (![correctMatcher isEqualToString:character]) {
					isMatch = NO;
				}
			}
		}
		
		index++;
	}
	
	if ([stack count] > 0) {
		isMatch = NO;
	}
	
	return isMatch;
}


// Assuming starters and enders are stored complementarily

- (NSArray *)starters {
	return @[ @"[", @"{", @"(" ];
}

- (NSArray *)enders {
	return @[ @"]", @"}", @")" ];
}

@end
