//
//  managerHandler.h
//  ChuckJour
//
//  Created by Timothy J on 21/07/14.
//  Copyright (c) 2014 timothy j. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Cocoa/Cocoa.h>
#import "VVOSC/VVOSC.h"

@interface managerHandler : NSObject{
    
    OSCManager * manager;
    OSCOutPort * outPort;
    OSCOutPort * manualoutPort;
    OSCInPort * inPort;
    
}
- (void)setupManualOutPort;
- (NSArray *) returnListOfOutputs;
- (NSArray *) returnListOfInputs;
- (int) returnOutport:(int) thePort;
- (int) returnInport:(int) thePort;
- (NSString *) returnAddressString: (int) thePort;

- (void)oscOutPortsChangedNotification:(NSNotification *)note;
- (void)inPort:(NSString *) withName : (int) withPort;




@end
