/**
 *
 * Author: Marco Sero
 * Version: 0.1
 * Copyright 2011 Marco Sero
 *
 *  This file is part of SnoozeOrStop.
 
 SnoozeOrStop is free software; you can redistribute it and/or modify
 it under the terms of the GNU General Public License as published by
 the Free Software Foundation; either version 2 of the License, or
 (at your option) any later version.
 
 toSync is distributed in the hope that it will be useful,
 but WITHOUT ANY WARRANTY; without even the implied warranty of
 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 GNU General Public License for more details.
 
 You should have received a copy of the GNU General Public License
 along with toSync; if not, write to the Free Software
 Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
 */

#import <SpringBoard/SpringBoard.h>

%hook SBRemoteLocalNotificationAlert 

- (void)configure:(BOOL)configure requirePasscodeForActions:(BOOL)actions
{
	UIAlertView *alertView = [self alertSheet];
    
	alertView.title = @"Alarm";
	alertView.cancelButtonIndex = nil;
    [alertView addButtonWithTitle:@"Snooze..."];
	[alertView addButtonWithTitle:@"Stop!"];
	[alertView setNumberOfRows:2];
    
}

%end
