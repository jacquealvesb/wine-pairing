# Wine Pairing
An app that finds wines that go well with a food.

## Goals
This project was developed to research and study about accessibility in mobile apps.

## Overview
With VoiceOver on             |  With VoiceControl on
:-------------------------:|:-------------------------:
![](https://user-images.githubusercontent.com/5198967/115094019-7b218280-9ef2-11eb-8eec-862f589cf5a0.mp4)  |  ![](https://user-images.githubusercontent.com/5198967/115094206-1d416a80-9ef3-11eb-8f56-b6a2e32d0ff9.mp4)

### Features
Give a food as input and receive:
- Types of wines that go well with that food
- Details about that matching
- Suggestions of wines and their ratings
- Share wine suggestion with friends

## Requirements
- iOS 14.2+
- Xcode 12.0+

### Running
To run the app on Xcode, you'll have to have a key for spoonacular API.
You can get one by creating an account at [spoonacular API website](https://spoonacular.com/food-api).

## Setup
### spoonacular API
After getting the key, you'll need to put it on the project so your app can use the API. Create a file called *Config.swift* on the *Support Files* folder. Write the code bellow replacing with your API key from spoonacular:

```swift
// Config.swift

let kSpoonacularApiKey = "YOUR API KEY"

```
### CocoaPods
1. Install CocoaPods. You can do it with `gem install cocoapods`
2. Update your pods with the command `pod install`
3. Open the project from the generated workspace (.xcworkspace file).

## License
MIT License

Copyright (c) 2020 Jacqueline Alves

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

## Author
Jacqueline Alves

LinkedIn: [jacquealvesb](http://linkedin.com/in/jacquealvesb/)
