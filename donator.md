返回捐赠者id为10的捐赠记录

```json
{
    "request": {
        "link":      "http://localhost:8080/mask_manage_project_war_exploded/donator/search",
        "body": {
            "method": "POST",
            "id": "10"
        }
    },
    "data": [
        {
            "donationamount": "10000",
            "donationid": 100,
            "donationname": "mask",
            "donationtime": 1592388781000,
            "fromdonatorid": 10,
            "resourceid": 1
        }
    ]
}
```



增加一条捐赠记录

```json
{
    "request": {
        "link": "http://localhost:8080/mask_manage_project_war_exploded/donator/new",
        "body": {
            "resourceId": "1",
            "donationName": "mask",
            "fromDonatorId": "10",
            "method": "POST",
            "donationId": "111",
            "donationAmount": "100",
            "donationTime": "2020-10-24 21:59:06"
        }
    },
    "data": [
        "success"
    ]
}
```
删除 捐赠记录 id为111的捐赠记录

```json
{
    "request": {
        "link": "http://localhost:8080/mask_manage_project_war_exploded/donator/delete",
        "body": {
            "method": "POST",
            "donationId": "111"
        }
    },
    "data": [
        "success"
    ]
}
```

捐赠者查询个人信息

```json
{
    "request": {
        "link": "http://localhost:8080/mask_manage_project_war_exploded/donator/information",
        "body": {
            "method": "POST",
            "donatorId": "10"
        }
    },
    "data": [
        {
            "donatorid": 10,
            "donatoridnum": "34122211119990099",
            "donatorname": "ccy",
            "donatorsigndate": 1591351812000,
            "donatortel": "18811099898",
            "donatoruserid": 10
        }
    ]
}
```



捐赠者修改个人信息  ：用户名和手机号

```json
{
    "request": {
        "link": "http://localhost:8080/mask_manage_project_war_exploded/donator/modify",
        "body": {
            "method": "POST",
            "donatorName": "zzz",
            "donatorId": "11",
            "donatorTel": "12345678910"
        }
    },
    "data": [
        "success"
    ]
}
```

查询捐赠者的快递信息

```json
{
    "request": {
        "link": "http://localhost:8080/mask_manage_project_war_exploded/donator/express",
        "body": {
            "method": "POST",
            "donatorid": "10"
        }
    },
    "data": [
        [
            {
                "amount": 10000,
                "expressapi": "kuaidiniao",
                "expressid": 647899001,
                "expresstitle": "kouzhao",
                "reqrid": 100,
                "type": 1
            },
            {
                "amount": 10000,
                "expressapi": "kuaidiniao",
                "expressid": 647899002,
                "expresstitle": "kouzhao",
                "reqrid": 100,
                "type": 1
            }
        ]
    ]
}
```

查询捐赠者的物资使用信息

```json
{
    "request": {
        "link": "http://localhost:8080/mask_manage_project_war_exploded/donator/used",
        "body": {
            "method": "POST",
            "donatorid": "10"
        }
    },
    "data": [
        [
            {
                "reqrhosid": 1,
                "reqrid": 100,
                "reqrname": "abc",
                "reqrstatus": 0,
                "reqrtime": 1591429809000,
                "reqstatus": "0",
                "reqtype": 1
            }
        ]
    ]
}



{
    "request": {
        "link": "http://localhost:8080/mask_manage_project_war_exploded/donator/hospital",
        "body": {
            "reqrHosId": "1",
            "method": "POST"
        }
    },
    "data": [
        {
            "hosid": 1,
            "hosidnum": "80001",
            "hoslocation": "asdfaf",
            "hosname": "asdfasfd",
            "hossigndate": 1590667263000,
            "hostel": "123456",
            "hosuserid": 1
        }
    ]
}

```

