#import <Preferences/Preferences.h>

@interface SnoozeOrStopSettingsListController: PSListController {
}
@end

@implementation SnoozeOrStopSettingsListController

- (id)specifiers {
	if(_specifiers == nil) {
		_specifiers = [[self loadSpecifiersFromPlistName:@"SnoozeOrStopSettings" target:self] retain];
	}
	return _specifiers;
}

-(void)donate:(PSSpecifier*)spec
{
    
    NSURL *url = [[NSURL alloc] initWithString: @"https://www.paypal.com/cgi-bin/webscr?cmd=_donations&business=sero%2emarco%40gmail%2ecom&lc=IT&item_name=iOS%20Jailbreak%20Applications&currency_code=EUR&bn=PP%2dDonationsBF%3abtn_donate_LG%2egif%3aNonHosted"];
    [[UIApplication sharedApplication] openURL:url];
    
}
/*
-(void)snoozeTime:(PSSpecifier*)spec
{

    NSString *filePath = @"/var/mobile/Library/Preferences/com.apple.mobiletimer.plist"
    NSMutableDictionary *plistDict = [[NSMutableDictionary alloc] initWithContentsOfFile:filePath];
    
    [plistDict setValue:[NSNumber numberWithInt:100] forKey:@"TIMER_INTERVAL"];
    [plistDict writeToFile:filePath atomically: YES];
    
}
*/


@end

// vim:ft=objc
