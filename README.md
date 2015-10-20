# JWStatusHUD
一个非常简单易用的状态栏指示器的小框架
## 显示成功信息
```objc
[JWStatusHUD showSuccess:@"加载数据成功!"];
```
## 显示失败信息
```objc
[JWStatusHUD showError:@"加载数据失败!"];
```
## 数据加载中...
```objc
[JWStatusHUD showLoading:@"数据加载中..."];
```
## 显示普通显示
```objc
[JWStatusHUD showText:@"普通信息"];
```
## 隐藏状态栏
```objc
[JWStatusHUD hide];
```
