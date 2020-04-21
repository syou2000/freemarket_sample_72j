  $(function() {
    $('.sub_image').mouseover(function(){
    // "_thumb"を削った画像ファイル名を取得
    var selectedSrc = $(this).attr('src').replace(/^(.+)_thumb(\.gif|\.jpg|\.png+)$/, "$1"+"$2");
    
    // 画像入れ替え
    $('.main_image').stop().fadeOut(50,
    function(){
    $('.main_image').attr('src', selectedSrc);
    $('.main_image').stop().fadeIn(200);
    }
    );
    // サムネイルの枠を変更
    $(this).css({"border":"2px solid #3CCACE"});
    });
    
    // マウスアウトでサムネイル枠もとに戻す
    $('.sub_image').mouseout(function(){
    $(this).css({"border":""});
    });
  });