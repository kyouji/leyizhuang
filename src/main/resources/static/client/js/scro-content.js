$(function () {
    $(window).scroll(function () {
        var scrollTop = $(document).scrollTop();
        var documentHeight = $(document).height();
        var windowHeight = $(window).height();
        var contentItems = $(".column_right").find(".item");
        var currentItem = "";
        if ($("#item1").css("display") == "none") {
            return;
        }

        if (scrollTop + windowHeight == documentHeight) {
            currentItem = "#" + contentItems.last().attr("id");
        } else {
            contentItems.each(function () {
                var contentItem = $(this);
                var offsetTop = contentItem.offset().top;
                if (scrollTop > offsetTop - 100) {//此处的200视具体情况自行设定，因为如果不减去一个数值，在刚好滚动到一个div的边缘时，菜单的选中状态会出错，比如，页面刚好滚动到第一个div的底部的时候，页面已经显示出第二个div，而菜单中还是第一个选项处于选中状态
                    currentItem = "#" + contentItem.attr("id");
                }
            });
        }
        if (currentItem == "#item2") {
            return;
        }
        if (currentItem != $("#product_show_div").find(".sel").attr("href")) {
            $("#product_show_div").find(".sel").removeClass("sel");
            $("#product_show_div").find("[href=" + currentItem + "]").addClass("sel");
        }
    });
    $("#product_show_div a").bind("click", function () {
        var obj = $(this).attr("href");
        if (obj == "#item2") {
            $(".item").each(function () { $(this).hide(); });
            $("#product_show_div a").each(function () { $(this).removeClass("sel"); });
            $(obj).show();
            $(this).addClass("sel");
        } else {
            $(".item").each(function () { $(this).show(); });
            $("#item2").hide();
        }
    })
});