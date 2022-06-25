# apex-browser-detect
A plugin made to detect minimal browser requeriments for apex v20.x. 
Recently I developed an apex webapp for a client that has a lot of outdated pcs with old browsers. Users are not allowed to update it due to IT policies.
The issues reported for these cases were crazy: errors on validating nulls, login, calculated fields, etc...
We made this plugin to simplify the task for check  browser requeriments.
Ussage: 
1-Install plugin
2-On desired page create a onpageload Dynamic-Action
3-Add plugin to true action, it works with predefined standards, but you could change minimum version for most used browsers or disable less used browsers.
4-Enjoy ;-)

You can try demo version here:
https://apex.oracle.com/pls/apex/r/mygithub/github-tiabarca
user: demo
Password: demo1234
