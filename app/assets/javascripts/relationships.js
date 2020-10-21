$(document).on('turbolinks:load', function() {
    // $('.users_wrapper').hide();
    // $('.users_wrapper').on('click',function() {
    //     $('.'+$(this).attr('id')).toggle();
    //     // クリックした要素の ID と違うクラス名のセクションを非表示
    //     $('.users_wrapper').not($('.' + $(this).attr('id'))).hide();
    //     //   console.log("表示しない");
    //     // // クリックした要素の ID と同じクラスのセクションを表示
    //     $('.' + $(this).attr('id')).show();
    //     //   console.log("表示する");
    // });
    $(function(){
        $('.users_wrapper').hide();
        $('.secList').on('click',function(){
            // クリックした要素の ID と違うクラス名のセクションを非表示
            $('.users_wrapper').not($('.'+$(this).attr('id'))).hide();
            // クリックした要素の ID と同じクラスのセクションを表示
            $('.'+$(this).attr('id')).show();

            // toggle にすると、同じボタンを 2 回押すと非表示になる
            // $('.'+$(this).attr('id')).toggle();
        });
    });
});