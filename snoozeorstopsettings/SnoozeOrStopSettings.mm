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

-(void)respring:(PSSpecifier*)spec
{
    
    system("killall -9 SpringBoard");
    
}


@end

// vim:ft=objc
