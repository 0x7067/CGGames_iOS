# Technical decisions

1. For loading remote images I’ve decided to use AsyncImage since it already caches resources that were already downloaded before
2. For the tab bar icons I’ve used SF Symbols 3, an iconography library provided by Apple
3. SwiftUI TabView unfortunately doesn’t keep the tab’s state when the user goes to a different tab so I’ve used StatefulTabView to work around that
4. Instead of fetching profile data from an API endpoint I fetched it directly from a json file
