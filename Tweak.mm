#import <UIKit/UIKit2.h>
#import <SpringBoard/SpringBoard.h>
#import <CaptainHook/CaptainHook.h>

%hook SBRemoteLocalNotificationAlert

static BOOL IsMobileTimerAlarm(SBRemoteLocalNotificationAlert *self)
{
	return [[CHIvar(self, _app, SBApplication *) displayIdentifier] isEqualToString:@"com.apple.mobiletimer"];
}

- (void)configure:(BOOL)configure requirePasscodeForActions:(BOOL)actions
{
    if(IsMobileTimerAlarm(self))
    {
        UIAlertView *alertView = [self alertSheet];
        
        alertView.title = @"Alarm";
        alertView.cancelButtonIndex = nil;
        [alertView addButtonWithTitle:@"Snooze..."];
        [alertView addButtonWithTitle:@"Stop!"];
        [alertView setNumberOfRows:2];
    }
    else
    {
       %orig;
    }
    
}

%end