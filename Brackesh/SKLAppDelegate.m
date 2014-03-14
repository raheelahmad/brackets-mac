//
//  SKLAppDelegate.m
//  Brackesh
//
//  Created by Raheel Ahmad on 3/13/14.
//  Copyright (c) 2014 Sakun Labs. All rights reserved.
//

#import "SKLAppDelegate.h"
#import "NSString+Brackets.h"
#import <QuartzCore/QuartzCore.h>

@interface SKLAppDelegate ()<NSTextFieldDelegate>

@property (weak) IBOutlet NSTextField *textField;
@property (weak) IBOutlet NSTextField *label;
@property (weak) IBOutlet NSImageView *imageView;
@property  NSInteger resets;

@end

@implementation SKLAppDelegate

- (void)controlTextDidChange:(NSNotification *)obj {
	NSString *text = self.textField.stringValue;
    NSImage *image;
	if (text.length) {
		BOOL matches = [text hasMatchingBrackets];
		image = matches ? [NSImage imageNamed:@"aye"] : [NSImage imageNamed:@"nay"];
		self.label.stringValue = matches ? @"Matches" : @"Not Balanced";
	} else {
		image = nil;
		self.label.stringValue = @"Empty";
		self.resets++;
		
		if (self.resets % 3 == 0) {
			self.label.stringValue = NSLocalizedString(@"Where is my money, Drew?", nil);
		}
	}
    
    if (![self.imageView.image isEqual:image]) {
        CAKeyframeAnimation *fadeAnim = [CAKeyframeAnimation animationWithKeyPath:@"opacity"];
        fadeAnim.values = @[ @0.0, @1.0 ];
        fadeAnim.keyTimes = @[ @0.5, @1.0 ];
        [self.imageView.layer addAnimation:fadeAnim forKey:@"opacity"];
        
        // Change the actual data value in the layer to the final value.
        self.imageView.layer.opacity = 1.0;
    }
    self.imageView.image = image;
}

- (void)awakeFromNib {
	[super awakeFromNib];
	[self controlTextDidChange:nil];
}

@end
