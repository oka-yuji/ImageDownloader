# ImageDownloader

URLとタイムアウトの指定すると、タイムアウトで指定した時間内にImageを取得する事ができればImageを表示するSwift Package Managerです。

<img src="https://user-images.githubusercontent.com/56917591/140612420-54bacab0-d4e0-45f3-a2ac-7df9a04b8a84.jpg" width=50%>

# 使い方

XcodeのFileからAdd Packages...にてSSHを入力して下さい。

```
git@github.com:yuujioka/ImageDownloader.git
```

その後importして下さい。

```swift
import ImageDownloader
```

Imageの取得

```swift
downloadImage(url: URL(string: "取得したいImageのURL")!, timeOut: 3.0) { fetchImage in
   self.image = fetchImage
```

timeOut: 3.0 = 3.0秒です。
お好きな時間に設定して下さい。

使用例

```swift
let url = URL(string: "https://images.unsplash.com/photo-1635326332448-1cb32649925d?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=729&q=80")
@State var image: UIImage?

var body: some View {
    VStack {
        Text("取得したImage")
        if let downloadImage = image {
            Image(uiImage: downloadImage)
                .resizable()
                .aspectRatio(contentMode: .fit)
        }
    }
    .onAppear {
        downloadImage(url: url!, timeOut: 5) { fetchImage in
            self.image = fetchImage
        }
    }
}

```
