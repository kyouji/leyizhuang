<!DOCTYPE html>
<html lang="zh-CN" class="bgc-f3f4f6">
    <head>
        <meta charset="UTF-8">
        <meta name="keywords" content="">
        <meta name="copyright" content="" />
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
        <title>乐易装</title>
        <!-- css -->
        <link rel="stylesheet" type="text/css" href="css/my_base.css"/>
        <link rel="stylesheet" type="text/css" href="css/x_common.css"/>
        <link rel="stylesheet" type="text/css" href="css/x_my_wealth.css"/>
        <!-- 1-6新增CSS样式，放到《x_my_wealth.css》文件末尾即可 -->
        <style>
            .tixian {
                margin-top: 4%;
                border-top: 1px solid #ddd;
            }
            .tixian .inp_text {
                padding: 0 2%;
                width: 96%;
                height: 40px;
                line-height: 40px;
                background-color: #fff;
                border-bottom: 1px solid #ddd;
            }
            .tixian .inp_text label {
                float: left;
                width: 15%;
                text-align: center;
            }
            .tixian .inp_text .text {
                float: left;
                margin: 5px 0;
                width: 85%;
                height: 30px;
                line-height: 30px;
                border: none;
            }
            .tixian .inp_text .select {
                color: #666;
                background: url(img/x_icon_next.png) no-repeat right center;
                -webkit-background-size: auto 15px;
                background-size: auto 15px;
                -webkit-appearance:none;
                appearance:none;
                outline: none;
            }
            .tixian .money {
                margin-top: 4%;
                border-top: 1px solid #ddd;
            }
            .tixian .tips {text-align: center;}
            .tixian .tips span {color: #f60;}
        </style>
    </head>
    <body class="bgc-f3f4f6">
        <!-- 头部 -->
        <header>
            <a class="back" href="#"></a>
            <p>余额提现</p>
        </header>
        <!-- 头部 END -->
        
        <!-- 提现 -->
        <article class="tixian">
            <form>
                <div class="inp_text">
                    <label>姓名</label>
                    <input class="text" type="text" placeholder="收款人姓名">
                </div>
                <div class="inp_text">
                    <label>卡号</label>
                    <input class="text" type="text" placeholder="收款人储蓄卡号">
                </div>
                <div class="inp_text">
                    <label>银行</label>
                    <select class="text select">
                        <option>中国建设银行</option>
                        <option>中国工商银行</option>
                        <option>中国农业银行</option>
                    </select>
                </div>
                <div class="inp_text money">
                <label>金额</label>
                    <input class="text" type="text" placeholder="提现金额">
                </div>
                <input class="btn-submit-save" type="submit" value="下一步">
                <div class="tips">可提现余额：<span>250</span>元</div>
            </form>
        </article>
    <!-- 提现 END -->
    </body>
</html>