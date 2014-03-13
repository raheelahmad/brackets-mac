//
//  SKLAppDelegate.m
//  Brackesh
//
//  Created by Raheel Ahmad on 3/13/14.
//  Copyright (c) 2014 Sakun Labs. All rights reserved.
//

#import "SKLAppDelegate.h"
#import "NSString+Brackets.h"

@interface SKLAppDelegate ()<NSTextFieldDelegate>

@property (weak) IBOutlet NSTextField *textField;
@property (weak) IBOutlet NSTextField *label;

@end

@implementation SKLAppDelegate

- (void)controlTextDidChange:(NSNotification *)obj {
	NSString *text = self.textField.stringValue;
	if (text.length) {
		BOOL matches = [text hasMatchingBrackets];
		self.label.stringValue = matches ? @"Match" : @"Nope";
	} else {
		self.label.stringValue = @"";
	}
}

@end
