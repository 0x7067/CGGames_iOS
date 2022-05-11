# Setup

## API KEY

Before running the app create a new file at the project's root directory called `Rawg-Info.plist`, with a field called `API_KEY` and populate it with your api key (you can get one [here](https://rawg.io/apidocs)) or use mine (`46f4de248b9e429d8fc990768688e85a` ) since this repository is private anyways.

### Example file

```
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
	<key>API_KEY</key>
	<string>46f4de248b9e429d8fc990768688e85a</string>
</dict>
</plist>
```

# Technical decisions

1. For loading remote images I’ve decided to use AsyncImage since it already caches resources that were already downloaded before
2. For the tab bar icons I’ve used SF Symbols 3, an iconography library provided by Apple
3. SwiftUI TabView unfortunately doesn’t keep the tab’s state when the user goes to a different tab so I’ve used StatefulTabView to work around that
4. Instead of fetching profile data from an API endpoint I fetched it directly from a json file
