# Use TableView to make a mini KEBUKE menu

![image](ScreenRecording.gif "Title")

Using `Google Apps Script` as menu data source. Remember to set the GAS API URL to Info.plist.

```
function doGet() {
  let menu = [
    {
      "name":"熟成歐蕾",
      "price": {
        "l": 65,
        "m": 55
      },
      "describe": "醇厚鮮奶交織經典紅茶的奶茶",
      "imgsrc": "https://www.kebuke.com/wp-content/uploads/2020/12/202307194058（熟成歐蕾）.jpg"
    },{
      "name":"冷露歐蕾",
      "price": {
        "l": 65,
        "m": 55
      },
      "describe": " 冬瓜熬煮的冬瓜露遇上醇厚鮮奶",
      "imgsrc": "https://www.kebuke.com/wp-content/uploads/2020/12/202307194077（冷露歐蕾）.jpg"
    },{
      "name":"白玉歐蕾",
      "price": {
        "l": 70,
        "m": 60
      },
      "describe": "醇厚鮮奶茶咀嚼著Ｑ彈白透珍珠",
      "imgsrc": "https://www.kebuke.com/wp-content/uploads/2020/12/202307194187（白玉歐蕾）.jpg"
    },{
      "name":"金蜜歐蕾",
      "price": {
        "l": 70,
        "m": 60
      },
      "describe": "奶與茶香四溢而蜂蜜藏在喉間裡",
      "imgsrc": "https://www.kebuke.com/wp-content/uploads/2023/09/202307194092（金蜜歐蕾）.jpg"
    },{
      "name": "黑蜜歐蕾",
      "price": {
        "l": 70,
        "m": 60
      },
      "describe": "茶與奶香背後藏匿的是恰如其分的餅香炒糖韻",
      "imgsrc": "https://www.kebuke.com/wp-content/uploads/2023/09/202307194094-1（黑密歐蕾）.jpg"
    },
  ]
  let jsonResponse = JSON.stringify(menu, null, 2);
  return ContentService.createTextOutput(jsonResponse).setMimeType(ContentService.MimeType.JSON);
}
```