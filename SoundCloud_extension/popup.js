//Функция, которая достает теги из хранилища, сортирует их, а затем соотносит со значениями кнопок в popup.html
function TakeTheTags(){
    helpmassive = [];
    resultmassive = [];
    anothermassive = [];
    chrome.storage.local.get(null, function (tags) {
        let allKeys = Object.keys(tags); //массив всех наименований тэгов (ключи)
        let allValues = Object.values(tags); //массив всех значений (сколько раз тэг был найден)

        //Сортируем полученный массив значений
        for (let i = 0; i < allKeys.length; i++) {
            helpmassive[i] = i;
        }

        for(let i = allValues.length-1 ; i > 0 ; i--){
            for(let j = 0 ; j < i ; j++){
                if(allValues[j] > allValues[j+1] ){
                    let tmp = allValues[j];
                    let tmpForHelpM = helpmassive[j];
                    allValues[j] = allValues[j+1];
                    helpmassive[j] = helpmassive[j+1];
                    allValues[j+1] = tmp;
                    helpmassive[j+1] = tmpForHelpM;
                }
            }
        }
        //сортируем массив наименований тэгов по массиву значений
        for(let i = 0; i < allValues.length; i++){
            anothermassive[i] = allKeys[helpmassive[i]];
        }
        anothermassive = anothermassive.reverse();

        //Соотносим отсортированный массив наименований с кнопками на popup странице
        for (let i = 0; i <=  9; i++){
            resultmassive[i] = document.getElementById(i.toString());
            if (anothermassive[i].value !== 'undefined') {
                resultmassive[i].value = anothermassive[i];
            }
        }
    });
}
TakeTheTags();
//Обновление тэгов
//Получаем кнопку, при нажатии на которую будут определяться 10 самых популярных тэгов
TopButton = document.getElementById('changeColor');
TopButton.onclick = function(){
    TakeTheTags();
}




