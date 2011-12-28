//  TerminalSelTabOnBell.m
//  TerminalSelTabOnBell


#import <objc/runtime.h>
#import "TerminalSelTabOnBell.h"

@implementation NSObject (MySamplePlugin)

- (void) TerminalSelTabOnBell_emulatorDidBeep:(id)arg1
{ 
	NSNotification *nsn = arg1;
	NSObject *_controller, *_tab;
	object_getInstanceVariable(nsn.object, "_controller",(void**) &_controller);
	object_getInstanceVariable(_controller, "_tab", (void**) &_tab);
	//Select the TabViewItem with bell in it.
	[[(NSTabViewItem *)_tab tabView] selectTabViewItem:((NSTabViewItem *)_tab)];
	// Now bell
	[self TerminalSelTabOnBell_emulatorDidBeep:arg1];
}

@end

@implementation TerminalSelTabOnBell

+ (void) load
{
   	Class class = objc_getClass("TTView");
	Method emulatorDidBeep = class_getInstanceMethod(class, @selector(emulatorDidBeep:));
	Method TerminalSelTabOnBell_emulatorDidBeep = class_getInstanceMethod(class, @selector(TerminalSelTabOnBell_emulatorDidBeep:));
	method_exchangeImplementations(emulatorDidBeep, TerminalSelTabOnBell_emulatorDidBeep);
	NSLog(@"TerminalSelTabOnBell installed");
}

@end
