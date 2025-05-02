# Git commands 
- **touch** -> Creates any file.
- **nano** -> Link to the file<br> 

**Example**:
```
touch .gitignore
nano .gitignore
``` 
- **git status** -> Shows everything that is being tracked.
- **ls -la** -> Shows all files with additional information.
- **ls -a** ->  Shows all files, including hidden files (starting with a dot).
- **git pull origin main** -> to merge the remote with the local (if the local is lagging behind)
- **git push origin main --force** -> for forced sending (if there were changes in the remote but they are also in the local but the local has more changes )
- **git remote -v** -> Сheck existing remote repositories. 
- **git remote remove origin** -> Deletion. 
- **git fetch origin** -> Getting the latest changes from a remote repository. 
- **rm -fr .folder** -> Deletion. 

### Laptop name customization
- **sudo scutil --set ComputerName "IronMac"** -> Sets the computer name displayed in Sharing preferences.
- **sudo scutil --set HostName "IronMac"** -> Sets the hostname used for network communications.
- **sudo scutil --set LocalHostName "IronMac"** -> Sets the local hostname used for Bonjour services. 
