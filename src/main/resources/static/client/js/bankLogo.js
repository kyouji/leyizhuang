/**
 * 
 */
$(document).ready(function() {    
    $(".paymethod").click(function() {
        var $selectedItem = $(this);
        var payment_method = $selectedItem.find("input [name='payTypeId']");
        payment_method.trigger("select");
    });
    
    $("input [name='payTypeId']").select(function() {
        $.cookie('payMethod', $(this).val(), { expires: 7, path: '/' });
        $(".paymethod").removeClass("paymethodSelected");
        var $selectedItem = $(this).parent();
        $selectedItem.addClass("paymethodSelected");
    });
    
    var lastPaymentMethod = $.cookie('payMethod');
    if(lastPaymentMethod) {
        $("input [value='" + lastPaymentMethod + "']").trigger("select");
    }
    
    $("#expandBank").click(function() {
        $("#expandBank").hide();
        $("#hideBank").show();
        $(".moreclear").show();
        $(".morebank").show();
    });
    
    $("#hideBank").click(function() {
        $("#hideBank").hide();
        $("#expandBank").show();
        $(".moreclear").hide();
        $(".morebank").hide();
    });
});