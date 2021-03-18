# ZetaSampleProject

Objective: Design a simple 3 screen app to fetch images from Google and display them in a list.

Screen 1: Search Screen. Users should be able to type in the search string for image query
Screen 2: The search results of the previous screen should be displayed in this list. The results should be displayed as images plus some metadata
Screen 3: On clicking of any of these images on the previous screen, more details of the image should be shown here.

APIs to be used:
curl -X GET \
'https://www.googleapis.com/customsearch/v1?q=harrypotterHYPERLINK "https://www.googleapis.com/customsearch/v1?q=harrypotter&cx=011476162607576381860:ra4vmliv9ti&key="&HYPERLINK "https://www.googleapis.com/customsearch/v1?q=harrypotter&cx=011476162607576381860:ra4vmliv9ti&key="cx=011476162607576381860:ra4vmliv9tiHYPERLINK "https://www.googleapis.com/customsearch/v1?q=harrypotter&cx=011476162607576381860:ra4vmliv9ti&key="&HYPERLINK "https://www.googleapis.com/customsearch/v1?q=harrypotter&cx=011476162607576381860:ra4vmliv9ti&key="key=<API KEY>' \
  -H 'Content-Type: application/json' \
  -H 'cache-control: no-cache’

Sample JSON Response
https://pastebin.com/6CqcVDZP
items[] -> pagemap -> cse_thumbnail[] -> width | height | src
items[] -> pagemap -> cse_image[] -> src

Please get your own API key from a separate Google project. AIzaSyAjTPFgulkdrELcWmo1jAa8wqtHLrztyKc

### Changes required here

-> ZetaAssignment -> ZetaAssignment -> Common -> AppConstant.swift

use your own key for AppKeysConstant -> KEY
