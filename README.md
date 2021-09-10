# Exposure VIC

This is a concept app that pulls data from the Victorian Government data resources to make it more accessible to where current COVID-19 exposure sites are.

## Why - what

Apple said developers can't submit COVID related apps to stop misinformation. But as a result, unless you're a health or government entity I can't submit it:

> **Guideline 5.1.1 - Legal - Privacy - Data Collection and Storage**<br>We found in our review that your app provides services or requires sensitive user information related to the COVID-19 pandemic. Since the COVID-19 pandemic is a public health crisis, services and information related to it are considered to be part of the healthcare industry. In addition, the seller and company names associated with your app are not from a recognized institution, such as a governmental entity, hospital, insurance company, non-governmental organization, or university.

So its here for you to install yourself.

### Requirements

- XCode (to open the project)
- iPhone iOS 14+

## Features

1. See exposure sites near you

1. See information about the site

1. Share the information with someone

1. See a list of exposure sites

1. Set up radius rings for travel borders

## Videos

### Mock up in Figma

<img src=".data/concept.gif" width="320" height="646"/>

## Progress

<img src=".data/progress.gif" width="320" height="646"/>

## Actual app

<img src=".data/actual.gif" width="320" height="646"/>


## Attributions

- [Data VIC: Exposure sites](https://discover.data.vic.gov.au/dataset/all-victorian-sars-cov-2-covid-19-current-exposure-sites/resource/afb52611-6061-4a2b-9110-74c920bede77)

### Data

Though the data comes from Data VIC, they don't provide the coordinates to exposure sites.

[Please find the repo where](https://github.com/markbattistella/exposure-vic-api) I parse the sites and geocode them with PositionStack.

It's not 100% perfect, so there are some manual fixes done, but if you want to help, it would be appreciated!
