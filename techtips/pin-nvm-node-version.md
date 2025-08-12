# pin nvm node version

Counterintuitively, `nvm use` node version does not remember that version beyond the current terminal session.

To persist the last used noe, set an alias, e.g. 
`nvm alias default 22.12`

and verify the node version using
`node -v`

in a new session.

Sources:
- [How can the default node version be set using NVM?](https://stackoverflow.com/questions/47190861/how-can-the-default-node-version-be-set-using-nvm)
- https://github.com/nvm-sh/nvm