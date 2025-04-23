Работа с .gitignore 

1 - touch .gitignore создание 
2 - nano .gitignore - переход 

3 - перечисляем файлы и папки 

folder/ -> папка 
folder -> файл 
 
4 - Ctrl + X, затем Y и Enter

5 - git commit 
6 - git push 
 7 - git rm -r --cached перечисляем через пробел 

Пример: 
git rm -r -- cached folder/  file 

8 - git commit -m "Removed secret files from tracking"
9 - git push origin main  