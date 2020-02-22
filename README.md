# Moviewer
<p align="left">
    <img src="https://img.shields.io/badge/Swift-5.1-orange.svg" />
    <img src="https://img.shields.io/badge/Xcode-11.3.1-orange.svg" />
    <img src="https://img.shields.io/badge/platforms-iOS-brightgreen.svg?style=flat" alt="iOS" />
</p>

**Moviewer** is an application built with Apple's SwiftUI framework for the iOS platform that uses The Movie Database (TMDb) to list the latest releases and upcoming movies.

<p align="center">
    <img src="screenshots/home_screen.png" width="250" max-width="40%" alt="home screen screenshot" />
    <img src="screenshots/detail_screen.png" width="250" max-width="40%" alt="detail screen screenshot" />
</p>

## Prerequisites
- Xcode 11 or latest
- macOS 10.14.6 or latest

## Getting Started
- To run this project locally, please clone the repository executing the following command:
```
$ git clone https://github.com/victoroka/Moviewer.git
```
- Locate a file called ```Constants.swift``` and insert your API key:
```
struct Constants {
    static let API_KEY = "INSERT YOUR API KEY HERE"
}
```
