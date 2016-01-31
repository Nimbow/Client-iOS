# Nimbow iOS Client

This is the official iOS Client for the Nimbow API (<http://www.nimbow.com>).

You find the complete API documentation here: <https://www.nimbow.com/sms-api/nimbow-api/>

## Usage

1. Get a free Nimbow account
	1. Register: https://portal.nimbow.com/registration
	2. Grab your API Key: https://portal.nimbow.com/apisettings

2. Reference the client from your project ('client' project)

3. Adjust the configuration (info.plist)
	```XML
	<key>Nimbow.Api.Key</key>
	<string>INSERT_YOUR_API_KEY_HERE</string>
	```

4. Start sending SMS
	* asynchronous
	```Swift
	NimbowApiClientAsync.SharedInstance.SendSmsAsync(
      TextSms(
        from: "MyApp",
        to: "+4917123456789",
        text: "Hello World!"),
        completitionHandler : {
            // ...
        })
	```
	
## Configuration / Info.plist
* `Nimbow.Api.Url`: string, required, the URL pointing to the Nimbow API endpoint
* `Nimbow.Api.Key`: string, required, the API Key to use when communicating with the Nimbow API



## Samples

### iOS phone application
*iOS.xcodeproj*

This project shows you how easy you can achieve SMS sending from any iPhone / iPad application when you use *Nimbow API Client*.

#### Prerequisites
Before you start the example, at first put your API key into the info.plist.

You don't have an API Key, yet?

* **No problem**, get a Nimbow account for **free**: <https://portal.nimbow.com/registration>
* After registration copy your API key from here: <https://portal.nimbow.com/apisettings>
```XML
	<key>Nimbow.Api.Key</key>
	<string>INSERT_YOUR_API_KEY_HERE</string>
```

#### Try it
1. Start the project
2. Enter sender, reciever and text message
3. Click 'Send'
