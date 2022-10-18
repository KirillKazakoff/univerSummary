window.setTimeout(function() {

    //Получаем значение кнопки(Like/Unlike), по нажатию получаем значение поля с тэгом
    const button = document.getElementsByClassName("sc-button-like sc-button sc-button-medium sc-button-responsive")[0];
    button.addEventListener(
        "click", function () {
            debugger;
            const tag = document.getElementsByClassName("sc-tag")[0].innerText.toLowerCase();
            //Если тэг не найден то возврат
            if (!tag) {
                console.log('tag was not found');
                return;
            }

            //Проверяем наличие в storage тэга
            chrome.storage.local.get(tag, function (value){
                if(button.title === 'Like' && value[tag] === undefined){
                    return false;
                }
                let sum = 0;
            //Проверяем значение нажатой кнопки(Like/Unlike), изменяем счетчик тэга
                if (value[tag] || value[tag] === 0) {
                    sum = value[tag];

                    if (button.title === 'Like'){
                        sum = sum - 2;
                    }
                }
                ++sum;
                //Заносим пару тэг:количество  в хранилище
                chrome.storage.local.set({[tag]: sum}, function(){
                    console.info(sum);
                });

            });
        },
        false
    );
}, 100);



/*var s = document.createElement('script');
s.src = chrome.extension.getURL('script.js');
(document.head||document.documentElement).appendChild(s);
s.onload = function() {
    s.parentNode.removeChild(s);
};
*/
