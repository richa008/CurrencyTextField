#CurrencyTextField

The numbers that the user enters in the field are automatically formatted to display in the dollar amount format. For example, if the user enters the numbers 1 and 2, the text in the field is formatted to display $0.12 . If the user enters 3, 4, 5, 6 after that.. the field displays $1,234.56
<br>If the user presses the delete key, the text field displays $123.45

##Demo

![Alt text](Screenshots/CurrencyTextFieldExample.gif?raw=true "ExampleCurrency gif")

##Installation

**CocoaPods**


Add the dependency to your Podfile:

```
use_frameworks!

target TARGET_NAME do
    pod 'CurrencyTextField'
end    
```

Run pod install to install the dependencies.

**Source files**

Clone this repository or download it in zip-file. Then you will find source files under CurrencyTextField directory. Copy them to your project.

##Usage


Import CurrencyTextField and add it programatically to your view or add UITextField in your Storyboard, and then change the custom class to CurrencyTextField


![Alt text](Screenshots/CustomClassSelect.png?raw=true "Custom class")


```
 @IBOutlet weak var textField: CurrencyTextField!
 
 ```


##License

CurrencyTextField is released under the MIT license.
