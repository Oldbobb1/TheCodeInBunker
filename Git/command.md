Команды Git 

* touch -> создает  любой файл 
* nano -> переход к файлу 

Пример: 
- touch .gitignore - создание 
- nano .gitignore - переход 


* git status -> показывает все что отслеживается 

* ls -la -> похож на git status 

* git pull origin main -> для слияния  удаленного с локальным (если локальный отстает )

* git push origin main --force -> для принудительного отправления (если были изменения в удаленном но они есть и в локальном но при этом в локальном больше изменений )


sudo scutil --set ComputerName "IronMac"
sudo scutil --set HostName "IronMac"
sudo scutil --set LocalHostName "IronMac"


git remote -v - проверка существующих удаленных репозитор 

git remote remove origin - удаление 

git fetch origin - получение последних изменений из удаленного

rm -fr .folder - удаление 

ls-a показ папок 