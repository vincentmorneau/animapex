# AnimAPEX
[![APEX Plugin](https://cdn.rawgit.com/Dani3lSun/apex-github-badges/b7e95341/badges/apex-plugin-badge.svg)](https://cdn.rawgit.com/Dani3lSun/apex-github-badges)
a dynamic action plugin to easily animate any APEX component.

## Demo
[https://animapex.com](https://animapex.com)

## Install
Import the [plugin from the latest release](https://github.com/vincentmorneau/animapex/releases/latest) in your application.

## Plugin Attributes
Attribute | Description
--- | ---
Animation | Defines the type of animation to apply to the target component
Delay | Defines the delay in seconds. Default: 0
Duration | Defines the animation total duration in seconds. Default: varies depending on the animation
Iteration Count | Defines the number of times the animation is played. Default: 1

## Plugin Events
Attribute | Description
--- | ---
animapex-before | Event is triggered before the animation starts
animapex-after | Event is triggered after the animation is finished

## How to use
- Create a new Dynamic Action with your desired event
- As action choose "AnimAPEX [Plugin]"
- Choose best fitting plugin attributes
- Choose Affected Elements that the animation will apply to (Items, Buttons, Regions or jQuery Selectors)

## Changelog
[See complete changelog](changelog.md).

## License
MIT © [Vincent Morneau](http://vmorneau.me)
