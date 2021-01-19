# Wine Pairing
An app that finds a wine that goes well with a food. Being developed to study and know more about accessibility in mobile apps.

## Interface

The planned interface can be found at [Figma](https://www.figma.com/file/GBMPwAFxXY2ocKImyMlKmy/Untitled).

## Getting Started

To run the app on Xcode, you'll have to have a key for spoonacular API.
You can get one by creating an account at [spoonacular API website](https://spoonacular.com/food-api).

## Running the app

After getting the key, you'll need to put it on the project so your app can use the API. Create a file called *Config.swift* on the *Support Files* folder. Write the code bellow replacing with your API key from spoonacular:

```swift
// Config.swift

let kSpoonacularApiKey = "YOUR API KEY"

```
