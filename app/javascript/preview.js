window.addEventListener('DOMContentLoaded', function() {
  // ( document.getElementsByClassName( 'sell-btn' ) || document.URL.match( /edit/ ) )
  const sellBtn = document.getElementById( 'sell-btn' );
  console.log(sellBtn);
  if (!sellBtn) return null;
  // document.addEventListener('DOMContentLoaded', function(){
    const ImageList = document.getElementById('image-list');
    const ItemImage = document.getElementById('item-image');

    const imageContent = document.querySelector('img');
    imageContent.addEventListener('error',() => {
      　imageContent.style.display = 'none';
      });

    const createImageHTML = (blob) => {
       // 画像を表示するためのdiv要素を生成
      const imageElement = document.createElement('div');

      // 表示する画像を生成
      const blobImage = document.createElement('img');
      blobImage.setAttribute('src', blob);

      // 生成したHTMLの要素をブラウザに表示させる
      imageElement.appendChild(blobImage);
      ImageList.appendChild(imageElement);
    };

    ItemImage.addEventListener('change', function(e){
      // 画像が表示されている場合のみ、すでに存在している画像を削除する
      if (imageContent){
        imageContent.remove();
      }

      const file = e.target.files[0];
      const blob = window.URL.createObjectURL(file);

      createImageHTML(blob);
    });
  // });
});