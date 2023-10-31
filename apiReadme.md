## api请求流程及返回结果

前端根据业务流程携带重要参数向后端服务器请求api，后端服务器返回json格式数据

前端微信小程序request文件：
model 数据层适配（目前由后端完成）
services 用于请求逻辑

后端服务器文件：
...

### 1 服务器参数

服务器地址：url: "____________________"
token携带方式：____________________  // 写在header.token或者header.Authorization或者data.token

### 2 用户登录（用户系统及登录规则由后端服务器制定）

2.1 使用场景：前端登录页面，用户输入用户名及密码，点击登录按钮

2.2 请求api：
```json5
    {
      "url": ,//url + "____________________",
      "header": {
        "Content-Type": "application/json"
      },
     "method": "POST",
      "data": {
        "Ename": Ename, // 企业名称
        "name": name, // 用户名
        "password": pass, // 用户密码
        "hash": "test"
      },
    }
```

2.3 返回数据：
```json5
    {
      "status": "100", // 后端约定状态，详见api状态列表
      "token": "token",
      "authority": "管理员",
      "nickname": "管理员",
      "avatar": "", // 头像链接
    }
```
### 3 查：企业数据

3.1 使用场景: 前端登录后进入目录页面，请求当前登录权限下的企业目录数据

3.2 请求api:
```json5
    {
      "url": url + "____________________",
      "header": {
        "Content-Type": "application/json"
      },
     "method": "GET",
      "data": {
        "Ename": Ename // 企业名称
      }
    }
```
3.3 返回数据：
```json5
  {
    "status": "100",
    "pro": "企业串码", // 企业英文串码（唯一），前端约定，详见项目代码表
    "src": "", // src1，前端约定，详见项目代码表
    "srcwhite": "", // src2，前端约定，详见项目代码表
    "data": [{ // 系统数据，数组元素34个省
      "name": "北京市", // 省名称
      "provincesid": "110000", // 省代码
      "alarmtotal": 0, // 报警总数
      "showtag": 1, // 固定
      "project": [{ // 系统数据，数组元素个数不限
        "name": "控制系统", // 名称
        "projectid": 2000, // 项目代码（唯一），前端约定，详见项目代码表
        "alarm": 0, // 报警标志位 0正常 1报警/信息提示
        "showtag": 1, // 固定
        "total": [{
          "id": 0,
          "text": "项目地点：" // 系统简介信息 数组元素个数不限
        }, ],
        "subsystem": [{
          "id": 0,
          "sys": "1#控制系统", // 子系统信息 数组元素个数不限
          "url": "/pages/information/pages/infor/infora/infora", // 子系统跳转连接，前端约定，详见项目代码表
          "text": [{
            "id": 0,
            "text": "1#设备系统" // 子系统信息 数组元素个数不限
          }, ],
        }, ],
      }, ]
    }, ]
  }
```
### 4 查：系统数据

4.1 使用场景：前端进入子系统页面，请求当前登录权限下的子系统详细数据（前端10s周期触发）

4.2 请求api：
```json5
    {
      "url": url + "____________________",
      "header": {
        "Content-Type": "application/json"
      },
     "method": "GET",
      "data": {
        "Ename": Ename
        "subsystem": subid, // 子系统id, 当前登录权限下能见subsystem子系统数据id
      },
    }
```
4.3 返回数据：
```json5
   {
      "status": "100",
      "authority": "100", // 数据修改权限 用户系统约定待定
      "htime": "2023-10-30 14:22:04", // 数据最后更新时间
      "result": {
        "data": {
          "dataSub": [], // 子系统数据，渲染结构数据及系统设备数据，前端约定，详见项目代码表（子系统2）
          "dataGain": [], // 子系统主页面渲染数据，前端约定，详见项目代码表（子系统2）
          "dataAlarm": [], // 子系统报警统计数据，前端约定，详见项目代码表（子系统2）
        }
      },
  }
```
### 5 子系统查：串码id查询详情数据

5.1 使用场景：利用id查询（前端用户点击触发，触发最小间隔3s），查询后配合api-8完整修改

5.2 请求api：
```json5
    {
      "url": url + "____________________",
      "header": {
        "Content-Type": "application/json"
      },
     "method": "GET",
      "data": {
        "Ename": Ename
        "id": id, // 子系统id, 当前登录权限下能见subsystem子系统数据id
      },
    }
```
5.3 返回数据：
```json5
   {
      "status": "100",
      "result": {
        "data": [{
              "alias": "数据名称",
              "val": "数据值"
          },
        ]
      },
  }
```
### 6 子系统查：单个数据历史记录

6.1 使用场景：利用id查询（前端用户点击触发，触发最小间隔3s）

6.2 数据查询/聚合规则

6.21 最大查询区间365天

6.22 时间聚合方式：平均值/首数据

6.23 时间聚合区间：小于7天按10分钟聚合，小于30天按1小时聚合，小于1年按天1天聚合，

6.24 时间聚合适用规则：时间聚合规则适用于服务器周期记录数据，不适用于用户触发服务器记录型数据

6.3 请求api：
```json5
    {
      "url": url + "____________________",
      "header": {
        "Content-Type": "application/json"
      },
     "method": "GET",
      "data": {
        "Ename": Ename
        "id": id, // 子系统id, 当前登录权限下能见subsystem子系统数据id
      },
    }
```
6.4 返回数据：
```json5
   {
      "status": "100",
      "result": {
        "data": [{
              "alias": "数据名称",
              "htime": "数据时间",
              "val": "数据值"
          },
        ]
      },
  }
```

### 7 子系统查：报警实时数据、历史记录

7.1 使用场景：利用id查询所有当前子系统下的实时及历史报警数据（前端用户点击触发，触发最小间隔3s）

7.2 请求api：
```json5
    {
      "url": url + "____________________",
      "header": {
        "Content-Type": "application/json"
      },
     "method": "GET",
      "data": {
        "Ename": Ename
        "id": id, // 子系统id, 当前登录权限下能见subsystem子系统数据id
      },
    }
```
7.3 返回数据：
```json5
  {
    "status": "100",
    "result": {
      "data": {
        "real": [{ //实时报警数据，数组元素个数不限
          "alias": "报警名称",
          "starttime": "开始时间",
        }, ],
        "history": [{ //历史报警数据，数组元素个数不限
          "alias": "报警名称",
          "starttime": "开始时间",
          "endtime": "开始时间",
        }, ],
      },
    },
  }
```
### 8 子系统改：修改参数（部分改）

8.1 使用场景：修改数据（前端用户点击触发，触发最小间隔3s）

8.2 请求api：
```json5
    {
      "url": url + "____________________",
      "header": {
        "Content-Type": "application/json"
      },
     "method": "PATCH",
      "data": {
        "Ename": Ename,
        "id": id, // 后端约定
        "putData": data, // api-5 子系统查：串码id查询数据 获取的数据修改后的部分数据
      },
    }
```
8.3 返回数据：
```json5
   {
      "status": "100",
    }
```
### 9 子系统删：删除数据（部分删除）

9.1 使用场景：利用id删除指定表下数据（前端用户点击触发，触发最小间隔3s）

9.2 请求api：
```json5
    {
      "url": url + "____________________",
      "header": {
        "Content-Type": "application/json"
      },
     "method": "DELETE",
      "data": {
        "Ename": Ename,
        "id": id, // 后端约定
      },
    }
```
9.3 返回数据：
```json5
   {
      "status": "100",
    }
```



