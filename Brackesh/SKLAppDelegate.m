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
@property (weak) IBOutlet NSImageView *imageView;

@end

@implementation SKLAppDelegate

- (void)controlTextDidChange:(NSNotification *)obj {
	NSString *text = self.textField.stringValue;
	if (text.length) {
		BOOL matches = [text hasMatchingBrackets];
		self.imageView.image = matches ? [NSImage imageNamed:@"aye"] : [NSImage imageNamed:@"nay"];
		self.label.stringValue = matches ? @"Matches" : @"Not Balanced";
	} else {
		self.imageView.image = nil;
		self.label.stringValue = @"Empty";
	}
}

- (void)awakeFromNib {
	[super awakeFromNib];
	[self controlTextDidChange:nil];
}

@end
