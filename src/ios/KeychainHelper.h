#import <Cordova/CDVPlugin.h>
#import "UICKeyChainStore.h"

@interface KeychainHelper : CDVPlugin{
    UICKeyChainStore *keychain ;
}

- (void) setupKeychainWithServiceName:(CDVInvokedUrlCommand *) command;
- (void) saveValueInKeychain: (CDVInvokedUrlCommand *) command;
- (void) getValueFromKeychain: (CDVInvokedUrlCommand *) command;
- (void) getAllKeysFromKeychain: (CDVInvokedUrlCommand *) command;
- (void) getAllItemsFromKeychain: (CDVInvokedUrlCommand *) command;
- (void) removeValueFromKeychain: (CDVInvokedUrlCommand *) command;

@end
