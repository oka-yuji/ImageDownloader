# ImageDownloader

URLとタイムアウトの指定すると、タイムアウトで指定した時間内にImageを取得する事ができればImageを表示するSwift Package Managerです。

<img src="https://user-images.githubusercontent.com/56917591/140612420-54bacab0-d4e0-45f3-a2ac-7df9a04b8a84.jpg" width=50%>

# 使い方

XcodeのFileからAdd　Packages...にてSSHを入力して下さい。
git@github.com:yuujioka/ImageDownloader.git

その後importして下さい。

```swift
import ImageDownloader
```

後は以下のように使用する事ができます。

```swift
@State var image: UIImage?
var body: some View {
    VStack {
        if let downloadImage = image {
            Image(uiImage: downloadImage)
                .resizable()
                .aspectRatio(contentMode: .fit)
        }
    }
    .onAppear {
        downloadImage(url: URL(string: "取得したいImageのURL")!, timeOut: 3.0) { image in
            self.image = image
        }
    }
}
```

imeOut: 3.0 = 3.0秒です。
お好きな時間に設定して下さい。
