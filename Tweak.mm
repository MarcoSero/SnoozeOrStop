#import <SpringBoard/SpringBoard.h>
#import <CaptainHook/CaptainHook.h>

%hook SBRemoteLocalNotificationAlert

static UIAlertView *alertView;

static inline BOOL IsMobileTimerAlarm(SBRemoteLocalNotificationAlert *self)
{
    
	return [[CHIvar(self, _app, SBApplication *) displayIdentifier] isEqualToString:@"com.apple.mobiletimer"];
    
}


- (void)configure:(BOOL)configure requirePasscodeForActions:(BOOL)actions
{
    
    NSDictionary *dict = [[NSDictionary alloc] initWithContentsOfFile:@"/var/mobile/Library/Preferences/com.marcosero.snoozeorstop.plist"];
    
    if(IsMobileTimerAlarm(self) && [[dict objectForKey:@"Enabled"] boolValue])
    {
        alertView = [self alertSheet];
        
        alertView.title = @"Alarm";
        alertView.cancelButtonIndex = [alertView addButtonWithTitle:@"Snooze..."];
        [alertView addButtonWithTitle:@"Stop!"];
        [alertView setNumberOfRows:2];
    }
    else
    {
        %orig;
    }
    
    [dict release];
    
}


- (void)noteVolumeOrLockPressed
{
    
    NSDictionary *dict = [[NSDictionary alloc] initWithContentsOfFile:@"/var/mobile/Library/Preferences/com.marcosero.snoozeorstop.plist"];
    
	if(IsMobileTimerAlarm(self) && [[dict objectForKey:@"Lock"] boolValue])
    {
        [self alertView:alertView clickedButtonAtIndex:1];
    }
    
    %orig;
    
    [dict release];
    
}

%end