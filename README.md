# Keychain Helper

Installation
```
cordova plugin add https://github.com/sahajbhaikanhaiya/KeychainHelper.git
```

Setup Keychain (Required once)

```
window.KeychainHelper.setupKeychainWithServiceName("SampleService");
```

Save Key-Value in Keychain

```
var onSaveSuccess = function(result){
    console.log("Save Successful!!");
};

var onSaveFailure = function(error){
    console.log("Save Failed with error " + error);
};

window.KeychainHelper.saveValueInKeychain(onSaveSuccess,onSaveFailure,"SampleKey","SampleData");
```

Get Value From Keychain

```
var onGetSuccess = function(result){
    console.log("Get Successful!!);
    console.log("Value retrieved is " + result);
};

var onGetFailure = function(error){
    console.log("Get Failed with error " + error);
};

window.KeychainHelper.getValueFromKeychain(onGetSuccess,onGetFailure,"SampleKey");
```

Get All Keys From Keychain

```
var onGetAllKeysSuccess = function(result){
    alert("All keys stored in keychain : " + result);
};

window.KeychainHelper.getAllKeysFromKeychain(onGetAllKeysSuccess);
```

Remove Value From Keychain

```
 var onRemoveSuccess = function(result){
    console.log("Key - value Removed Successfully!!");
};

var onRemoveFailure = function(error){
    console.log("Remove key failed with error : " + error);
};

window.KeychainHelper.removeValueFromKeychain(onRemoveSuccess,onRemoveFailure,"SampleKey");
```