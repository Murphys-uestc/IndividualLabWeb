// LeanCloud - 初始化 - 将这里的 APP_ID 和 APP_KEY 替换成自己的应用数据
// https://leancloud.cn/docs/sdk_setup-js.html#初始化
var APP_ID = 'aNzdPbcgVO2PH1T85wY8fwfI-gzGzoHsz';
var APP_KEY = 'kYDmRNhx31v3CJ3OogeHxnfr';
// 存储服务
AV.init({
    appId: APP_ID,
    appKey: APP_KEY
});
var Visit = AV.Object.extend('Visit');

function releaseNewVisit() {
    var email = '123@qq.com';
    var institution = '电子科技大学';

    // LeanCloud - 当前用户
    // https://leancloud.cn/docs/leanstorage_guide-js.html#当前用户

    // LeanCloud - 文件
    // https://leancloud.cn/docs/leanstorage_guide-js.html#文件

    // LeanCloud - 对象
    // https://leancloud.cn/docs/leanstorage_guide-js.html#数据类型
    var visit = new Visit();
    visit.set('email', email);
    visit.set('institution', institution);
    visit.save().then(function() {
        window.location.href = "./Home.html";
    }, function(error) {
        alert(JSON.stringify(error));
    });
};
$(function() {
    releaseNewVisit();
});