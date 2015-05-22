/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
$("#zhaodajie").hide();
$("#other").hide();
$("#aidou_btn").click(function () {
    $("#aidou").show();
    $("#zhaodajie").hide();
    $("#other").hide();
});
$("#zhaodajie_btn").click(function () {
    $("#zhaodajie").show();
    $("#aidou").hide();
    $("#other").hide();
});
$("#other_btn").click(function () {
    $("#other").show();
    $("#aidou").hide();
    $("#zhaodajie").hide();
});
$("#order_btn").click(function () {
    $("#order").submit();
});

